class CategoryModel {
  String name;
  List<QuizModel> quizList;

  CategoryModel({
    this.name,
    this.quizList,
  });
}

class QuizModel {
  String name;
  String correct;
  List<String> incorrect;
  QuizModel({
    this.name,
    this.correct,
    this.incorrect,
  });
}

List<CategoryModel> categories = [];
