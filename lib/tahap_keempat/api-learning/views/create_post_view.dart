import 'package:flutter/material.dart';

class CreatePostView extends StatefulWidget {
  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  // disni kita definisikan si key dari form agar bisa kia akses si formny

  final formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  // disni kia juga override ketika sudha pndah halaman
  // kan akna di dispose maka kita sekalian dispose si controllernya ini

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
        padding: EdgeInsetsGeometry.all(16),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter a body';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
               
            ],
          ),
        ),
      ),
    );
  }
}
