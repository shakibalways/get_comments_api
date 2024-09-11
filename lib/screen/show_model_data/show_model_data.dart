import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_api_project/controller/model_service/without_model.dart';


class ModelDataShow extends StatefulWidget {
  const ModelDataShow({super.key});

  @override
  State<ModelDataShow> createState() => _ModelDataShowState();
}

class _ModelDataShowState extends State<ModelDataShow> {
  List<dynamic> getModelData = [];
  bool isLoading = false;
  getModel() {
    isLoading = true;
    ModelApiService.modelApiService().then((value) {
      setState(() {
        getModelData = value!;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      log("$error");
    });
  }

  @override
  void initState() {
    getModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get Method Without Model",
          style: TextStyle(
              color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: getModelData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.blue[100],
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: [
                        userInfo(
                          index,
                          "Name : ",
                          getModelData[index]['name'].toString(),
                        ),
                        userInfo(
                          index,
                          "email : ",
                          getModelData[index]['email'].toString(),
                        ),
                        userInfo(
                          index,
                          "address : ",
                          getModelData[index]['address']['city'].toString(),
                        ),
                        userInfo(
                          index,
                          "street : ",
                          getModelData[index]['address']['street'].toString(),
                        ),
                        userInfo(
                          index,
                          "Phone : ",
                          getModelData[index]['phone'].toString(),
                        ),
                        userInfo(
                          index,
                          "Website : ",
                          getModelData[index]['website'].toString(),
                        ),
                        userInfo(
                          index,
                          "Company : ",
                          getModelData[index]['company']['name'].toString(),
                        ),
                        userInfo(
                          index,
                          "CatchPhrase : ",
                          getModelData[index]['company']['catchPhrase'].toString(),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }

  Row userInfo(int index, name, value) {
    return Row(
      children: [
        Text(

          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
