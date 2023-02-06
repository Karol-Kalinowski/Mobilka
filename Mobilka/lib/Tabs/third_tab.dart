import 'package:flutter/material.dart';
import 'package:mobilka/Style/txtStyle.dart';

class ThirdTab extends StatelessWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("O aplikacji:",
            style: CustomTextStyle.mojStylTytul,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text("Miej specyfikację swojego komputera pod ręką! Aby dodać nową specyfikację pobierz aplikację desktopową.",
            style: CustomTextStyle.mojStyl,
          ),
          SizedBox(
            height: 25.0,
          ),
          Text("Kontakt:",
            style: CustomTextStyle.mojStylTytul,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text("E-mail: dev@mailto.com",
            style: CustomTextStyle.mojStyl,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text("Tel: 123 456 789",
            style: CustomTextStyle.mojStyl,
          ),
        ],
      ),
    );
  }
}
