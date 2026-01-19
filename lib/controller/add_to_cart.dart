import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AddToCartController {
  Future<void> addToCart({required int id, required int qty}) async {
    try {
      FlutterSecureStorage storage = FlutterSecureStorage();
      var t = await storage.read(key: "token");
      Uri uri = Uri.parse("https://eplay.coderangon.com/api/cart");
      var body = {"product_id": id, "quantity": qty};
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $t",
      };

      var res = await http.post(uri, body: jsonEncode(body), headers: headers);

      if (res.statusCode == 200) {
        EasyLoading.showSuccess("Added");
        return;
      } else if (res.statusCode == 401) {
        EasyLoading.showError("Please Login");
        return;
      }
    } catch (e) {
      log("===error $e");
    }
    return;
  }
}
