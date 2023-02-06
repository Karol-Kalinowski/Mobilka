import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:mobilka/Style/txtStyle.dart';
import 'package:simple_url_preview/simple_url_preview.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  final List<String> imageList = [
    "https://www.x-kom.pl/",
    "https://pc-porady.pl/",
    "https://www.morele.net/",
    "https://www.pepper.pl/"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: const Text("Przydatne linki",
              style: CustomTextStyle.mojStylTytul,
            ),
          ),
          GFCarousel(
            aspectRatio: 1.25,
            autoPlay: true,
            pagination: true,
            enlargeMainPage: true,
            activeIndicator: Theme.of(context).indicatorColor,
            items: imageList.map(
                  (url) {
                return Container(
                  margin: const EdgeInsets.only(left: 8.0, top: 40.0, right: 8.0),
                  child: SimpleUrlPreview(
                    url: url,
                    bgColor: Theme.of(context).cardColor,
                    onTap: () async {
                        await launch(url, forceWebView: true);
                  },
                  )
                );
              },
            ).toList(),
            onPageChanged: (index) {
              setState(() {
                index;
              });
            },
          ),
        ],
      ),
    );
  }
}












