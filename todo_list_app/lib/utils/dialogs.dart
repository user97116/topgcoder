import 'package:flutter/material.dart';
import 'package:todo_list_app/providers/todo.dart';
import 'package:provider/provider.dart';

showAddCategory(context, {edit = false}) {
  TextEditingController textEditingController = TextEditingController();
  String inputText;
  GlobalKey<FormState> _formKey = GlobalKey();
  showDialog(
    context: context,
    builder: (context) {
      var name = context.select<TodoProvider, String>((state) =>
          state.currentCategoryIndex != -1
              ? state.categoris[state.currentCategoryIndex].name
              : null);
      textEditingController.text = edit ? name : null;
      return Form(
        key: _formKey,
        child: AlertDialog(
          title: Text(edit ? "Update Category" : "Add Category"),
          content: TextFormField(
            controller: textEditingController,
            onSaved: (text) {
              inputText = text;
            },
            validator: (text) {
              if (text.isEmpty) return "Category can't be empty";
              return null;
            },
            decoration: InputDecoration(hintText: "eg. work"),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            if (edit)
              FlatButton(
                onPressed: () {
                  var read = context.read<TodoProvider>();
                  var catId = read.categoris[read.currentCategoryIndex].id;
                  read.removeCategory(catId);
                  Navigator.pop(context);
                },
                child: Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  if (!edit) {
                    context.read<TodoProvider>().addCategory(
                          Category(
                            id: UniqueKey().toString(),
                            name: inputText,
                            todos: [],
                          ),
                        );
                  } else {
                    var read = context.read<TodoProvider>();
                    var catId = read.categoris[read.currentCategoryIndex].id;
                    context
                        .read<TodoProvider>()
                        .updateCategory(catId, inputText);
                  }
                  Navigator.pop(context);
                }
              },
              child: Text(
                edit ? "Update" : "Add",
              ),
            ),
          ],
        ),
      );
    },
  );
}
