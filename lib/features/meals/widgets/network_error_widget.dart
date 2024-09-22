import 'package:flutter/material.dart';

/// A widget that displays a network error message and a retry button.
///
/// This widget is used when there is no internet connection, allowing the user
/// to retry fetching the data.
class NetworkErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display a red WiFi off icon.
          Icon(Icons.wifi_off, size: 50, color: Colors.red),
          SizedBox(height: 16),
          // Display a message indicating no internet connection.
          Text(
            'No Internet Connection',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
          SizedBox(height: 16),
          // Display a retry button for the user to attempt fetching data again.
          ElevatedButton(
            onPressed: () {
              // Add logic to retry fetching the data here
            },
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }
}
