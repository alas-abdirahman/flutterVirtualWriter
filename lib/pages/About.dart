import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("About"),
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                const Text(
                  "This is an open source Artificial Intelligence (AI) application created to simplify content writing by simply uploading an image from the content you want to write or using the microphone to use your voice. \n This was a high demand area having those writers whenever they want to write contents. \n On the otherhand, the application is important for those want to enhance the language (English) pronounciation or speech by using the microphone and testing their voices to be recognized, the application will recognize his/her pronounciation if it's correct and display on the board or will not recognize if it's not correct. \n That is how the application is working and why it's created. \n \n \n Application permissions : \n \n The application needs a microphone permission in order to use the voice recognition feature. \n Also an internet connection is needed when you want to use voice recognition.",
                  style: TextStyle(fontSize: 18),
                ),
                const Text("\n"),
                const Text(
                  "Supervised : ",
                  style: TextStyle(fontSize: 18),
                ),
                const Text(""),
                const Text(
                  "Sharmarke Ali Kahie",
                  style: TextStyle(fontSize: 18),
                ),
                const Text("Senior lecturer at Jamhuriya University."),
                Text(""),
                Divider(thickness: 3),
                Row(
                  children: const [
                    Text("\n\n"),
                    Text(
                      "Version : ",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "0.0.2",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
