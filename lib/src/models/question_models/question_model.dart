import 'dart:math';

enum MathOperation { add, subtract, multiply, divide }

class QuestionModel {
  final int number1;
  final int number2;
  final MathOperation operation;
  late final int answer;

  QuestionModel(this.number1, this.number2, this.operation) {
    answer = _calculateAnswer();
  }

  int _calculateAnswer() {
    switch (operation) {
      case MathOperation.add: return number1 + number2;
      case MathOperation.subtract: return number1 - number2;
      case MathOperation.multiply: return number1 * number2;
      case MathOperation.divide: return number1 ~/ number2;
    }
  }

  String get questionText {
    String op;
    switch (operation) {
      case MathOperation.add: op = "+"; break;
      case MathOperation.subtract: op = "-"; break;
      case MathOperation.multiply: op = "×"; break;
      case MathOperation.divide: op = "÷"; break;
    }
    return "$number1 $op $number2 = ?";
  }

  String get operationSymbol {
    switch (operation) {
      case MathOperation.add: return "+";
      case MathOperation.subtract: return "-";
      case MathOperation.multiply: return "×";
      case MathOperation.divide: return "÷";
    }
  }

  List<int> getShuffledAnswers() {
    final rand = Random();
    final answers = <int>{answer};
    while (answers.length < 4) {
      int delta = rand.nextInt(10) + 1;
      int fake = answer + (rand.nextBool() ? delta : -delta);
      if (fake != answer && fake > 0) answers.add(fake);
    }
    return answers.toList()..shuffle();
  }

  // Factory constructor để tạo từ string operation (backward compatibility)
  factory QuestionModel.fromString(int number1, int number2, String operation, int answer) {
    MathOperation op;
    switch (operation) {
      case '+': op = MathOperation.add; break;
      case '-': op = MathOperation.subtract; break;
      case 'x':
      case '×': op = MathOperation.multiply; break;
      case '÷': op = MathOperation.divide; break;
      default: throw ArgumentError('Invalid operation: $operation');
    }
    return QuestionModel(number1, number2, op);
  }
}

List<QuestionModel> generateQuestions({
  required String operation,
  required int min,
  required int max,
  int count = 20,
}) {
  if (min >= max) throw ArgumentError('min must be less than max');
  
  final random = Random();
  final ops = ['+', '-', 'x', '÷'];
  List<QuestionModel> questions = [];

  for (int i = 0; i < count; i++) {
    String op = operation == 'mix' ? ops[random.nextInt(4)] : operation;
    QuestionModel question = _generateSingleQuestion(op, min, max, random);
    questions.add(question);
  }
  return questions;
}

QuestionModel _generateSingleQuestion(String operation, int min, int max, Random random) {
  int n1, n2;
  
  switch (operation) {
    case '+':
      n1 = random.nextInt(max - min + 1) + min;
      n2 = random.nextInt(max - min + 1) + min;
      break;
    case '-':
      n1 = random.nextInt(max - min + 1) + min;
      n2 = random.nextInt(n1 - min + 1) + min;
      break;
    case 'x':
      n1 = random.nextInt(max - min + 1) + min;
      n2 = random.nextInt(max - min + 1) + min;
      break;
    case '÷':
      n2 = random.nextInt(max - min + 1) + min;
      if (n2 == 0) n2 = 1;
      n1 = n2 * (random.nextInt(max ~/ n2) + 1);
      break;
    default:
      throw ArgumentError('Invalid operation: $operation');
  }
  
  return QuestionModel.fromString(n1, n2, operation, 0);
}