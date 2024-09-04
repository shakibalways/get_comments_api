import 'dart:convert';

import 'package:get_api_project/model/get_model/commad_model.dart';
import 'package:http/http.dart' as http;

class GetApiService {


  static Future<List<CommentModel>?> getComments() async {
    final response = await http




        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CommentModel.fromJson(json)).toList();
    }
    return null;
  }
}
