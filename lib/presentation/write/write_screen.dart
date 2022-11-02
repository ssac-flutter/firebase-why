import 'dart:math';

import 'package:firebase_why/presentation/write/write_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({Key? key}) : super(key: key);

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final inputTextController = TextEditingController();

  @override
  void dispose() {
    inputTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WriteViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('글쓰기'),
      ),
      body: Column(
        children: [
          TextField(
            controller: inputTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              suffixIcon: IconButton(
                onPressed: () => viewModel.write(
                    inputTextController.text, '${Random().nextDouble()}'),
                icon: const Icon(Icons.send),
              ),
              hintText: '글을 쓰세요',
            ),
          ),
        ],
      ),
    );
  }
}
