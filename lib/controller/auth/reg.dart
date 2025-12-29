import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class RegController {
  Future<bool> createAccountFun({required Map data}) async {
    try {
      Uri uri = Uri.parse("https://b4.coderangon.com/api/register");

      var h = {
        'Accept': 'application/json',
      };

      var res = await http.post(uri, body: data, headers: h);

      log("=====${res.statusCode}");

      if (res.statusCode == 201) {
        log("success");
        return true;
      } else if (res.statusCode == 422) {
        log("email or phone alreday taken");
        var e = jsonDecode(res.body);
        log("===${e['message']}");
        return false;
      }
    } catch (error) {
      log("error : $error");
    }
    return false;
  }
}
