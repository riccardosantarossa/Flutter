//SANTAROSSA RICCARDO 5BIA 24/01/2022

class Question {
  final String category;
  final String difficulty;
  final String type;
  final String question;
   String correct;
   List<String> incorrect;

  Question(
      {required this.category,
      required this.difficulty,
      required this.type,
      required this.question,
      required this.correct,
      required this.incorrect});

  factory Question.fromJson(Map<String, dynamic> parsedJson) {
    return Question(
        category: parsedJson['category'],
        difficulty: parsedJson['difficulty'],
        type: parsedJson['type'],
        question: parsedJson['question'],
        correct: parsedJson['correct_answer'],
        incorrect: parsedJson['incorrect_answers']
            .map<String>((val) => val.toString())
            .toList());
  }

  @override
  String toString() {
    return "question " +
        this.question +
        ": " +
        this.difficulty +
        " " +
        this.category +
        " " +
        this.correct;
  }
}
