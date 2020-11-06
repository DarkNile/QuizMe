import 'dart:async';
import 'dart:math';
import 'package:dtcapp/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizPage extends StatefulWidget {

  var myData;
  QuizPage({Key key, @required this.myData}) : super(key : key);

  @override
  _QuizPageState createState() => _QuizPageState(myData);
}

class _QuizPageState extends State<QuizPage> {
  var myData;
  _QuizPageState(this.myData);

  Color colorToShow = Colors.indigo;
  Color rightAnswer = Colors.green;
  Color wrongAnswer = Colors.red;
  int marks = 0;
  int i = 1;
  List array;
  int timer = 30;
  String showTimer = "30";
  bool cancelTimer = false;

  Map<String, Color> buttonColor = {
    "a" : Colors.indigo,
    "b" : Colors.indigo,
    "c" : Colors.indigo,
    "d" : Colors.indigo
  };

  void nextQuestion(){
    cancelTimer = false;
    timer = 30;
    setState(() {
      if (i < 20) {
        i++;
      }
      else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultsPage(marks : marks),
        ));
      }
      buttonColor['a'] = Colors.indigo;
      buttonColor['b'] = Colors.indigo;
      buttonColor['c'] = Colors.indigo;
      buttonColor['d'] = Colors.indigo;
    });
    //startTimer();
  }

  void checkAnswer(String option){
    if(myData[2][i.toString()] == myData[1][i.toString()][option]){
      marks = marks + 5;
      colorToShow = rightAnswer;
    }
    else {
      colorToShow = wrongAnswer;
    }
    setState(() {
      buttonColor[option] = colorToShow;
      cancelTimer = true;
    });
    Timer(Duration(seconds: 1), nextQuestion);
  }

//  void startTimer() async {
//    const oneSecond = Duration(seconds: 1);
//    Timer.periodic(oneSecond, (Timer t) {
//      setState(() {
//        if(timer < 1){
//          t.cancel();
//          nextQuestion();
//        }
//        else if(cancelTimer == true) {
//          t.cancel();
//        }
//        else {
//          timer = timer - 1;
//        }
//        showTimer = timer.toString();
//      });
//    });
//  }

  Widget choiceButton(String option){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: MaterialButton(
        onPressed: () => checkAnswer(option),
        child: Text(myData[1][i.toString()][option], style: TextStyle(
          color: Colors.white,
          fontSize: 18, fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
        ),
        color: buttonColor[option],
        splashColor: Colors.indigo[900],
        highlightColor: Colors.indigo[900],
        minWidth: 200,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  @override
  void initState() {
    //startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return WillPopScope(
      onWillPop: (){
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Warning !!', textAlign: TextAlign.center,
              style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.red[900]
            ),),
            content: Text('You can\'t go back till you finish your test.',
              style: TextStyle(
              fontSize: 15
            ),),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('Confirm', style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16
                  ),),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.orange[50],
        body: Column(
          children: <Widget>[
//            Expanded(
//                flex: 1,
//                child: Container(
////                decoration: BoxDecoration(
////                  color: Colors.teal,
////                ),
//                alignment: Alignment.bottomCenter,
//
//                child: ChangeNotifierProvider<TimeState>(
//                    create: (context) => TimeState(),
//                    child: Consumer<TimeState>(
//                      builder: (context, timeState, _) => CustomProgressBar(
//                          width: 200,
//                          value: 30,
//                          totalValue: 30,
//                      ),
//                    ),
//                ),
//
////                  child: Text(showTimer, style: TextStyle(
////                    fontSize: 35, fontWeight: FontWeight.w900, fontFamily: 'Times New Roman',
////                  ),),
//
//
//                ),
//            ),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(15),
//                decoration: BoxDecoration(
//                  color: Colors.red,
//                ),
                  child: Text(myData[0][i.toString()], style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold,
                  )),
                )
            ),
            Expanded(
                flex: 7,
                child: Container(
//                decoration: BoxDecoration(
//                  color: Colors.green,
//                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      choiceButton('a'),
                      choiceButton('b'),
                      choiceButton('c'),
                      choiceButton('d'),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}