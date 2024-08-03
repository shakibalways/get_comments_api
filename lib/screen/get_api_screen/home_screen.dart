import 'package:flutter/material.dart';
import 'package:get_api_project/controller/get_api/api_call_service.dart';
import 'package:get_api_project/model/get_model/commad_model.dart';

class GetApiPage extends StatefulWidget {
  const GetApiPage({super.key});

  @override
  State<GetApiPage> createState() => _GetApiPageState();
}

class _GetApiPageState extends State<GetApiPage> {
  late List<CommentModel> commentModel = [];
  getComments() {
    GetApiService.getComments().then((value) {
      setState(() {
        commentModel = value!;
      });
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Get Api",style: TextStyle(color: Colors.blue,fontSize: 40,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: commentModel.length,
          itemBuilder: (context, index) {
            final appdata = commentModel[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Material(
                color: Colors.blue[100],
                elevation: 5,borderRadius: BorderRadius.circular(20),
                child: Row(
                  children: [
                    const SizedBox(width: 3,),
                    CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                        child: Text(
                          appdata.id.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/1.175,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            appdata.name.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            appdata.email.toString(),
                            style: const TextStyle(
                                 fontSize: 18),
                          ),
                          Text(

                            overflow: TextOverflow.ellipsis,
                            appdata.body.toString(),

                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
