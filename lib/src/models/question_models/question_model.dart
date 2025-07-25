import 'dart:math';

class QuestionModel {
  final int number1;
  final int number2;
  final String operation;
  final int answer;

  QuestionModel({required this.number1, required this.number2, required this.operation, required this.answer});
}


List<QuestionModel> generateQuestions({
  required String operation,
  required int min,
  required int max,
  int count = 20,
}) {
  final random = Random();
  final ops = ['+', '-', 'x', '÷'];
  List<QuestionModel> questions = [];

  for (int i = 0; i < count; i++) {
    String op = operation == 'mix' ? ops[random.nextInt(4)] : operation;
    int n1 = random.nextInt(max - min + 1) + min;
    int n2 = random.nextInt(max - min + 1) + min;
    int ans = 0;

    switch (op) {
      case '+':
        ans = n1 + n2;
        break;
      case '-':
        if (n1 < n2) {
          int tmp = n1;
          n1 = n2;
          n2 = tmp;
        }
        ans = n1 - n2;
        break;
      case 'x':
        ans = n1 * n2;
        break;
      case '÷':
        n2 = n2 == 0 ? 1 : n2;
        ans = n1 * n2;
        int temp = ans;
        ans = temp ~/ n2;
        n1 = temp;
        break;
    }
    questions.add(QuestionModel(number1: n1, number2: n2, operation: op, answer: ans));
  }
  return questions;
}