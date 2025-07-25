// lib/src/pages/duel_pages/duel_game_manager.dart
import 'dart:math';

enum Operation { add, subtract, multiply, divide }

class MathQuestion {
  final int a;
  final int b;
  final Operation operation;
  late final int answer;

  MathQuestion(this.a, this.b, this.operation) {
    answer = _calcAnswer();
  }

  int _calcAnswer() {
    switch (operation) {
      case Operation.add: return a + b;
      case Operation.subtract: return a - b;
      case Operation.multiply: return a * b;
      case Operation.divide: return a ~/ b;
    }
  }

  String get questionText {
    String op;
    switch (operation) {
      case Operation.add: op = "+"; break;
      case Operation.subtract: op = "-"; break;
      case Operation.multiply: op = "×"; break;
      case Operation.divide: op = "÷"; break;
    }
    return "$a $op $b = ?";
  }

  List<int> getShuffledAnswers() {
    final rand = Random();
    final answers = <int>{answer};
    while (answers.length < 4) {
      int delta = rand.nextInt(10) + 1;
      int fake = answer + (rand.nextBool() ? delta : -delta);
      if (fake != answer && fake > 0) answers.add(fake);
    }
    final list = answers.toList()..shuffle();
    return list;
  }
}

class DuelGameManager {
  final List<Operation> allowedOps;
  final int minNumber;
  final int maxNumber;
  final int winScore;
  final int timePerQuestion;

  int player1Score = 0;
  int player2Score = 0;
  MathQuestion? currentQuestion;
  bool isGameOver = false;

  DuelGameManager({
    required this.allowedOps,
    required this.minNumber,
    required this.maxNumber,
    this.winScore = 10,
    required this.timePerQuestion,
  });

  MathQuestion nextQuestion() {
    final rand = Random();
    final op = allowedOps[rand.nextInt(allowedOps.length)];
    int a, b;
    do {
      a = rand.nextInt(maxNumber - minNumber + 1) + minNumber;
      b = rand.nextInt(maxNumber - minNumber + 1) + minNumber;
      if (op == Operation.divide) b = b == 0 ? 1 : b;
    } while (op == Operation.divide && a % b != 0);
    currentQuestion = MathQuestion(a, b, op);
    return currentQuestion!;
  }

  /// Trả về: 0 = sai, 1 = player1 đúng, 2 = player2 đúng
  int answer(int player, int answer) {
    if (isGameOver || currentQuestion == null) return 0;
    if (answer == currentQuestion!.answer) {
      if (player == 1) player1Score++;
      else player2Score++;
      if (player1Score >= winScore || player2Score >= winScore) {
        isGameOver = true;
      }
      return player;
    }
    return 0;
  }

  void reset() {
    player1Score = 0;
    player2Score = 0;
    isGameOver = false;
    currentQuestion = null;
  }
}