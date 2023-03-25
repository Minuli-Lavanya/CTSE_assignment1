import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meet_me/database.dart';
import 'package:meet_me/onBoardingPages.dart';
//import 'package:meet_me/form.dart';

import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const OnBoardingPages(),
      home: AnimatedSplashScreen(
          splash: Text("MEET ME",
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              )),
          duration: 3000,
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.blueAccent,
          nextScreen: OnBoardingPages()),
    );
  }
}
