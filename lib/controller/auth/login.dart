
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginController {
  static Future<void> Login({
    required  phone,
    required  password,
  }) async {
    try {
      EasyLoading.show(status: "Logging in...");

      Uri uri = Uri.parse("https://b4.coderangon.com/api/login");

      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      var body = jsonEncode({
        "phone": phone,
        "password": password,
      });

      var res = await http.post(uri, headers: headers, body: body);

      log("statusCode: ${res.statusCode}");
      log("response: ${res.body}");

      EasyLoading.dismiss();

      if (res.statusCode == 200) {


        var data = jsonDecode(res.body)['token'];
        FlutterSecureStorage storage= FlutterSecureStorage();
        log("===$data");
        storage.write(key: "token", value: data);
        EasyLoading.showSuccess("Login Success");

      } else if (res.statusCode == 422) {
        EasyLoading.showError("Phone or password incorrect");
      } else {
        EasyLoading.showError("Something went wrong");
      }

    } catch (e) {
      EasyLoading.dismiss();
      log("error: $e");
      EasyLoading.showError("Something went wrong");
    }
  }
}
