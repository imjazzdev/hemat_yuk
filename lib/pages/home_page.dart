import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hemat_yuk/constants/const.dart';
import 'package:hemat_yuk/pages/halaman_filter.dart';
import 'package:hemat_yuk/pages/halaman_setting.dart';
import 'package:hemat_yuk/pages/halaman_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Constants.currentUser = FirebaseAuth.instance.currentUser!.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 10,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          // backgroundColor: Color(0xFF235789),
          title: const Text(
            "HematKuy Page",
            style: TextStyle(color: Colors.white),
          )),
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi, Apa yang akan kamu",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Text("beli hari ini ?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 5,
        ),
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Ink(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InputPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  width: 350,
                  height: 60,
                  child: const Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.filter_alt_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "Try Filter",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Ink(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FilterPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  width: 350,
                  height: 60,
                  child: const Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.history,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "History",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Ink(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HalamanSetting()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  width: 350,
                  height: 60,
                  child: const Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "Setting",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Diskonkuy, membantu untuk mencari diskon terbaik anda. Diskonkuy, asyik jadi dengan anda dapat memilih pembayaran yang murah dan hemat."),
            ],
          ),
        ),
      ]),
    );
  }
}
