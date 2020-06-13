import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/views/todo_category.dart';
import 'package:todo_list_app/views/todo_list.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          TodoCategoryView(),
          Expanded(
            child: TodoListView(),
          ),
        ],
      ),
    );
  }
}
