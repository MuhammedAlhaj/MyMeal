import 'package:flutter/material.dart';

/// A widget that displays an error message with a red error icon.
///
/// This widget is typically used when an error occurs, such as when data cannot
/// be fetched or processed.
class ErrorWidget extends StatelessWidget {
  /// The error message to display.
  final String message;

  /// Constructor to initialize the [ErrorWidget] with a required [message].
  ErrorWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display a red error icon.
          Icon(Icons.error, size: 50, color: Colors.red),
          SizedBox(height: 16),
          // Display the error message.
          Text(
            message,
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
