import 'package:fb/fb_details.dart';
import 'package:fb/provider/api_who_provider.dart';
import 'package:fb/provider/counter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';

import 'api.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterClass()),
        ChangeNotifierProvider(create: (context) => CounterClassApi()),
        ChangeNotifierProvider(create: (context) => WhoApiProvider()),
        ChangeNotifierProvider(create: (context) => DictionaryApiProvider()),
        ChangeNotifierProvider(create: (context) => JamalApiProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GetApiJamal(),
        debugShowCheckedModeBanner: false,
      ),
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
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('facebook Login'),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.deepPurple,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              child: const Text('NEXT'))
        ],
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
          onPressed: () async {
            FacebookAuth.instance.login(
                permissions: ["public_profile", "email"]).then((value) async {
              setState(() {
                isLoggedIn = true;
              });
              final LoginResult result = await FacebookAuth.instance.login();
              if (result.status == LoginStatus.success) {
                final AccessToken accessToken = result.accessToken!;

                // There are two methods of getting user data from fb login

                // First method
                // *****************************************************

                // var graphResponse = await http.get(Uri.parse(
                //   'https://graph.facebook.com/v2.12/me?fields=picture&access_token=${accessToken.token}',
                // ));
                //
                // var profile = json.decode(graphResponse.body);
                // // if (kDebugMode) {
                // //   print(profile.toString());
                // //   print(
                // //     profile['picture']['data']['url'],
                // //   );
                // //   print('facebook login successfully ');
                // // }
                // String image = profile['picture']['data']['url'];

                // *****************************************************

                // 2nd Method and i am using 2nd one
                // *****************************************************
                final userData = await FacebookAuth.i.getUserData();
                if (kDebugMode) {
                  print('Your fb name : ${userData['name']}');
                  print('Your fb email : ${userData['email']}');
                  print(
                      'Your fb photo : ${userData['picture']['data']['url']}');
                }
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FbDetails(
                          email: '${userData['email']}',
                          name: '${userData['name']}',
                          photo: '${userData['picture']['data']['url']}',
                        )));
              }
            });
          },
          child: const Text(
            'Login with Fb',
            style: TextStyle(fontSize: 20),
          ),
        ),
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
