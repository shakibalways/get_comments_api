import 'package:flutter/material.dart';
import 'package:get_api_project/controller/post_api/register_post_api.dart';
import 'package:get_api_project/screen/post_api_screen/successfull_screen.dart';
class PostRegisterScreen extends StatefulWidget {
  const PostRegisterScreen({super.key});

  @override
  State<PostRegisterScreen> createState() => _PostRegisterScreenState();
}

class _PostRegisterScreenState extends State<PostRegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Post Api ",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Email",
                  labelText: 'Email',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  labelText: 'Password',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: ()async {
               bool status = await RegisterPostApi.registerUser(
                    email: emailController.text,
                    password: passwordController.text);
                if (status) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Login Success")));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SuccessfullScreen()));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Login Failed")));
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
