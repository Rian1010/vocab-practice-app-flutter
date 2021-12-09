import 'package:flutter/foundation.dart';

class LearnedVocab {
  final String id;
  final String word;
  final String translation;
  final String example;
  final int level;

  LearnedVocab({
    required this.id,
    required this.word,
    required this.translation,
    required this.example,
    required this.level,
  });
}

class Learned with ChangeNotifier {
  final Map<String, LearnedVocab> _learned = {};

  Map<String, LearnedVocab> get learned {
    return {..._learned};
  }

  void addLearnedWord(
    String vocabId,
    String word,
    String translation,
    int level,
    String example,
  ) {
    _learned.putIfAbsent(
      vocabId,
      () => LearnedVocab(
        id: vocabId,
        word: word,
        translation: translation,
        example: example,
        level: level,
      ),
    );
    notifyListeners();
  }

  void removeLearnedWord(String id) {
    _learned.removeWhere((key, value) => key == id && value == id);
    notifyListeners();
  }
}
