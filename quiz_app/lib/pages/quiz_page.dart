import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/category.dart';

class QuizPage extends StatefulWidget {
  final List<QuizModel> quizList;

  const QuizPage({Key key, this.quizList}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> allAnswers = [];
  int questionNo = 0;
  Timer timer;
  int time = 15;
  int scores = 0;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        if (time < 1) {
          t.cancel();
          nextQuestion();
        } else {
          time = time - 1;
        }
      });
    });
  }

  nextQuestion([int option]) {
    timer.cancel();
    if (option != null &&
        allAnswers[option] == widget.quizList[questionNo].correct) {
      scores++;
    }

    if (questionNo < widget.quizList.length - 1) {
      questionNo++;
      allAnswers = [];
      allAnswers.add(widget.quizList[questionNo].correct);
      allAnswers.addAll(widget.quizList[questionNo].incorrect);
      allAnswers.shuffle();
      time = 15;
      startTimer();
    } else {
      timer.cancel();
      showResult();
    }
  }

  showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Text(
          "Correct $scores",
          style: Theme.of(context).textTheme.display2,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("CANCEL"),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text("RETRY"),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => QuizPage(
                        quizList: widget.quizList,
                      )));
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    allAnswers.add(widget.quizList[0].correct);
    allAnswers.addAll(widget.quizList[0].incorrect);
    allAnswers.shuffle();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "${questionNo + 1}",
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  "$time",
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  widget.quizList[questionNo].name,
                  style: Theme.of(context).textTheme.display2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        nextQuestion(0);
                      },
                      child: Text(allAnswers[0]),
                    ),
                    FlatButton(
                      onPressed: () {
                        nextQuestion(1);
                      },
                      child: Text(allAnswers[1]),
                    ),
                    FlatButton(
                      onPressed: () {
                        nextQuestion(2);
                      },
                      child: Text(allAnswers[2]),
                    ),
                    FlatButton(
                      onPressed: () {
                        nextQuestion(3);
                      },
                      child: Text(allAnswers[3]),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
