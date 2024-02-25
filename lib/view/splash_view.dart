import 'package:flutter/material.dart';

import '../controller/shared_preference_controller.dart';
import '../controller/view/splash_view_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var sharedPreferencesController = SharedPreferencesController();
  var splashViewController = SplashViewController();
  Future<void> _redirectedToNextScreen() async {
    var nextScreen = await splashViewController.navigateToAppropriateScreen();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  void initState() {
    super.initState();

    _redirectedToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 36),
            Text(
              'Loading...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
