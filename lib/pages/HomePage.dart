// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:virtual_writer/pages/SystemPage.dart';
import './NavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavBar(context),
        appBar: AppBar(
          title: const Text('My Virtual Writer'),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.favorite),
            ),
          ],
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'assets/resources/speech2text.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  height: 5,
                  width: double.infinity,
                  color: Colors.black26,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Upskill Your English Level",
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),
                ),
                Image.asset(
                  'assets/resources/microphone.png',
                  fit: BoxFit.fitWidth,
                  height: 250,
                ),
                RaisedButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SystemPage()));
                  },
                  color: Colors.purple,
                  textColor: Colors.white,
                  child: const Text(
                    "Start",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Row contents horizontally,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.copyright,
                        color: Colors.grey,
                        size: 20,
                      ),
                      Text(
                        "  2022 Mohamed Abdirahman Abdullahi",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
