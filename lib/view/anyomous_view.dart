import 'package:flutter/material.dart';
import 'package:healix_frontend/view/home_view.dart';

import '../controller/shared_preference_controller.dart';
import '../controller/view/anyomous_view_controller.dart';
import '../model/user.dart';

class AnyomousView extends StatefulWidget {
  const AnyomousView({super.key, required this.sharedPreferencesController});
  final SharedPreferencesController sharedPreferencesController;

  @override
  State<AnyomousView> createState() => _AnyomousViewState();
}

class _AnyomousViewState extends State<AnyomousView> {
  final anyomousViewController = AnyomousViewController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  void navigateToHomeScreen(BuildContext context, User user) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return anyomousViewController.isLogin
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purpleAccent),
              ),
            ),
          )
        : Scaffold(
            body: Center(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                child: Card(
                  shadowColor: Colors.black54,
                  elevation: 8.0,
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Anyomous Login',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.purpleAccent,
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(
                                Size(size * 0.9, 50.0),
                              ),
                            ),
                            onPressed: () async {
                              var user = await anyomousViewController
                                  .createUser(nameController.text);
                              navigateToHomeScreen(context, user);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
