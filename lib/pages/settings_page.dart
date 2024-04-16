// setting_page.dart
import 'package:flutter/material.dart';
import 'package:admin_flutter/utils/app_settings.dart'; // Import class AppSettings

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Base URL API:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              readOnly: !_isEditing,
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter API Base URL',
                suffixIcon: _isEditing
                    ? IconButton(
                        icon: Icon(Icons.save),
                        onPressed: () {
                          setState(() {
                            _isEditing = false;
                              Map<String, dynamic> paramsDataServer = {
                              "appBaseUrl": _controller.text
                            };
                            AppSettings.setDataServer(paramsData: paramsDataServer);
                          });

                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          setState(() {
                            _isEditing = true;
                          });
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
