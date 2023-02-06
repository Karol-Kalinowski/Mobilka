import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Style/txtStyle.dart';

Widget viewCard(Function()? onTap, QueryDocumentSnapshot doc) {
  final collection = FirebaseFirestore.instance.collection('sprzet');

  return Builder(
    builder: (context) {
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(6.0),
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(
                color: Colors.cyan,
                width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(doc["Nazwa_Komputera"],
                style: CustomTextStyle.mojStyl,
              ),
              Text(doc["OS_Nazwa"],
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.mojStylOpis,
              ),
              Text("Dodano: ${doc["Data_Utworzenia"]}",
                style: CustomTextStyle.mojStylOpis,
              ),
              IconButton(
                iconSize: 30,
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                ),
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Usuwanie specyfikacji'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: const <Widget>[
                              Text('Czy chcesz usunąć daną specyfikację?'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Tak'),
                            onPressed: () {
                              collection
                                  .doc(doc.id) // <-- Doc ID to be deleted.
                                  .delete() // <-- Delete
                                  .then((_) =>
                                  Fluttertoast.showToast(
                                      msg: "Usunięto specyfikację.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.greenAccent,
                                      fontSize: 16.0
                                  ),
                              );
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Nie'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
  );
}