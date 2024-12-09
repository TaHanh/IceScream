import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:guide_ice_scream/api/data.dart';
import 'package:guide_ice_scream/util/admob_ad_event.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key key, this.index}) : super(key: key);
  int index;
  @override
  _DetailScreenState createState() => new _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.06),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        titleSpacing: 0.0,
        title: Text(
          "${widget.index + 1}. ${data[widget.index].name}",
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
                    child: Text(
                      "${data[widget.index].name}",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Image.asset(data[widget.index].description[0]),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    child: Text(
                      data[widget.index].description[1],
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Image.asset(data[widget.index].description[2]),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    child: Text(
                      data[widget.index].description[3],
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Image.asset(data[widget.index].description[4]),
                ],
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
