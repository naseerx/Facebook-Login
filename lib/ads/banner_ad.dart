import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ads.dart';

class BannerAdd extends StatefulWidget {
  const BannerAdd({Key? key}) : super(key: key);

  @override
  State<BannerAdd> createState() => _BannerAddState();
}

class _BannerAddState extends State<BannerAdd> {
  BannerAd? _bannerAd;

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  @override
  void initState() {
    super.initState();

    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          if (kDebugMode) {
            print('Failed to load a banner ad: ${err.message}');
          }
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: const Text('BANNER ADD'),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: _bannerAd != null
            ? SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              )
            : const Text('Ads Here'), // ElevatedButton(
        //   onPressed: () async {
        //     FacebookAuth.instance.login(
        //         permissions: ["public_profile", "email"]).then((value) async {
        //       setState(() {
        //         _isLoggedIn = true;
        //       });
        //       final LoginResult result = await FacebookAuth.instance.login();
        //       if (result.status == LoginStatus.success) {
        //         print('facebook login successfully ');
        //         final AccessToken accessToken = result.accessToken!;
        //         final userData = await FacebookAuth.i.getUserData();
        //         print('Your fb name : ${userData['name']}');
        //         print('Your fb email : ${userData['email']}');
        //       }
        //     });
        //   },
        //   child: const Text('Login with Fb'),
        // ),
      ),
    );
  }
}
