import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_app/views/home_view.dart';
import 'package:flutter_firebase_auth_app/views/login_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'login': (_) => LoginView(title: 'Flutter Firebase Auth'),
        'home': (_) => HomeView(),
      },
      initialRoute: 'login',
    );
  }
}
