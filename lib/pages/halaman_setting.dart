import 'package:flutter/material.dart';
import 'package:hemat_yuk/pages/halaman_about.dart';
import 'package:hemat_yuk/pages/halaman_login.dart';
import 'package:hemat_yuk/pages/halaman_tutorial.dart';
import 'package:hemat_yuk/pages/home_page.dart';

class HalamanSetting extends StatelessWidget {
  const HalamanSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hemat Yuk",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 5,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(children: [
            Icon(
              Icons.info,
              size: 30.0,
            ),
            SizedBox(width: 10.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanAbout()),
                );
              },
              child: Text(
                'About',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(children: [
            Icon(
              Icons.phone_android_outlined,
              size: 30.0,
            ),
            SizedBox(width: 10.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TutorialPage()),
                );
              },
              child: Text(
                'Tutorial Penggunaan',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ]),
        ),
        SizedBox(height: 40),
        ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanLogin(),
                  ),
                  (route) => false);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Text("Keluar Akun"))
      ],
    ));
  }
}
