import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:admin_flutter/utils/app_settings.dart'; // Import class AppSettings

class ApiRoutes {
  static Future<String> login(String username, String password) async {
    // Mengambil URL dari AppSettings
    Uri url = Uri.parse("${AppSettings.appBaseUrl}/login");

    final Map<String, dynamic> data = {
      'name': username,
      'password': password,
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Cek jika respons adalah token
      if (response.body.isNotEmpty) {
        return response.body;
      } else {
        throw Exception('Empty token received');
      }
    } else {
      throw Exception('Failed to login');
    }
  }
}
