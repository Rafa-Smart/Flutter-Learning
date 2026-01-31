// Repository pattern: Layer antara service dan viewmodel
// Bertanggung jawab untuk:
// 1. Mengambil data dari API service
// 2. Mapping data ke model
// 3. Menyediakan data yang sudah diproses ke viewmodel

// jdi disni tuh isinya seperti fugnsi fugnis gitu lah untuk si viewmodelnya

import 'package:belajar_flutter/tahap_keempat/api-learning/models/post_model.dart';
import 'package:belajar_flutter/tahap_keempat/api-learning/services/api_exceptions.dart';
import 'package:belajar_flutter/tahap_keempat/api-learning/services/api_service.dart';

class PostRepository {
  // retrhow artinya itu kita melempar ulang errornya ke atas /
  // Melempar ulang error yang barusan ditangkap, jadi kaya
  // Saya tidak menyelesaikan error ini, silakan lanjutkan ke layer di atas
  // throw e	Stack trace di-reset
  // rethrow	Stack trace ASLI dipertahankan
  // https://chatgpt.com/c/697d7785-9fd8-8324-9a22-7d6ba16f4060
  // ini pnjelasnanya, cari aja di pertanayan ke 4 dari awal

  // dan arti dari on ApiException itu adalah
  // kita hanya menangkap error yang bertipe ApiException saja,
  // jadi Error lain tidak akan masuk ke sini

  final ApiService apiService = ApiService();

  // disni kti membut fungi untk menambil data semua post

  Future<List<Post>> getAllPosts() async {
    try {
      final response = await apiService.get('/posts');

      List<Post> posts = [];

      if (response is List) {
        posts = response.map((data) => Post.fromJson(data)).toList();
      }
      return posts;
    } on ApiException catch (e) {
      // nah jaid disni itu error ayng ada di service, kita kirim atau lempar ulang lagi
      // ke viewmodelnya, dna jadi nanti stacktracenya itu tetap terjaga
      // dan tetap stacktrace aslinya yaitu dari service
      rethrow;
    }
  }

  Future<Post> getPostById(int id) async {
    try {
      final response = await apiService.get('/posts/$id');

      return Post.fromJson(response);
    } on ApiException {
      rethrow;
    }
  }

  Future<Post> createPost(Post post) async {
    try {
      final response = await apiService.post('/posts', {
        "userId": post.userId,
        "title": post.title,
        "body": post.body,
      });
      return Post.fromJson(response);
    } on ApiException {
      rethrow;
    }
  }

  // ini utuk update semanya enkap jadi akan pakai put
  Future<Post> updatePost(Post post) async {
    try {
      final response = await apiService.put('/posts/${post.id}', {
        "title": post.title,
        'body': post.body,
        "userId": post.userId,
      });

      // ini tuh udha jadi json ya kan asalhnya stirng lalu di ubah jadi json
      // di method _handleResponse di apiService
      return Post.fromJson(response);
    } on ApiException {
      rethrow;
    }
  }

  Future<Post> patchPost(int id, Map<String, dynamic> data) async {
    try {
      final response = await apiService.patch("/posts/$id", data);

      return Post.fromJson(response);
    } on ApiException {
      rethrow;
    }
  }

  Future<void> deletePost(int id) async {
    try {
      await apiService.delete('posts/$id');
    } on ApiException {
      rethrow;
    }
  }
}
