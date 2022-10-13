import 'package:flutter/material.dart';

import 'Notifications.dart';
import 'Policies.dart';
import 'Developer.dart';
import 'About.dart';
import 'package:share_plus/share_plus.dart';

Widget NavBar(BuildContext context) {
  return Drawer(
    child: ListView(
      // Remove padding
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text(''),
          accountEmail: const Text(''),
          currentAccountPicture: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              size: 50,
              color: Colors.white,
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.favorite, color: Colors.red),
          title: const Text('Favorite'),
          onTap: () => null,
        ),
        ListTile(
          leading: const Icon(Icons.share),
          title: const Text('Share'),
          onTap: () => {
            Share.share(
                'https://www.mediafire.com/folder/qq9o4v0h7efuo/Documents',
                subject: "Share Application")
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Notifications'),
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Notifications()))
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.description),
          title: const Text('Policies'),
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Policies()))
          },
        ),
        ListTile(
          leading: const Icon(Icons.code),
          title: const Text('Developer'),
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Developer()))
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('About'),
          leading: const Icon(Icons.info),
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => About()))
          },
        ),
      ],
    ),
  );
}
