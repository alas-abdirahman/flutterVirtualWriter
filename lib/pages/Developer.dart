import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Developer extends StatefulWidget {
  const Developer({Key? key}) : super(key: key);

  @override
  State<Developer> createState() => developerState();
}

class developerState extends State<Developer> {
  void openFacebook() async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'fb://profile/page_id';
    } else {
      fbProtocolUrl = 'fb://page/page_id';
    }

    String fallbackUrl = 'https://www.facebook.com/page_name';

    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Developer info"),
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/resources/profile.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                const Text(
                  "Mohamed Abdirahman Abdullahi",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Text("alasabdirahman@gmail.com"),
                const Text(""),
                const Divider(thickness: 4),
                const Text(""),
                const Text(
                  "Professional summary \n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                    "Full Stack Developer with over four years of coding experience and expertise in project planning. Successfully monitors and controls all phases of development process, design, construction, and testing. Works collaboratively within multi-functional teams to identify and resolve bugs and functionality issues. Strong technical analysis and quality assurance skills."),
                const Text(""),
                const Text(
                  "Educational summary \n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                    "Joined Jamhuriya University of Science and Technology in 2018 - 2019 and studying faculty of Computer Application. "),
                const Text(""),
                const Text(
                  "Contact info \n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(""),
                Row(
                  children: const [
                    Text("Full name: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Mohamed Abdirahman Abdullahi")
                  ],
                ),
                Row(
                  children: const [
                    Text("\nAddress : ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("\n Mogadishu - Somalia")
                  ],
                ),
                Row(
                  children: const [
                    Text("\nTelephone : ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("\n +252 - 615 - 212320")
                  ],
                ),
                Row(
                  children: const [
                    Text("\nEmail : ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("\n alasabdirahman@gmail.com")
                  ],
                ),
                const Text(""),
                const Text(
                  "Social media \n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          var url =
                              'fb://facewebmodal/f?href=https://www.facebook.com/profile.php?id=100010636771378';
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              universalLinksOnly: true,
                            );
                          } else {
                            throw 'There was a problem to open the url: $url';
                          }
                        },
                        icon: const Icon(Icons.facebook,
                            color: Colors.blue, size: 35),
                      ),
                      const Text("     "),
                      IconButton(
                        onPressed: () async {
                          var whatsappUrl =
                              "whatsapp://send?phone=+252615212320";
                          await canLaunch(whatsappUrl)
                              ? launch(whatsappUrl)
                              : print(
                                  "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                        },
                        icon: const Icon(Icons.whatsapp,
                            color: Colors.green, size: 35),
                      ),
                      const Text("     "),
                      IconButton(
                        onPressed: () async {
                          const url = "https://google.com";
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw "Could not launch $url";
                          }
                        },
                        icon: const Icon(SimpleIcons.internetexplorer,
                            color: Colors.blue, size: 35),
                      ),
                      const Text("     "),
                      IconButton(
                        onPressed: () async {
                          var url =
                              'https://github.com/Mohamed-Abdirahman-Abdullahi';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw "Could not launch $url";
                          }
                        },
                        icon: const Icon(SimpleIcons.github,
                            color: Colors.black, size: 35),
                      )
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
