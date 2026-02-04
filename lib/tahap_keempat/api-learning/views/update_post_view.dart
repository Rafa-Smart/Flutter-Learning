import 'package:belajar_flutter/tahap_keempat/api-learning/viewmodels/post_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post_model.dart';

class UpdatePostView extends StatefulWidget {
  final Post post;

  const UpdatePostView({
    super.key,
    required this.post,
  });

  @override
  State<UpdatePostView> createState() => _UpdatePostViewState();
}

class _UpdatePostViewState extends State<UpdatePostView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _bodyController;
  bool _hasHandledSuccess = false;

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

  void _handleSuccess(BuildContext context, PostViewmodels viewModel) {
    if (_hasHandledSuccess) return;
    _hasHandledSuccess = true;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Post updated successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    viewModel.resetOperationState();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Update Post (PUT / PATCH)'),
      ),
      body: Consumer<PostViewmodels>(
        builder: (context, viewModel, _) {
          final response = viewModel.operationResponse;

          if (response.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _handleSuccess(context, viewModel);
            });
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Title cannot be empty';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  /// BODY
                  TextFormField(
                    controller: _bodyController,
                    decoration: const InputDecoration(
                      labelText: 'Body',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Body cannot be empty';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 32),

                  /// ERROR MESSAGE
                  if (response.hasError)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        response.error.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                  /// LOADING
                  if (response.isLoading)
                    const Center(child: CircularProgressIndicator()),

                  /// BUTTONS
                  if (!response.isLoading)
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) return;

                              final updatedPost = widget.post.copyWith(
                                title: _titleController.text,
                                body: _bodyController.text,
                              );

                              viewModel.updateFullPost(updatedPost);
                            },
                            child: const Text('PUT - Full Update'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) return;

                              final updates = <String, dynamic>{};

                              if (_titleController.text != widget.post.title) {
                                updates['title'] = _titleController.text;
                              }
                              if (_bodyController.text != widget.post.body) {
                                updates['body'] = _bodyController.text;
                              }

                              if (updates.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('No changes detected'),
                                  ),
                                );
                                return;
                              }

                              viewModel.patchPost(widget.post.id, updates);
                            },
                            child: const Text('PATCH - Partial Update'),
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: 24),

                  // NOTE
                  // NOTE
                  // NOTE
                  // NOTE
                  // NOTE
                  const Text(
                    'Note:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),  
                  const SizedBox(height: 4),
                  const Text('• PUT replaces the entire resource'),
                  const Text('• PATCH updates only changed fields'),
                  const Text('• Both methods are idempotent'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
