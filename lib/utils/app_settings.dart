import 'package:shared_preferences/shared_preferences.dart';

class AppSettings{
  static SharedPreferences? prefs;

// ------------------------------------------------------------------------------------------------------------------------------
  static String? appBaseUrl;

  static Future getDataServer()async{
    prefs = await SharedPreferences.getInstance();

    appBaseUrl = prefs!.getString("appBaseUrl");

    // getLogin();
    getAll();
  }

  /// - paramsData= {`"scodeId": ""`, `"scodeCode": ""`, `"appBaseUrl": ""`}
  static Future setDataServer({required Map<String, dynamic> paramsData})async{
    prefs = await SharedPreferences.getInstance();

    prefs!.setString("appBaseUrl", paramsData["appBaseUrl"]);

    getDataServer();
  }

// ------------------------------------------------------------------------------------------------------------------------------

  static bool? isLogin;
  static bool? success; 
  static String? token;

  static Future getLogin()async{
    prefs = await SharedPreferences.getInstance();

    isLogin = prefs!.getBool("isLogin");
    success = prefs!.getBool("success"); 
    token = prefs!.getString("token");
  }

  /// paramsData = { `"success": true`, `"err_code": ""`, "user_id": "", "user_device_id": "", "username": "", "user_kode": "", "karyawan_id": "", "karyawan_nama": "", "karyawan_notelp": "", "karyawan_notelp2": "", "karyawan_email": "", "karyawan_cabang": "", "karyawan_hp_imei": "", "karyawan_pin": "", "karyawan_alamat": "", "group_id": "", "group_name": "", "gudang_id": "", "gudang_nama": "", "gudang_lokasi": "", "gudang_top_info": "", "gudang_top_info2": "", "gudang_bottom_info": ""}
  static Future login({required Map<String, dynamic> paramsData})async{
    prefs = await SharedPreferences.getInstance();

    prefs!.setBool("isLogin", true);
    prefs!.setBool("success", paramsData["success"]);
    prefs!.setString("token", paramsData["token"]);
    getLogin();
  }

  static Future logout()async{
    prefs = await SharedPreferences.getInstance();

    prefs!.clear();

    prefs!.setString("appBaseUrl", appBaseUrl!);
    prefs!.setBool("isLogin", false);

    getDataServer();
  }

// ------------------------------------------------------------------------------------------------------------------------------
  static Future getAll()async{
    getLogin();
  }
}