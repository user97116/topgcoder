import 'package:flutter/material.dart';

import '../models/category.dart';
import 'quiz_page.dart';

class AddQuiz extends StatefulWidget {
  final CategoryModel categoryModel;

  const AddQuiz({Key key, this.categoryModel}) : super(key: key);
  @override
  _AddQuizState createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  GlobalKey<FormState> _formKey = GlobalKey();
  int groupValue = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  TextEditingController threeController = TextEditingController();
  TextEditingController fourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Quiz",
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: titleController,
                        decoration: getDecoration("Question name"),
                        validator: (t) {
                          if (t.isEmpty)
                            return "*Required field";
                          else
                            return null;
                        },
                      ),
                    ),
                    RadioListTile(
                      groupValue: groupValue,
                      value: 0,
                      title: TextFormField(
                        controller: oneController,
                        decoration: getDecoration("Option 1"),
                        validator: (t) {
                          if (t.isEmpty)
                            return "*Required field";
                          else
                            return null;
                        },
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
                      title: TextFormField(
                        controller: twoController,
                        decoration: getDecoration("Option 2"),
                        validator: (t) {
                          if (t.isEmpty)
                            return "*Required field";
                          else
                            return null;
                        },
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
                      title: TextFormField(
                        controller: threeController,
                        decoration: getDecoration("Option 3"),
                        validator: (t) {
                          if (t.isEmpty)
                            return "*Required field";
                          else
                            return null;
                        },
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
                      title: TextFormField(
                        controller: fourController,
                        decoration: getDecoration("Option 4"),
                        validator: (t) {
                          if (t.isEmpty)
                            return "*Required field";
                          else
                            return null;
                        },
                      ),
                      onChanged: (t) {
                        setState(() {
                          groupValue = 3;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      MaterialButton(
                        height: 40.0,
                        padding: EdgeInsets.all(0.0),
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          validate();
                        },
                        color: Colors.green,
                        child: Text(
                          "ADD",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      MaterialButton(
                        height: 40.0,
                        padding: EdgeInsets.all(0.0),
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => QuizPage(
                                    quizList: widget.categoryModel.quizList,
                                  )));
                        },
                        color: Colors.orange,
                        child: Text(
                          "START",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
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
      ),
    );
  }

  _showMessage(String msg) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("$msg",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  getDecoration(hint) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffdfdfdf)),
    );
    return InputDecoration(
      hintText: "$hint",
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      border: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );
  }

  validate() {
    if (_formKey.currentState.validate()) if (oneController.text.isNotEmpty &&
        twoController.text.isNotEmpty &&
        threeController.text.isNotEmpty &&
        fourController.text.isNotEmpty) {
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

      widget.categoryModel.quizList.add(quizModel);
      oneController.clear();
      twoController.clear();
      threeController.clear();
      fourController.clear();
      titleController.clear();
      _showMessage("Quiz is added");
    }
  }
}
