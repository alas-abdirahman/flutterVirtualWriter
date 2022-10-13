import 'dart:async';

import 'package:flutter/material.dart';
import 'package:virtual_writer/pages/HomePage.dart';

// class Splash2 extends StatelessWidget {
//   const Splash2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen(
//       seconds: 4,
//       navigateAfterSeconds: const HomePage(),
//       title: const Text(
//         'Virtual Writer',
//         textScaleFactor: 2,
//       ),
//       image: Image.asset('assets/resources/microphone.png'),
//       loadingText: const Text("Loading"),
//       photoSize: 100.0,
//       loaderColor: Colors.purple,
//     );
//   }
// }

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/resources/microphone.png'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Virtual Writer",
                    style: TextStyle(fontSize: 22, color: Colors.black)),
              )
            ],
          ),
        ));
  }
}
