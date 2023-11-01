import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("First Page"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Second Page",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
