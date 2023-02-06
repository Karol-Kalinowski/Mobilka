import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Style/txtStyle.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //register function
  static Future registerUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    try{
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );

      Fluttertoast.showToast(
          msg: "Konto zostało utworzone.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.greenAccent,
          fontSize: 16.0
      );
    } on FirebaseAuthException catch (e){
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          fontSize: 16.0
      );
    }
  }

  final TextEditingController ec = TextEditingController();
  final TextEditingController pc = TextEditingController();
  final TextEditingController pc2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 4.0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: const Text(
            "PCFix",
            style: CustomTextStyle.mojStylNazwa,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox.fromSize(
                      size: const Size.fromRadius(50),
                      child: const FittedBox(
                        child: Icon(
                          Icons.build_circle,
                        ),
                      )
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    controller: ec,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: 'Wprowadź email',
                        labelStyle: CustomTextStyle.mojStylEtykieta,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3.0,
                              color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3.0,
                              color: Colors.cyan),
                          borderRadius: BorderRadius.circular(15.0),
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    controller: pc,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: 'Wprowadź hasło',
                        labelStyle: CustomTextStyle.mojStylEtykieta,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3.0,
                              color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3.0,
                              color: Colors.cyan),
                          borderRadius: BorderRadius.circular(15.0),
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    controller: pc2,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: 'Powtórz hasło',
                        labelStyle: CustomTextStyle.mojStylEtykieta,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3.0,
                              color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3.0,
                              color: Colors.cyan),
                          borderRadius: BorderRadius.circular(15.0),
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: MediaQuery.of(context).size.height * 0.065,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      onPressed: () async {
                        if(pc.text == pc2.text) {
                          registerUsingEmailPassword(email: ec.text,
                              password: pc.text,
                              context: context);

                          Fluttertoast.showToast(
                              msg: "Zarejestrowano użytkownika.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.greenAccent,
                              fontSize: 16.0
                          );
                        }
                      },
                      icon: const Icon(Icons.app_registration_outlined),
                      label: const Text("Zrejestruj się",
                        style: CustomTextStyle.mojStyl,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              )
          ),
        ),
    );
  }
}