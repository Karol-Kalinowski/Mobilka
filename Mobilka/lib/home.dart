import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilka/Tabs/first_tab.dart';
import 'package:mobilka/Tabs/second_tab.dart';
import 'package:mobilka/Tabs/third_tab.dart';
import 'package:mobilka/main.dart';

import 'Style/txtStyle.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future logout() async {
    await auth.signOut().then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 4.0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(
            user.email!,
            style: CustomTextStyle.mojStyl,
            overflow: TextOverflow.visible,
          ),
          leading: const Icon(
            Icons.account_circle_rounded,
            size: 32.0,
          ),
          actions: [
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () async {
                logout();
              },
              icon: const Icon(Icons.logout_rounded),
              label: const Text("Wyloguj się",
                style: CustomTextStyle.mojStyl,
              ),
            ),
          ],
        ),
        body: Column(
          children: const [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.newspaper_outlined,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.info_outline_rounded,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                  children: [
                    FirstTab(),
                    SecondTab(),
                    ThirdTab(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}