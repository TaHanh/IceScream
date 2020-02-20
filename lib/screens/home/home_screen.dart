import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:guide_ice_scream/config/env.dart';
import 'package:guide_ice_scream/main.dart';
import 'package:guide_ice_scream/screens/about/about_screen.dart';
import 'package:guide_ice_scream/screens/list/list_screen.dart';
import 'package:guide_ice_scream/screens/questions/question_screen.dart';
import 'package:guide_ice_scream/util/admob_ad_event.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String appId;
  AdmobInterstitial interstitialAd;
  @override
  void initState() {
    super.initState();
    getAppID();
    showBanner();
  }

  @override
  void showBanner() {
    BannerAd myBanner = BannerAd(
      adUnitId: admobBannerID,
      size: AdSize.mediumRectangle,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
    myBanner
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
      );
  }

  getAppID() async {
    appId = await MyApp.platform.invokeMethod("getAppId");
    setState(() {
      appId;
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (interstitialAd != null) {
      interstitialAd.dispose();
    }
  }

  @override
  callBack(key, value) {
    switch (key) {
      case "GUIDE":
        clickAdmob(context, () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen()));
        }, 10);

        break;
      case "QUESTION":
        clickAdmob(context, () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionScreen()));
        }, 10);
        break;
      case 'ABOUT':
        clickAdmob(context, () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
        }, 10);
        break;
      case "SHARE":
        Share.share('Ice Scream: Horror Neighborhood https://play.google.com/store/apps/details?id=${appId}');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new ExactAssetImage('assets/images/120.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(color: Colors.red),
                        ),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                          child: Text(
                            "GUIDE",
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            callBack("GUIDE", "");
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                          child: Text(
                            "QUESTIONS",
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            callBack("QUESTION", "");
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(color: Colors.red),
                        ),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                          child: Text(
                            "ABOUT",
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            callBack("ABOUT", "");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(top: 30.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            callBack("SHARE", "");
                          },
                          icon: Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250.0,
          ),
        ],
      ),
    );
  }
}
