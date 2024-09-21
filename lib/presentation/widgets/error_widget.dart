import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String message;

  ErrorWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 50, color: Colors.red),
          SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ],
      ),
    );
  }
}