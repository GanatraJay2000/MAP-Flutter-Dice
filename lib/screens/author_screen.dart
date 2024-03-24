import 'package:flutter/material.dart';

class AuthorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Author'),
      ),
      body: Center(
        child: Text(
          'Author: Your Name',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
