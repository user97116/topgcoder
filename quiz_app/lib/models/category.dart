import 'dart:convert';

class CategoryModel {
  String name;
  List<QuizModel> quizList;

  CategoryModel({
    this.name,
    this.quizList,
  });

  CategoryModel copyWith({
    String name,
    List<QuizModel> quizList,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      quizList: quizList ?? this.quizList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quizList': List<dynamic>.from(quizList.map((x) => x.toMap())),
    };
  }

  static CategoryModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CategoryModel(
      name: map['name'],
      quizList: List<QuizModel>.from(
          map['quizList']?.map((x) => QuizModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static CategoryModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'CategoryModel name: $name, quizList: $quizList';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoryModel && o.name == name && o.quizList == quizList;
  }

  @override
  int get hashCode => name.hashCode ^ quizList.hashCode;
}

class QuizModel {
  String name;
  String imgUrl;
  String correct;
  List<String> incorrect;
  QuizModel({
    this.name,
    this.imgUrl,
    this.correct,
    this.incorrect,
  });

  QuizModel copyWith({
    String name,
    String imgUrl,
    String correct,
    List<String> incorrect,
  }) {
    return QuizModel(
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      correct: correct ?? this.correct,
      incorrect: incorrect ?? this.incorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imgUrl': imgUrl,
      'correct': correct,
      'incorrect': List<dynamic>.from(incorrect.map((x) => x)),
    };
  }

  static QuizModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return QuizModel(
      name: map['name'],
      imgUrl: map['imgUrl'],
      correct: map['correct'],
      incorrect: List<String>.from(map['incorrect']),
    );
  }

  String toJson() => json.encode(toMap());

  static QuizModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizModel name: $name, imgUrl: $imgUrl, correct: $correct, incorrect: $incorrect';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuizModel &&
        o.name == name &&
        o.imgUrl == imgUrl &&
        o.correct == correct &&
        o.incorrect == incorrect;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imgUrl.hashCode ^
        correct.hashCode ^
        incorrect.hashCode;
  }
}

List<CategoryModel> categories = [
  CategoryModel(
    name: "Basic",
    quizList: [
      QuizModel(
        name: "What is flutter?",
        correct: "Framework",
        incorrect: [
          "Editor",
          "Module",
          "Library",
        ],
      ),
    ],
  ),
];
