import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class RegisterPostApi {
 static Future<bool> registerUser({required String email,required String password}) async {
   Uri url = Uri.parse("https://reqres.in/api/register");
    var data = {
      "email": email,
      "password": password,
    };
    try {
      final response =
          await http.post(url,body: data);
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        String token = data['token'] ?? "null";
        return true;
      }
    } catch (e) {
      log("Error : $e");
    }
   return false;
  }
}
