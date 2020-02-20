import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:guide_ice_scream/util/admob_ad_event.dart';

class MoreScreen extends StatefulWidget {
  MoreScreen({Key key}) : super(key: key);
  @override
  _MoreScreenState createState() => new _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
        title: Text('Ice Scream Episode 2 Review'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                children: <Widget>[
                  Text(
                    "Ice Scream Episode 2: Horror Neighborhood release date was on 17 December 2019, and it came just in time for the Holiday season. With nothing to do but revel in the warmth of our homes and enjoy some time off, I’ve thought of playing some recommended games, and this title sounded attractive. If you are one to love a scary, heart-stopping experience and Holidays are otherwise boring without some old school horror, well…this title is just the thing.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Image.asset(
                      "assets/images/guide21.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    "We say old school, because the entire atmosphere, music, and art style screams ‘80s, while the whole ice cream truck of horror is a classic favorite, as the Ice Scream Episode 2: Horror Neighborhood trailer shows in a flash. But, this game will literally have you jumping from your seat, because it puts us in the position of the characters in those teenage horror movies and makes the entire experience quite lively and vicarious.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "Development and reception",
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Text(
                    "This title is offered by Keplerians Horror Games on both Android and iOS. The studio is both the developer and publisher of their fine horror work, and they are also behind such gruesome titled as Mr Meat: horror Escape Room and Evil Nun: Scary Horror Game Adventure. While certainly a mouthful, the titles are actually dedicated to bringing the horror/thriller genre to our mobile devices and keeping them there.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 5.0),
                    child: Text("Story",
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  Text(
                    "Stepping away from the usual narrative method where the story is just something following the gameplay to fill in the gaps, this game actually plays out like a movie. As we progress, we discover the story about the terrible ice cream seller, familiar to people who played the first installment of this game. However, we also follow a story of a kid who is abused and isolated at school and develops this hatred towards children. That’s as far as we can go without spoilers.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Image.asset(
                      "assets/images/guide22.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    "In this sequel, the Ice Cream man, Rod, is once again on the loose and he has kidnapped a girl name Lis, who is a friend of the main character we play. In fact, she gets snatched in front of our eyes, and we need to take action if we are to free her and save other kids. However, the sounds of terrible Ice Screams are never dull.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 5.0),
                    child: Text("Gameplay",
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  Text(
                    "As far as placing this title in the adventure genre goes, it does have the control setup of a standard FPS adventure. You walk and look around, point your reticule towards an object and tap the interact command. However, things get a lot more complicated than that.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "Firstly, I started this game with high ambition, setting it at Hard Difficulty… That was a mistake. The difficulty options are very important, as they will determine the experience you have quite profusely. For instance, on the Hard setting, Rod can walk quickly, hear everything, and we only get three attempts which, let me just say this right now, IS NOT ENOUGH. Every time you try to walk just a little bit faster, you will make a noise, even when crouched, and Rod will hear you and creep up behind you to give you a heart attack.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Image.asset(
                      "assets/images/guide23.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    "Secondly, the Remove ads button takes you to a menu where you are offered to purchase the game to enjoy it add free. It is understandable and perhaps necessary if you get caught too often, for every time Rod catches you and you fail a level, you will have to sit through a 30 sec add.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "Controls are rather simple. You have the movement pad, you look around by swiping any part of the screen, there is the Hint button to provide help, and the Hide button. Now, hiding is an interesting and crucial mechanic, as you will often need to use it. In fact, the entire gameplay might be described as sneaking from cover to cover, hoping a murderous clown with a giant scary mask doesn’t hear you and comes running to chill you with his icy breath. It adds to the suspense greatly and helps with the immersive experience.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Image.asset(
                      "assets/images/guide24.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    "The gameplay gets somewhat expanded as we go along and progress further. There are various items we need to use in order to get around puzzles and obstacles set before us. For instance, we need to use simple items like a Matchbox, Doorknob, Keys, Analog Alarm clocks and such, but we also get some advanced tools to complete our skill set. There is also the puzzle mode, which is separate to the main story, and offers challenges like capture the cat, get the clock, access an abandoned place, and much more. Most of these items or challenges will require you to watch multiple videos to reveal or obtain.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 5.0),
                    child: Text("Graphics and appearance",
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  Text(
                    "This game’s overall appearance style is done in a somewhat old school way, reminiscent of the fps adventures of the ‘00s. Now, this is also adding to the entire atmosphere, for it only increases the horror effect, like those old school movies are even more scary on the old footage. The models and animations follow this rule as well, as this game can definitely scare the living s#*t out of you.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 5.0),
                    child: Text("Verdict",
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  Text(
                    "Ice Scream Episode 2: Horror Neighborhood mobile game is definitely meant for old school fans of the horror of the ‘80s and the ‘90s. If thrill and horror chill is your thing, this game will get the creeping blood pump going and up that heart rate to dangerously high. Also, having four difficulty levels gives the game the ability to accommodate a wider audience, to which its simple controls complement nicely. However, at Hard and Extreme level difficulties, this game will make you lose your mind. It definitely has adrenaline screaming fun potential.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Image.asset(
                      "assets/images/guide25.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250.0,
            ),
            // bannerWidget(context, AdmobBannerSize.MEDIUM_RECTANGLE)
          ],
        ),
      ),
    );
  }
}
