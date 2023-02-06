import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Style/txtStyle.dart';
import '../main.dart';
import '../card.dart';
import '../cardViewer.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final user = FirebaseAuth.instance.currentUser!;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future logout() async {
    await auth.signOut().then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Twoje urządzenia",
            style: CustomTextStyle.mojStylTytul,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("sprzet").where(
                  "User_UID", isEqualTo: user.uid).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    children: snapshot.data!.docs.map((card) =>
                        viewCard(() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                CardViewerScreen(card),
                          ));
                        }, card)).toList(),
                  );
                } else {
                  return const Text(
                      "Dodaj specyfikację komputera używając aplikacji desktopowej");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
