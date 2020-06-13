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
          style: Theme.of(context).textTheme.display1,
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
              widget.quizList.shuffle();
              Navigator.pop(context);
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
    widget.quizList.shuffle();
    allAnswers.add(widget.quizList[0].correct);
    allAnswers.addAll(widget.quizList[0].incorrect);
    allAnswers.shuffle();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        timer.cancel();
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.orange.withOpacity(0.7),
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "${questionNo + 1}",
                      style: Theme.of(context).textTheme.headline.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "$time",
                      style: Theme.of(context).textTheme.headline.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.quizList[questionNo].name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.display1.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              height: 40.0,
                              onPressed: () {
                                nextQuestion(0);
                              },
                              child: Text(
                                allAnswers[0],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                            MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              height: 40.0,
                              onPressed: () {
                                nextQuestion(1);
                              },
                              child: Text(
                                allAnswers[1],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                            MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              height: 40.0,
                              onPressed: () {
                                nextQuestion(2);
                              },
                              child: Text(
                                allAnswers[2],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                            MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              height: 40.0,
                              onPressed: () {
                                nextQuestion(3);
                              },
                              child: Text(
                                allAnswers[3],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
