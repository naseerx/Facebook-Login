import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
      title: 'Facebook Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('facebook Login'),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          onPressed: () async {
            FacebookAuth.instance.login(
                permissions: ["public_profile", "email"]).then((value) async {
              setState(() {
                isLoggedIn = true;
              });
              final LoginResult result = await FacebookAuth.instance.login();
              if (result.status == LoginStatus.success) {
                // final AccessToken accessToken = result.accessToken!;

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
        if (kDebugMode) {
          print('login ');
        }

        // final AccessToken accessToken = result.accessToken!;

        final userData = await FacebookAuth.i.getUserData();
        if (kDebugMode) {
          print(userData['name']);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

class FbDetails extends StatefulWidget {
  final String name;
  final String email;
  final String photo;

  const FbDetails({
    Key? key,
    required this.email,
    required this.name,
    required this.photo,
  }) : super(key: key);

  @override
  State<FbDetails> createState() => _FbDetailsState();
}

class _FbDetailsState extends State<FbDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    widget.photo,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'NAME: ' + widget.name,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('EMAIL: ' + widget.email,
                style: const TextStyle(fontSize: 20)),
            ElevatedButton(
                onPressed: () {
                  fbLogout();
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }

  Future<void> fbLogout() async {
    await FacebookAuth.instance.logOut();
    setState(() {});
  }
}
