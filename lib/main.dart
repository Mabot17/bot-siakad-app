import 'package:flutter/material.dart';
import 'package:admin_flutter/pages/login_page.dart';
import 'package:admin_flutter/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bot | Siakad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppStartup(),
    );
  }
}

class AppStartup extends StatefulWidget {
  @override
  _AppStartupState createState() => _AppStartupState();
}

class _AppStartupState extends State<AppStartup> {
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    // Contoh sederhana: cek apakah pengguna sudah login atau belum
    final bool isLoggedIn = await _isLoggedIn(); // Anda perlu mengimplementasikan logika pengecekan login sesuai kebutuhan aplikasi Anda
    setState(() {
      _isAuthenticated = isLoggedIn;
    });
  }

  Future<bool> _isLoggedIn() async {
    // Implementasi logika pengecekan login di sini, misalnya dengan menyimpan status login di SharedPreferences
    // Anda dapat menggunakan package shared_preferences atau cara penyimpanan data lainnya
    // Contoh sederhana:
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // return prefs.getBool('isLoggedIn') ?? false; // Anda perlu mengubah logika ini sesuai dengan bagaimana Anda menyimpan status login
    return false; // Contoh sederhana: asumsi pengguna belum login
  }

  @override
  Widget build(BuildContext context) {
    return _isAuthenticated ? HomePage() : LoginPage();
  }
}
