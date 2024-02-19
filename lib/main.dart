import 'package:flutter/material.dart';
import 'package:healix_frontend/model/user.dart';

import 'view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
    );
  }
}

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
