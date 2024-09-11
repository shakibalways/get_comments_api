import 'package:flutter/material.dart';
import 'package:get_api_project/controller/update_api/update_data_api.dart';
import 'package:get_api_project/model/put/update.dart';
import 'package:get_api_project/screen/update_data_api_screen/update_data_display.dart';


class UpdateDataScreen extends StatefulWidget {
  const UpdateDataScreen({super.key});

  @override
  State<UpdateDataScreen> createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  DataUpdateModel updateModel = DataUpdateModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Date Api Screen",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "Name",
                  labelText: "Name",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: jobController,
              decoration: const InputDecoration(
                  hintText: "Job Title",
                  labelText: "Job Title",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                UpdateDataApiService.updateDataApi(
                        name: nameController.text.toString(),
                        job: jobController.text.toString())
                    .then((value) {
                  setState(() {
                    updateModel = value!;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowUpdateData(
                                  updateModel: updateModel,
                                  name: updateModel.name.toString(),
                                  job: updateModel.job.toString(),
                                  updatedAT: updateModel.updatedAt.toString(),
                                )));
                  });
                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Text(
                  "Update",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
