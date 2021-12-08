import 'package:flutter/foundation.dart';

class Vocab with ChangeNotifier {
  final String id;
  final String word;
  final String translation;
  final String example;
  final int level;
  bool isDone = false;
  bool isIgnored = false;

  Vocab({
    required this.id,
    required this.word,
    required this.translation,
    required this.example,
    required this.level,
  });

  void toggleDoneState() {
    isDone = !isDone;
    notifyListeners();
  }

  void toggleIgnoreState() {
    isIgnored = !isIgnored;
    notifyListeners();
  }
}
