
import 'package:flutter/material.dart';
import 'package:get_api_project/screen/post_api_screen/post_register_screen.dart';
import 'package:get_api_project/screen/update_data_api_screen/update_data_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UpdateDataScreen(),
    );
  }
}
