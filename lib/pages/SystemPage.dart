// ignore_for_file: unused_field, prefer_final_fields

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class SystemPage extends StatefulWidget {
  const SystemPage({Key? key}) : super(key: key);

  @override
  State<SystemPage> createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  String output = "Tab the mic to record or upload your image to convert.";
  bool isListening = false;
  var _speech2text = SpeechToText();
  late final String _imagePath;

  void listen() async {
    if (!isListening) {
      bool available = await _speech2text.initialize(
        onStatus: (status) => print("Status: $status"),
        onError: (errorNotification) => print("Error: $errorNotification"),
      );
      if (available) {
        setState(() {
          isListening = true;
        });
        _speech2text.listen(
          onResult: (result) => setState(
            () {
              if (result.finalResult) {
                output = result.recognizedWords;
                isListening = false;
              }
            },
          ),
        );
      }
    } else {
      setState(() {
        isListening = false;
        _speech2text.stop();
      });
    }
  }

  void convertImage2Text() async {
    try {
      final _textDetector = GoogleMlKit.vision.textDetector();
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      // Creating an InputImage object using the image path
      final inputImage = InputImage.fromFilePath(pickedImage!.path);
      // Retrieving the RecognisedText from the InputImage
      final text = await _textDetector.processImage(inputImage);
      await _textDetector.close();
      // Finding text String(s)
      output = "";
      for (TextBlock block in text.blocks) {
        for (TextLine line in block.lines) {
          setState(() {
            output += "${line.text}\n";
          });
        }
      }
    } catch (e) {
      null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech2text = SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        // drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Row(
            children: const [
              Text("Ready To Write"),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.clear, size: 33),
                  onPressed: () async {
                    setState(() {
                      output =
                          "Tab the mic to record or upload your image to convert.";
                    });
                  },
                ),
              ),
              Expanded(
                child: AvatarGlow(
                  animate: isListening,
                  endRadius: 30,
                  glowColor: Color.fromARGB(255, 22, 23, 24),
                  child: IconButton(
                    icon: Icon(isListening ? Icons.mic_rounded : Icons.mic_off,
                        size: 33),
                    onPressed: () {
                      listen();
                    },
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.upload, size: 33),
                  onPressed: () async {
                    convertImage2Text();
                  },
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Text(
                output,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
