import 'package:flutter/material.dart';

class Policies extends StatefulWidget {
  const Policies({Key? key}) : super(key: key);

  @override
  State<Policies> createState() => policiesState();
}

class policiesState extends State<Policies> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Policies"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: const Text(
              "This is a free open source application developed using Flutter mobile application framework, it's an open source framework developed by Google for building beautiful, natively compiled, multi-platform applications from a single codebase. \n Hence it's an open source application you can find all about it's resources from the Github repository : \n https://github.com/Mohamed-Abdirahman-Abdullahi/flutterVirtualWriter.git \n for more information please feel free to reach the developer.",
              style: TextStyle(
                  color: Color.fromARGB(255, 95, 91, 91),
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
