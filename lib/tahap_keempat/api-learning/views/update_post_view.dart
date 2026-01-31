import 'package:belajar_flutter/tahap_keempat/api-learning/models/post_model.dart';
import 'package:belajar_flutter/tahap_keempat/api-learning/viewmodels/post_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// View untuk update post (PUT dan PATCH methods)
class UpdatePostView extends StatefulWidget {
  final Post post;

  const UpdatePostView({super.key, required this.post});

  @override
  State<UpdatePostView> createState() => _UpdatePostViewState();
}

class _UpdatePostViewState extends State<UpdatePostView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _bodyController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.post.title);
    _bodyController = TextEditingController(text: widget.post.body);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Post - PUT/PATCH Methods'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter body text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              Consumer<PostViewmodels>(
                builder: (context, viewModel, child) {
                  final response = viewModel.operationResponse;
                  
                  if (response.isLoading) {
                    return const CircularProgressIndicator();
                  }
                  
                  if (response.hasError) {
                    return Column(
                      children: [
                        Text(
                          'Error: ${response.error}',
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }
                  
                  if (response.hasData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Post updated successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      viewModel.resetOperationState();
                      Navigator.pop(context);
                    });
                  }
                  
                  return Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // PUT request - Update seluruh data
                              final updatedPost = widget.post.copyWith(
                                title: _titleController.text,
                                body: _bodyController.text,
                              );
                              viewModel?.updateFullPost(updatedPost);
                            }
                          },
                          child: const Text('PUT - Full Update'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // PATCH request - Update hanya jika ada perubahan
                              final updates = <String, dynamic>{};
                              
                              if (_titleController.text != widget.post.title) {
                                updates['title'] = _titleController.text;
                              }
                              
                              if (_bodyController.text != widget.post.body) {
                                updates['body'] = _bodyController.text;
                              }
                              
                              if (updates.isNotEmpty) {
                                viewModel.patchPost(widget.post.id, updates);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('No changes to update'),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text('PATCH - Partial Update'),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Note:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('• PUT replaces the entire resource'),
                    Text('• PATCH updates only provided fields'),
                    Text('• Both are idempotent operations'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}