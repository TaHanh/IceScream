import 'package:flutter/material.dart';
import 'package:guide_ice_scream/api/data.dart';
import 'package:guide_ice_scream/util/admob_ad_event.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({Key key}) : super(key: key);
  @override
  _QuestionScreenState createState() => new _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void showAnswer(context, index) {
    showGeneralDialog(
      barrierLabel: "Question",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Scaffold(
          backgroundColor: Color(0xFF1a1a1a),
          appBar: AppBar(
            titleSpacing: 0.0,
            title: Text('Answer The Question'),
            backgroundColor: Colors.black87,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Container(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      '${questions[index].question}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: questions[index].answer.length,
                      itemBuilder: (BuildContext context, int ind) => Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${questions[index].answer[ind].user}: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Color(0xFFf55555),
                                  )),
                              TextSpan(
                                text: '${questions[index].answer[ind].value}',
                                style: TextStyle(fontSize: 16.0, color: Colors.white),
                              ),
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
              )),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  @override
  callBack(key, value) {
    switch (key) {
      case "ANSWER_CLICK":
        showAnswer(value["context"], value["index"]);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        titleSpacing: 0.0,
        title: Text('Frequently asked Questions'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: questions.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: EdgeInsets.fromLTRB(5.0, 15.0, 10.0, 15.0),
                  decoration: BoxDecoration(),
                  child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        callBack("ANSWER_CLICK", {"context": context, "index": index});
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 15.0, left: 15.0),
                            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            decoration: BoxDecoration(
                              // color: Colors.white10,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.redAccent.withOpacity(0.3),
                                  width: 0.5,
                                ),
                                bottom: BorderSide(
                                  color: Colors.redAccent.withOpacity(0.3),
                                  width: 0.5,
                                ),
                                left: BorderSide(
                                  color: Colors.redAccent.withOpacity(0.3),
                                  width: 0.5,
                                ),
                                right: BorderSide(
                                  color: Colors.redAccent.withOpacity(0.3),
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: Text(
                              questions[index].question,
                              style: TextStyle(color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                          Positioned(
                            top: 0.0,
                            left: 0.0,
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                // borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: Color(0xFFf71138),
                              ),
                              child: Text(
                                (index + 1).toString(),
                                style: TextStyle(color: Colors.white, fontSize: 18.0),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Icon(
                              Icons.navigate_next,
                              color: Colors.white60,
                            ),
                          )
                        ],
                      )),
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
