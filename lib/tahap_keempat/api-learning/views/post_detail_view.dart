import 'package:belajar_flutter/tahap_keempat/api-learning/viewmodels/post_viewmodels.dart';
import 'package:belajar_flutter/tahap_keempat/api-learning/widgets/loading_indikator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

// View untuk menampilkan detail post (GET by ID)
class PostDetailView extends StatefulWidget {
  final int postId;

  const PostDetailView({super.key, required this.postId});

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  @override
  void initState() {
    super.initState();
    // Lifecycle: initState -> fetch single post data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<PostViewmodels>(context, listen: false);
      viewModel.fetchPostById(widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Detail - GET by ID')),
      body: Consumer<PostViewmodels>(
        builder: (context, viewModel, child) {
          final response = viewModel.postResponse;

          if (response.isLoading) {
            return    LoadingIndicator();
          }

          if (response.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${response.error}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => viewModel.fetchPostById(widget.postId),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (!response.hasData) {
            return const Center(child: Text('Post not found'));
          }

          final post = response.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(post.body, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    Text(
                      'Post ID: ${post.id}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'User ID: ${post.userId}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
