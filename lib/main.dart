import 'package:flutter/material.dart';

import 'package:virtual_writer/pages/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
