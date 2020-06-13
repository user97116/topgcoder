import 'package:flutter/material.dart';
import 'package:quiz_app/models/category.dart';

import 'add_quiz.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          elevation: 0.0,
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddQuiz(
                        categoryModel: categories[index],
                      )));
            },
            title: Text(
              categories[index].name,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            trailing: CircleAvatar(
              maxRadius: 15,
              backgroundColor: Colors.red,
              child: Text(
                "${categories[index].quizList.length}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        itemCount: categories.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showCategory,
        child: Icon(Icons.add),
      ),
    );
  }

  showCategory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Category"),
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: categoryController,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              categoryController.clear();
              Navigator.pop(context);
            },
            child: Text("CANCEL"),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                categories.add(CategoryModel(
                  name: categoryController.text,
                  quizList: [],
                ));
              });
              categoryController.clear();
              Navigator.pop(context);
            },
            child: Text("ADD"),
          ),
        ],
      ),
    );
  }
}
