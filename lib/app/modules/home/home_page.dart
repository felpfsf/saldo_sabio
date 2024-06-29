import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const Text('Home',
            style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}
