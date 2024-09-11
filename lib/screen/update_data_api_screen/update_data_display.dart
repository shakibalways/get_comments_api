import 'package:flutter/material.dart';
import 'package:get_api_project/model/put/update.dart';

class ShowUpdateData extends StatelessWidget {
  final String? name, job, updatedAT;
  final DataUpdateModel updateModel;
  const ShowUpdateData({
    super.key,
    this.name,
    this.job,
    this.updatedAT,
    required this.updateModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: const Text("Update Data Show "),
        ),
        body: Center(
          child: Container(
            height: 250,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Name:$name",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "job:$job",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  maxLines: 1,
                  "updateAT:$updatedAT",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
        ));
  }
}
