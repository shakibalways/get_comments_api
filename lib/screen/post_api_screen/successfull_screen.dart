import 'package:flutter/material.dart';

class SuccessfullScreen extends StatefulWidget {
  const SuccessfullScreen({super.key});

  @override
  State<SuccessfullScreen> createState() => _SuccessfullScreenState();
}

class _SuccessfullScreenState extends State<SuccessfullScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "User Login Successfully",
              style: TextStyle(
                fontSize: 30,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
