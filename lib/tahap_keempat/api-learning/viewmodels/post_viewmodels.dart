// ViewModel dalam MVVM:
// 1. Menyimpan state aplikasi
// 2. Menangani business logic
// 3. Berkomunikasi dengan repository
// 4. Memberikan data yang sudah diproses ke View
// 5. Tidak tahu tentang UI components

import 'package:belajar_flutter/tahap_keempat/api-learning/models/api_response.dart';
import 'package:belajar_flutter/tahap_keempat/api-learning/models/post_model.dart';
import 'package:belajar_flutter/tahap_keempat/api-learning/repositories/post_repository.dart';
import 'package:flutter/material.dart';

class PostViewmodels extends ChangeNotifier {
  final _repository = PostRepository();

  // stte manajemen untuk berbagi operasi
  // disini untuk mendapatkn response array dari posts

  ApiResponse<List<Post>> _postsResponse = ApiResponse();

  // ini untuk mendapatkan response tunggal dari post
  ApiResponse<Post> _postResponse = ApiResponse();

  // ini untk operasi aja

  ApiResponse<void> _operationResponse = ApiResponse();

  // nah disini kita buatkna getter untuk mengakses property dari si state state ini

  ApiResponse<List<Post>> get postsResponse => _postsResponse;
  ApiResponse<Post> get postResponse => postResponse;
  ApiResponse<void> get operationResponse => operationResponse;

  // Method untuk mengambil semua posts (GET)
  // disini ga usah pakai return, karena kita hanya inign untuk memasukannya
  // kedalam variable state
  Future<void> fetchPosts() async {
    // nah jaid nanti si _postsResponse ini akna punya atribut .isLoading

    _postsResponse = ApiResponse.loading();
    notifyListeners();

    try {
      final posts = await _repository.getAllPosts();
      _postsResponse = ApiResponse.success(posts);
      print(_postsResponse);
    } catch (e) {
      _postsResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> fetchPostById(int id) async {
    _postResponse = ApiResponse.loading();

    notifyListeners();

    try {
      final post = await _repository.getPostById(id);
    } catch (e) {
      _postResponse = ApiResponse.error(e.toString());
    }
  }

  Future<void> createPost(String title, String body) async {
    _operationResponse = ApiResponse.loading();
    notifyListeners();

    try {
      final newPost = Post(
        id: 0, // ID akan digenerate oleh server
        userId: 1, // Contoh user ID
        title: title,
        body: body,
      );

      await _repository.createPost(newPost);

      // disni kita tetep pakai apiresponse.succes meskipun null
      // karena agar kita bisa memberhentikan si loadingnya

      _operationResponse = ApiResponse.success(null);
    } catch (e) {
      _operationResponse = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }

  Future<void> updateFullPost(Post post) async {
    _operationResponse = ApiResponse.loading();

    try {
      await _repository.updatePost(post);
      _operationResponse = ApiResponse.success(null);

      // setelah update, kita refresh lagi fetchpostnya
      // jadi fetch ulang

      await fetchPosts();
    } catch (e) {
      _operationResponse = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }

  Future<void> patchPost(int id, Map<String, dynamic> data) async {
    _operationResponse = ApiResponse.loading();

    try {
      await _repository.patchPost(id, data);
      _operationResponse = ApiResponse.success(null);

      // disni kita fetch algi
      await fetchPosts();
    } catch (e) {
      _operationResponse = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }

  Future<void> deletePost(int id) async {
    _operationResponse = ApiResponse.loading();

    try {
      await _repository.deletePost(id);
      _operationResponse = ApiResponse.success(null);
      await fetchPosts();
    } catch (e) {
      _operationResponse = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }

  // fungsi untuk reset _operationResponse

  void resetOperationState() {
    _operationResponse = ApiResponse();
    notifyListeners();
  }
}
