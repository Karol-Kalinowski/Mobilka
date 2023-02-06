import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:mobilka/home.dart';
import 'package:mobilka/register.dart';
import 'Style/txtStyle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
          return MaterialApp(
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.black,
              cardColor: Colors.amber.shade100,
              indicatorColor: Colors.amber,
              tabBarTheme: const TabBarTheme(
                labelColor: Colors.black,
              ),
              iconTheme: const IconThemeData(
                color: Colors.amber,
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
              inputDecorationTheme: const InputDecorationTheme(
                prefixIconColor: Colors.amber,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber,
                ),
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.white,
              indicatorColor: Colors.teal,
              cardColor: Colors.teal.shade900,
              tabBarTheme: const TabBarTheme(
                labelColor: Colors.white,
              ),
              iconTheme: const IconThemeData(
                color: Colors.teal,
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              inputDecorationTheme: const InputDecorationTheme(
                prefixIconColor: Colors.teal,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                ),
              ),
            ),
            themeMode: ThemeMode.system, // device controls theme
            home: const MainPage(),
          );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //Initialize Firebase app
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text("PCFix",
          style: CustomTextStyle.mojStylNazwa,
        ),
      ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Login function
  static Future<User?> loginUsingEmailPassword(
      {required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        Fluttertoast.showToast(
            msg: "Nie znaleziono użytkownika.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            fontSize: 16.0
        );
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController ec = TextEditingController();
    TextEditingController pc = TextEditingController();

    return SingleChildScrollView(
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
                height: 44.0,
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
                          color: Colors.redAccent,
                      ),
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
                height: 44.0,
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
                          color: Colors.redAccent,
                      ),
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
                height: 60.0,
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
                    User? user = await loginUsingEmailPassword(
                        email: ec.text, password: pc.text, context: context);
                    if (user != null) {
                      if (!mounted) return;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const DashboardScreen()));
                    }
                    else {
                      Fluttertoast.showToast(
                          msg: "Nieprawidłowe dane logowania!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.redAccent,
                          fontSize: 16.0
                      );
                    }
                  },
                  icon: const Icon(Icons.login_rounded),
                  label: const Text("Zaloguj się",
                    style: CustomTextStyle.mojStyl,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text( "Nie masz konta? ",
                    style: CustomTextStyle.mojStyl,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const RegisterScreen();
                      },
                      ));
                    },
                    child: const Text( "Zarejestruj się.",
                      style: TextStyle(color: Colors.cyan,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}