import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hemat_yuk/constants/const.dart';
import 'package:hemat_yuk/pages/detail.dart';
import 'package:hemat_yuk/widget/shimmer_loading.dart';
import 'package:shimmer/shimmer.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 10,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text(
            "History",
            style: TextStyle(color: Colors.white),
          )),
      // body: Stack(
      //   children: [
      //     Container(
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage('assets/filter.jpeg'),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('HISTORY')
              .where('user', isEqualTo: Constants.currentUser)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data!.docs.isNotEmpty) {
              if (snapshot.hasData) {
                return ListView(
                  padding: EdgeInsets.all(20),
                  children: snapshot.data!.docs
                      .map((e) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        dana: e['dana'],
                                        gopay: e['gopay'],
                                        ovo: e['ovo']),
                                  ));
                            },
                            child: Container(
                              height: 80,
                              padding: EdgeInsets.only(left: 15, right: 15),
                              margin: EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e['date_time'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 26,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Theme.of(context).primaryColor),
                            ),
                          ))
                      .toList(),
                );
              } else {
                return const ShimmerLoading();
              }
            } else {
              return SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/filter.jpeg'),
                  ],
                ),
              );
            }
          }),
    );
  }
}
