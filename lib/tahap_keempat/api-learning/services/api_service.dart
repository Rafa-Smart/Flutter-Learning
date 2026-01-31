// Service layer yang bertanggung jawab untuk komunikasi langsung dengan API
// Layer ini hanya fokus pada HTTP requests dan responses

import 'dart:convert';

import 'package:belajar_flutter/tahap_keempat/api-learning/services/api_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // disni kita akan membuat fungsi untuk melakukan get post

  static String baseUrl = "https://jsonplaceholder.typicode.com";
  static const Duration timeoutDuration = Duration(seconds: 30);

  // ingat ya untuk put, patch dan delete itu nantinya di endpointnya sudah
  // di tambahin id nya ya sesuai data yang mau di ubah atau di hapus

  // disni pertama
  // GET Request - Untuk mengambil data dari server
  // Lifecycle: Client request -> Server process -> Response data
  // Fungsi: Mengambil data tanpa mengubah state di server

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse(baseUrl + endpoint);

    try {
      // jadi nanati kalo ga ada response dalam waktu 30 detik
      // maka akan otomatis lempar error timeout
      final response = await http.get(url).timeout(timeoutDuration);
      return _handleResponse(response);
    } catch (e) {
      _handleError(error: e);
    }
  }

  // POST Request - Untuk membuat resource baru di server
  // Lifecycle: Client send data -> Server create -> Response with new resource
  // Fungsi: Create operation (membuat data baru)
  // Note: POST bersifat non-idempotent (setiap request bisa hasil berbeda)
  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse(baseUrl + endpoint);

    try {
      final response = await http
          .post(
            url,
            headers: {"Content-Type": "application/json; charset=UTF-8"},
            // nah disini itu kita ubah dari map ke json string untuk di kirim ke server
            body: jsonEncode(data),
          )
          .timeout(timeoutDuration);
      return _handleResponse(response);
    } catch (e) {
      _handleError(error: e);
    }
  }

  // PUT Request - Untuk mengupdate seluruh resource
  // Lifecycle: Client send complete data -> Server replace -> Response updated resource
  // Fungsi: Update seluruh data (full update)
  // Note: PUT bersifat idempotent (multiple same requests = same result)
  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse(baseUrl + endpoint);
    try {
      final response = await http
          .put(
            url,
            headers: {"Content-Type": "application/json; charset=UTF-8"},
            // nah disini itu kita ubah dari map ke json string untuk di kirim ke server
            body: jsonEncode(data),
          )
          .timeout(timeoutDuration);

      return _handleResponse(response);
    } catch (e) {
      _handleError(error: e);
    }
  }

  // PATCH Request - Untuk mengupdate sebagian resource
  // Lifecycle: Client send partial data -> Server update fields -> Response updated resource
  // Fungsi: Update parsial data (partial update)
  // Note: PATCH tidak selalu idempotent

  Future<dynamic> patch(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse(baseUrl + endpoint);
    try {
      final response = await http
          .patch(
            url,
            headers: {"Content-Type": "application/json; charset=UTF-8"},
            body: jsonEncode(data),
          )
          .timeout(timeoutDuration);
      return _handleResponse(response);
    } catch (e) {
      _handleError(error: e);
    }
  }

  // disini ktia buat fungsi untuk delete data
  Future<dynamic> delete(String endpoint) async {
    final url = Uri.parse(baseUrl + endpoint);

    try {
      final response = await http.delete(url).timeout(timeoutDuration);
      return _handleResponse(response);
    } catch (e) {
      _handleError(error: e);
    }
  }
}

// disin ktia akna handle si response nya di service ini

// menggunakan fungsi
dynamic _handleResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      // nah jaid kalo succes maka kit parsing data string ke bentuk json
      return jsonDecode(response.body);
    case 400:
      throw BadRequestException('Bad Request: ${response.body}');
    case 401:
      throw UnauthorzedException("Unauthorized: '${response.body}'");
    case 404:
      throw NotFoundException("Not Found: '${response.body}'");
    case 500:
      throw ServerException("Internal Server Error: '${response.body}'");
    default:
      throw ApiException('Unexpected Error: ${response.statusCode}');
  }
}

// | Fungsi            | Menangani error jenis apa?                |
// | ----------------- | ----------------------------------------- |
// | `_handleResponse` |  **Server MERESPON tapi hasilnya error** |
// | `_handleError`    |  **Request GAGAL sebelum ada response**  |

// lalu disni kita akn mmebuat fungsi untu handle error

// jadi fugsi ini tuh ada untuk menangani error yang terjadi sebelum ada response dari server
// misalnya jaringan putus, timeout, dsb
// dan Request tidak pernah sampai server
// jadi Tidak ada response
// https://chatgpt.com/c/697d7785-9fd8-8324-9a22-7d6ba16f4060
// itu lihat aja di pertanyaan ke tiga dari awal

void _handleError({dynamic error}) {
  if (error is http.ClientException) {
    throw NetworkException('Network Error: ${error.message}');
  } else if (error is TimeoutException) {
    throw TimeoutException('Request Timed Out');
  } else {
    throw ApiException('Unexpected Error: ${error.toString()}');
  }
}
