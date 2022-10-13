import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => notificationsState();
}

class notificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("Notifications"),
        ),
        body: const Center(
          child: Text(
            "No notifications yet.",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
