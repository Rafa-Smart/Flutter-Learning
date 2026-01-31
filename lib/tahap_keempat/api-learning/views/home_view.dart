import 'package:belajar_flutter/tahap_keempat/api-learning/views/create_post_view.dart';
import 'package:belajar_flutter/tahap_keempat/api-learning/views/post_list_view.dart';
import 'package:flutter/material.dart';

// Home View - Entry point aplikasi
// Bertanggung jawab untuk navigasi antara berbagai screen
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Methods Tutorial'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostListView()),
                );
              },
              child: const Text('GET All Posts'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePostView()),
                );
              },
              child: const Text('POST - Create New'),
            ),
          ],
        ),
      ),
    );
  }
}
