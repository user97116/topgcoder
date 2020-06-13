import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/providers/todo.dart';
import 'package:todo_list_app/utils/dialogs.dart';

class TodoCategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              showAddCategory(context);
            },
            leading: Icon(Icons.add),
            title: Text("Add Category"),
          ),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, value, child) => ListView.builder(
                itemCount: value.categoris.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    value.changeCategoryIndex(index);
                  },
                  selected: value.currentCategoryIndex == index ? true : false,
                  leading: Icon(Icons.work),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(value.categoris[index].name),
                      Text(value.categoris[index].todos
                          .where((t) => !t.complete)
                          .length
                          .toString()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
