import 'package:belajar_flutter/tahap_keempat/api-learning/viewmodels/post_viewmodels.dart';
import 'package:belajar_flutter/tahap_keempat/api-learning/widgets/loading_indikator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/post_item.dart';
import 'post_detail_view.dart';
import 'update_post_view.dart';

// View untuk menampilkan list posts (GET request)
// View hanya bertanggung jawab untuk:
// 1. Menampilkan UI
// 2. Menangani user interactions
// 3. Mengonsumsi data dari ViewModel
class PostListView extends StatefulWidget {
  const PostListView({super.key});

  @override
  State<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  @override
  void initState() {
    super.initState();
    // Lifecycle: initState -> fetch data -> build UI
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<PostViewmodels>(context, listen: false);
      viewModel.fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Posts - GET Method'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Trigger GET request untuk refresh data
              Provider.of<PostViewmodels>(context, listen: false).fetchPosts();
            },
          ),
        ],
      ),
      body: Consumer<PostViewmodels>(
        builder: (context, viewModel, child) {
          final response = viewModel.postsResponse;
          response.data?.take(20);
          if (response.isLoading) {
            return LoadingIndicator();
          }

          if (response.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${response.error}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => viewModel.fetchPosts(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (!response.hasData || response.data!.isEmpty) {
            return const Center(child: Text('No posts available'));
          }

          return ListView.builder(
            itemCount: response.data!.length,
            itemBuilder: (context, index) {
              final post = response.data![index];
              return PostItem(
                post: post,
                onTap: () {
                  // Navigasi ke detail view dengan GET by ID
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetailView(postId: post.id),
                    ),
                  );
                },
                onEdit: () {
                  // Navigasi ke update view
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdatePostView(post: post),
                    ),
                  );
                },
                onDelete: () {
                  // DELETE request
                  _showDeleteDialog(context, post.id, viewModel);
                },
              );
            },
          );
        },
      ),
    );
  }

  void _showDeleteDialog(
    BuildContext context,
    int postId,
    PostViewmodels viewModel,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Post'),
        content: const Text('Are you sure you want to delete this post?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              viewModel.deletePost(postId);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
