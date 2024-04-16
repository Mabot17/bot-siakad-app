import 'package:flutter/material.dart';
import 'package:admin_flutter/pages/home_page.dart';
import 'package:admin_flutter/pages/register_page.dart';
import 'package:admin_flutter/pages/settings_page.dart';
import 'package:admin_flutter/routes/api_routes.dart'; // Import api_routes
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  // Controller untuk input username dan password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bot | Siakad'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            Text(
              'Bot | Siakad',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),

            // Form Login
            TextField(
              controller:
                  _usernameController, // Menggunakan TextEditingController untuk input username
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller:
                  _passwordController, // Menggunakan TextEditingController untuk input password
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Panggil metode autentikasi dari ApiService saat tombol login ditekan
                _handleLogin(context);
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Don\'t have an account? Register here'),
            ),

            // Footer
            Spacer(),
            Text(
              'Footer - © 2024 MyApp',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;

      print('username: $username'); // Mencetak pesan kesalahan ke terminal
      print('password: $password'); // Mencetak pesan kesalahan ke terminal

    ApiRoutes.login(username, password).then((token) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }).catchError((error) {
      print('Error: $error'); // Mencetak pesan kesalahan ke terminal
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to login. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    });
  }
}
