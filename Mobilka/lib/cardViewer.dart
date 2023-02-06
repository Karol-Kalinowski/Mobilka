import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilka/Style/txtStyle.dart';

class CardViewerScreen extends StatefulWidget {
  const CardViewerScreen(this.doc, {Key? key}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  State<CardViewerScreen> createState() => _CardViewerScreenState();
}

class _CardViewerScreenState extends State<CardViewerScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Text(widget.doc["Nazwa_Komputera"],
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyle.mojStylNazwa,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    margin: const EdgeInsets.fromLTRB(1, 8, 1, 10),
                    padding: const EdgeInsets.only(bottom: 1, left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.cyanAccent, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("System operacyjny: ${widget.doc["OS_Nazwa"]}",
                          overflow: TextOverflow.visible,
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("Rodzaj architektury: ${widget.doc["OS_Architektura"]}",
                          style: CustomTextStyle.mojStyl,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 50,
                      top: -3,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
                        child: const Text('SYSTEM INFO',
                          style: CustomTextStyle.mojStylEtykieta,
                        ),
                      )),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 130.0,
                    margin: const EdgeInsets.fromLTRB(1, 8, 1, 10),
                    padding: const EdgeInsets.only(bottom: 1, left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.cyanAccent, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Procesor: ${widget.doc["CPU_Nazwa"]}",
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("Producent: ${widget.doc["CPU_Producent"]}",
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("Prędkość zegara: ${widget.doc["CPU_Predkosc_Zegara"]} GHz",
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("Ilość rdzeni: ${widget.doc["CPU_Ilosc_Rdzeni"]}",
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("Ilość wątków: ${widget.doc["CPU_Ilosc_Watkow"]}",
                          style: CustomTextStyle.mojStyl,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 50,
                      top: -3,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
                        child: const Text('CPU INFO',
                          style: CustomTextStyle.mojStylEtykieta,
                        ),
                      )),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 80.0,
                    margin: const EdgeInsets.fromLTRB(1, 8, 1, 10),
                    padding: const EdgeInsets.only(bottom: 1, left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.cyanAccent, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Karta graficzna: ${widget.doc["GPU_Nazwa"]}",
                          overflow: TextOverflow.visible,
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("Producent: ${widget.doc["GPU_Producent"]}",
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("Wersja sterownika: ${widget.doc["GPU_Wersja_Sterownika"]}",
                          style: CustomTextStyle.mojStyl,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 50,
                      top: -3,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
                        child: const Text('GPU INFO',
                          style: CustomTextStyle.mojStylEtykieta,
                        ),
                      )),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 80,
                    margin: const EdgeInsets.fromLTRB(1, 8, 1, 10),
                    padding: const EdgeInsets.only(bottom: 1, left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.cyanAccent, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Producent: ${widget.doc["RAM_Producent"]}",
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("Rozmiar pamięci RAM: ${widget.doc["RAM_Ilosc"]} GB",
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("Prędkość pamięci: ${widget.doc["RAM_Predkosc"]} MHz",
                          style: CustomTextStyle.mojStyl,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 50,
                      top: -3,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
                        child: const Text('RAM INFO',
                          style: CustomTextStyle.mojStylEtykieta,
                        ),
                      )),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 100,
                    margin: const EdgeInsets.fromLTRB(1, 8, 1, 10),
                    padding: const EdgeInsets.only(bottom: 1, left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.cyanAccent, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Model dysku: ${widget.doc["Dysk_Model"]}",
                          overflow: TextOverflow.visible,
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("Pojemność dysku: ${widget.doc["Dysk_Ilosc_Pamieci"]} GB",
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("Wolna pamięć: ${widget.doc["Dysk_Wolna_Pamiec"]} GB",
                          style: CustomTextStyle.mojStyl,
                        ),
                        Text("System plików: ${widget.doc["Dysk_System_Plikow"]}",
                          style: CustomTextStyle.mojStyl,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 50,
                      top: -3,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
                        child: const Text('DYSK INFO',
                          style: CustomTextStyle.mojStylEtykieta,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}