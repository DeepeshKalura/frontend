import 'package:flutter/material.dart';

import '../model/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.amber,
      ),
      body: const Column(
        children: [
          Center(
            child: Text('Home Screen'),
          ),
        ],
      ),
    );
  }
}
