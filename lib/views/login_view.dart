import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false;
  User? user;

  Future<void> register() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await auth.createUserWithEmailAndPassword(
        email: 'carlo@gmail.com',
        password: 'password',
      );
      // SUCCESS
      print('SUCCESS');

      print(response.user);
    } catch (e) {
      print('ERROR');
      print('Unable to login');
      // FAIL
    } finally {
      print('FINALLY');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    try {
      // CTRL + SHIFT + I
      final response = await auth.signInWithEmailAndPassword(
        email: 'carlo@gmail.com',
        password: 'password',
      );

      print(response.user);

      setState(() {
        user = response.user;
        Navigator.of(context).pushReplacementNamed('home');
      });

      // Navigator.of(context).pushNamed('home');
      // pushNamed
      // pushReplacementNamed

      // 'home'
      // 🆎 'home'

    } catch (e) {
      print('ERROR');
      print('Unable to login');
      // FAIL
    } finally {
      print('FINALLY');
      setState(() {
        isLoading = false;
      });
    }
  }

  // async/await
  Future<void> signOut() async {
    setState(() {
      isLoading = true;
    });

    try {
      await auth.signOut();

      setState(() {
        user = null;
      });
    } catch (e) {
      print('ERROR');
      // FAIL
    } finally {
      print('FINALLY');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Flutter Authentication'),
            if (isLoading) CircularProgressIndicator(),
            MaterialButton(
              onPressed: () => register(),
              child: Text('Register'),
            ),
            MaterialButton(
              onPressed: () => login(),
              child: Text('Login'),
            ),
            user != null
                ? Text(
                    user!.email ?? 'User Email is empty',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )
                : SizedBox.shrink(),
            MaterialButton(
              onPressed: () => signOut(),
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
