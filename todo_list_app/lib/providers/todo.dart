import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:todo_list_app/services/firestore.dart';

class TodoProvider with ChangeNotifier {
  FirestoreService firestoreService = FirestoreService.getInstance();
  int currentCategoryIndex = -1;
  List<Category> categoris = [];

  TodoProvider() {
    initCategories();
  }

  initCategories() async {
    await firestoreService.firestore
        .collection("categories")
        .getDocuments()
        .then((docs) {
      docs.documents.forEach((doc) {
        categoris.add(Category.fromMap(doc.data));
        currentCategoryIndex = 0;
      });
    });
    notifyListeners();
  }

  changeCategoryIndex(i) {
    currentCategoryIndex = i;
    notifyListeners();
  }

  addCategory(Category category) {
    categoris.add(category);
    currentCategoryIndex++;
    firestoreService.addCategory(category);
    notifyListeners();
  }

  addTodo(String categoryId, Todo todo) {
    int index = categoris.indexWhere((category) => category.id == categoryId);
    if (index != -1) {
      categoris[index].todos.add(todo);
      firestoreService.updateCategory(categoris[index].id, categoris[index]);
      notifyListeners();
    }
  }

  updateCategory(categoryId, name) {
    int catIndex = categoris.indexWhere((cat) => cat.id == categoryId);
    categoris[catIndex].name = name;
    firestoreService.updateCategory(categoryId, categoris[catIndex]);
    notifyListeners();
  }

  removeCategory(categoryId) {
    categoris.removeWhere((cat) => cat.id == categoryId);
    currentCategoryIndex--;
    firestoreService.removeCategory(categoryId);
    notifyListeners();
  }

  removeTodo(categoryId, todoId) {
    int catIndex = categoris.indexWhere((cat) => cat.id == categoryId);
    categoris[catIndex].todos.removeWhere((to) => to.id == todoId);

    firestoreService.updateCategory(categoryId, categoris[catIndex]);
    notifyListeners();
  }

  changeChecked(categoryId, todoId) {
    int catIndex = categoris.indexWhere((cat) => cat.id == categoryId);
    int toIndex = categoris[catIndex].todos.indexWhere((to) => to.id == todoId);
    categoris[catIndex].todos[toIndex].complete =
        !categoris[catIndex].todos[toIndex].complete;

    firestoreService.updateCategory(categoryId, categoris[catIndex]);
    notifyListeners();
  }
}

class Category {
  String id;
  String name;
  List<Todo> todos = [];

  Category({this.id, this.name, this.todos});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'todos': todos?.map((x) => x?.toMap())?.toList(),
    };
  }

  static Category fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Category(
      id: map['id'],
      name: map['name'],
      todos: List<Todo>.from(map['todos']?.map((x) => Todo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static Category fromJson(String source) => fromMap(json.decode(source));
}

class Todo {
  String id;
  String title;
  bool complete;
  Todo({this.id, this.title, this.complete = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'complete': complete,
    };
  }

  static Todo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Todo(
      id: map['id'],
      title: map['title'],
      complete: map['complete'],
    );
  }

  String toJson() => json.encode(toMap());

  static Todo fromJson(String source) => fromMap(json.decode(source));
}
