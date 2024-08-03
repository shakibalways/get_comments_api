import 'dart:convert';

import 'package:http/http.dart' as http;
class ModelApiService{
  static Future<dynamic> modelApiService()async{
    try{
      var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
      var response = await http.get(url);
      if(response.statusCode==200){
       final model = jsonDecode(response.body);
        return model;
      }
    }catch(e){
      print(e.toString());
    }
    return null;

  }
}