import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/providers/todo.dart';
import 'package:todo_list_app/utils/dialogs.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: Column(
        children: [
          if (context.select<TodoProvider, int>(
                  (state) => state.currentCategoryIndex) !=
              -1)
            ListTile(
              onTap: () {
                showAddTodo(context);
              },
              leading: Icon(Icons.add),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add Todo"),
                  FlatButton(
                    onPressed: () {
                      showAddCategory(context, edit: true);
                    },
                    child: Text("Edit"),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, value, child) {
                if (value.categoris.isNotEmpty)
                  return ListView.builder(
                    itemCount: value
                        .categoris[value.currentCategoryIndex].todos.length,
                    itemBuilder: (context, index) {
                      var todoItem =
                          value.categoris[value.currentCategoryIndex];
                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (t) {
                          value.changeChecked(
                            todoItem.id,
                            todoItem.todos[index].id,
                          );
                        },
                        value: todoItem.todos[index].complete,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              todoItem.todos[index].title,
                              style: TextStyle(
                                decoration: todoItem.todos[index].complete
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  value.removeTodo(
                                      todoItem.id, todoItem.todos[index].id);
                                },
                                icon: Icon(Icons.delete, color: Colors.red)),
                          ],
                        ),
                      );
                    },
                  );
                else
                  return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  showAddTodo(context) {
    String inputText;
    GlobalKey<FormState> _formKey = GlobalKey();
    showDialog(
      context: context,
      builder: (context) => Form(
        key: _formKey,
        child: AlertDialog(
          title: Text("Add Todo"),
          content: TextFormField(
            onSaved: (text) {
              inputText = text;
            },
            validator: (text) {
              if (text.isEmpty) return "Todo can't be empty";
              return null;
            },
            decoration: InputDecoration(hintText: "eg. brings apple"),
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
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  var read = context.read<TodoProvider>();
                  read.addTodo(
                    read.categoris[read.currentCategoryIndex].id,
                    Todo(
                      id: UniqueKey().toString(),
                      title: inputText,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
