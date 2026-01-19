import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart'as http;
class CartGetController{

  Future<List>getData()async{

    try{
      FlutterSecureStorage storage= FlutterSecureStorage();
      var t = await storage.read(key: "token");

      Uri uri = Uri.parse("https://eplay.coderangon.com/api/cart");

      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $t",
      };

      var res = await http.get(uri, headers: headers);

      if(res.statusCode==200){
        return jsonDecode(res.body)['data'];
      }else if (res.statusCode==401) {
        EasyLoading.showError("Please Login");
        return [];
      }

    }catch(e){
      log("===error $e");
    }
    return [];
  }

  }
