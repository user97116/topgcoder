import 'package:flutter/material.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/pages/quiz_page.dart';

class AddQuiz extends StatefulWidget {
  final CategoryModel categoryModel;

  const AddQuiz({Key key, this.categoryModel}) : super(key: key);
  @override
  _AddQuizState createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  int groupValue = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  TextEditingController threeController = TextEditingController();
  TextEditingController fourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: titleController,
                    ),
                  ),
                  RadioListTile(
                    groupValue: groupValue,
                    value: 0,
                    title: TextField(
                      controller: oneController,
                    ),
                    onChanged: (t) {
                      setState(() {
                        groupValue = 0;
                      });
                    },
                  ),
                  RadioListTile(
                    groupValue: groupValue,
                    value: 1,
                    title: TextField(
                      controller: twoController,
                    ),
                    onChanged: (t) {
                      setState(() {
                        groupValue = 1;
                      });
                    },
                  ),
                  RadioListTile(
                    groupValue: groupValue,
                    value: 2,
                    title: TextField(
                      controller: threeController,
                    ),
                    onChanged: (t) {
                      setState(() {
                        groupValue = 2;
                      });
                    },
                  ),
                  RadioListTile(
                    groupValue: groupValue,
                    value: 3,
                    title: TextField(
                      controller: fourController,
                    ),
                    onChanged: (t) {
                      setState(() {
                        groupValue = 3;
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      List<String> all = [];
                      all.add(oneController.text);
                      all.add(twoController.text);
                      all.add(threeController.text);
                      all.add(fourController.text);
                      var correct = all[groupValue];
                      all.removeAt(groupValue);
                      QuizModel quizModel = QuizModel(
                        name: titleController.text,
                        correct: correct,
                        incorrect: all,
                      );
                      print(all);
                      widget.categoryModel.quizList.add(quizModel);
                      oneController.clear();
                      twoController.clear();
                      threeController.clear();
                      fourController.clear();
                      titleController.clear();
                    },
                    child: Text("ADD"),
                    color: Colors.blue.withOpacity(0.2),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QuizPage(
                                  quizList: widget.categoryModel.quizList,
                                )));
                      },
                      child: Text("START"),
                      color: Colors.red.withOpacity(0.2)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
