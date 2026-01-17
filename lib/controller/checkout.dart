
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class CheckOutService{

  Future<void>sentData({required Map data})async{

    try{

      Uri uri = Uri.parse("https://eplay.coderangon.com/api/order");
      var body=jsonEncode(data);
      var header ={
        "Accept" : "application/json",
        "Content-Type" : "application/json",
      };
      var res =await http.post(uri, body:body , headers: header,);
    }catch(e){
     log("====$e");
    }
  }

}