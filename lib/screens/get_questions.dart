import 'dart:convert';
import 'package:dtcapp/screens/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetQuestions extends StatefulWidget {
  @override
  _GetQuestionsState createState() => _GetQuestionsState();
}

class _GetQuestionsState extends State<GetQuestions> {
      List<dynamic> questions = <dynamic> [];

  Future<String> loadQuestions() async =>
      await rootBundle.loadString('assets/test.json');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
        future: loadQuestions(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green,
              )
            );
          }
          else {
            List<dynamic> parsedJson = jsonDecode(snapshot.data.toString());
            questions = parsedJson;
          }
            return QuizPage(myData: questions);
        }
        )
    );
  }
  }

