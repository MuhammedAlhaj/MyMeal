import 'package:flutter/material.dart';

class NetworkErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, size: 50, color: Colors.red),
          SizedBox(height: 16),
          Text(
            'No Internet Connection',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // إعادة المحاولة لجلب البيانات
              // يمكن إضافة منطق لإعادة جلب البيانات هنا
            },
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }
}