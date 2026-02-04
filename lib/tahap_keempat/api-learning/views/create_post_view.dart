import 'package:belajar_flutter/tahap_keempat/api-learning/viewmodels/post_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePostView extends StatefulWidget {
  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Post'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  //   FIXED
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'title...',
                  labelText: "title",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(
                  hintText: 'body...',
                  labelText: "body",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter a body';
                  }
                  return null;
                },
              ),SizedBox(height: 32),
              
              //   TAMBAHKAN TOMBOL CREATE
              Consumer<PostViewmodels>(
                builder: (context, viewModel, child) {
                  final response = viewModel.operationResponse;
                  
                  if (response.isLoading) {
                    return CircularProgressIndicator();
                  }
                  
                  return ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        viewModel.createPost(
                          _titleController.text,
                          _bodyController.text,
                        );
                      }
                    },
                    child: Text('Create Post'),
                  );
                },
              ),
              //   TAMBAHKAN FEEDBACK SUCCESS/ERROR
              Consumer<PostViewmodels>(
                builder: (context, viewModel, child) {
                  final response = viewModel.operationResponse;
                  
                  if (response.hasData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Post created successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      viewModel.resetOperationState();
                      // Clear form setelah berhasil
                      _titleController.clear();
                      _bodyController.clear();
                    });
                  }
                  
                  if (response.hasError) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Error: ${response.error}',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}