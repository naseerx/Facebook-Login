import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ads.dart';

class InterstitialAdScreen extends StatefulWidget {
  const InterstitialAdScreen({Key? key}) : super(key: key);

  @override
  State<InterstitialAdScreen> createState() => _InterstitialAdScreenState();
}

class _InterstitialAdScreenState extends State<InterstitialAdScreen> {

  InterstitialAd? _interstitialAd;

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Navigator.pop(context);
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
  }
  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('interstitial Ad'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _interstitialAd?.show();
            },
            child: const Text('Interstitial ADS')),
      ),
    );
  }
}
