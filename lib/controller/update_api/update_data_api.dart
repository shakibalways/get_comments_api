import 'dart:convert';

import 'package:get_api_project/model/put/update.dart';
import 'package:http/http.dart' as http;

class UpdateDataApiService {
  static Future<DataUpdateModel?> updateDataApi(
      {required String name, required String job}) async {
    Uri url = Uri.parse("https://reqres.in/api/users/2");
    var data = {
      "name": name,
      "job": job,
    };
    var response = await http.put(url, body: data);
    try {
      if (response.statusCode == 200) {
        DataUpdateModel jsonList = DataUpdateModel.fromJson(
            jsonDecode(response.body));
        print(response.body);
        print("Data Update Successfully");
        return jsonList;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}


