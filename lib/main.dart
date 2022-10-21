import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ads/ads.dart';
import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoggedIn = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fb'),
      ),
      body: ElevatedButton(
        onPressed: () async {
          FacebookAuth.instance.login(
              permissions: ["public_profile", "email"]).then((value) async {
            setState(() {
              _isLoggedIn = true;
            });
            final LoginResult result = await FacebookAuth.instance.login();
            if (result.status == LoginStatus.success) {
              print('facebook login successfully ');
              final AccessToken accessToken = result.accessToken!;
              final userData = await FacebookAuth.i.getUserData();
              print('Your fb name : ${userData['name']}');
              print('Your fb email : ${userData['email']}');
            }
          });
        },
        child: const Text('Login with Fb'),
      ),
    );
  }

  Future<void> fbLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      // by default we request the email and the public profile

      if (result.status == LoginStatus.success) {
        print('login ');

        final AccessToken accessToken = result.accessToken!;

        final userData = await FacebookAuth.i.getUserData();
        print(userData['name']);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> fbLogout() async {
    await FacebookAuth.instance.logOut();
    setState(() {});
  }
}
