import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:guide_ice_scream/util/admob_ad_event.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key key}) : super(key: key);
  @override
  _AboutScreenState createState() => new _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        titleSpacing: 0.0,
        title: Text('ICE SCREAM: HORROR NEIGHBORHOOD'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "WHAT'S IT ABOUT?",
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Text(
                    "In ICE SCREAM: HORROR NEIGHBORHOOD, you watch in horror when the ice cream man attacks a kid and pulls them into his truck. But rather than do the responsible thing and call the cops, or even your parents, you decide to pull a move from Stranger Things and rescue the kid yourself. Played from the first-person perspective, but with relatively simple touch controls, you have to explore the world, and figure out how to solve some situational problems. Just be sure to be sneaky because if the ice cream man sees you...",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 5.0),
                    child: Text("IS IT ANY GOOD?",
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  Text(
                    "As much as you may enjoy a good scare, the most frightening thing about this scary stealth game is its prohibitively awkward controls. In Ice Scream: Horror Neighborhood you're a kid who's excited to see the ice cream truck... until you witness the ice cream man grab one of your school chums. Played from the first-person perspective, you have to rescue the kid by exploring the world and solving problems, all while doing your best to not be seen by the ice cream man.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "While this take on a precious childhood memory could add to the fright factor here, this isn't nearly as scary, or engaging, as it could've been. For starters, the controls don't work as well as they should for a game in which you have to run away from a child predator. Not only does it not let you interact with objects unless you're positioned just right, but the movement controls are really clunky. It also doesn't help that the ice cream man has better situational awareness than he should for a man wearing a large, unwieldy mask (or is that his head?). And yet he sometimes can’t find you even when he sees you you duck into a hiding spot. All of which is why Ice Scream: Horror Neighborhood isn't even as scary as getting brain freeze from a milk shake.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
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
