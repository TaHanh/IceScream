import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:guide_ice_scream/api/data.dart';
import 'package:guide_ice_scream/screens/detail/detail_screen.dart';
import 'package:guide_ice_scream/util/admob_ad_event.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);
  @override
  _ListScreenState createState() => new _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  AdmobInterstitial interstitialAd;

  @override
  void initState() {
    super.initState();
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
      case "DETAIL_CLICK":
        clickAdmob(context, () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(index: value)));
        }, 2);

        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        titleSpacing: 0.0,
        title: Text('Ice Scream: Horror Neighborhood'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {
                      callBack("DETAIL_CLICK", index);
                    },
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          data[index].image,
                          width: MediaQuery.of(context).size.width,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0.0,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            color: Colors.black26,
                            child: Text(
                              "${index + 1}. ${data[index].name}",
                              style: TextStyle(color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 250.0,
            ),
          ],
        ),
      ),
    );
  }
}
