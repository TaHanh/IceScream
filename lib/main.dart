import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guide_ice_scream/config/env.dart';
import 'package:guide_ice_scream/screens/home/home_screen.dart';

void main() {
  Admob.initialize(admobAppID);
  FirebaseAdMob.instance.initialize(appId: admobAppID);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const platform = const MethodChannel('guide_module');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        child: HomeScreen(),
        onWillPop: onPop,
      ),
    );
//    return MaterialApp(debugShowCheckedModeBanner: false, initialRoute: '/', routes: {
//      '/': (context) => HomeScreen(),
//    });
  }

  Future<bool> onPop() {
    platform.invokeMethod("showDialogBack");
    return Future.value(false);
  }
}
