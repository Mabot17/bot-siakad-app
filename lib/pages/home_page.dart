import 'package:flutter/material.dart';
import 'package:admin_flutter/utils/app_settings.dart'; // Import class AppSettings

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Home Page!',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20),
            Text(
              'URL: ${AppSettings.appBaseUrl}', // Menampilkan token
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
