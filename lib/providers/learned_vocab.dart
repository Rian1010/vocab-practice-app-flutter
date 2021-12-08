import 'package:flutter/material.dart';
import 'package:practice_app_crud/providers/vocab.dart';

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
  List<LearnedVocab> _learned = [];

  List<LearnedVocab> get learned {
    return [..._learned];
  }

  void addLearnedWord(Vocab vocab) {
    _learned.insert(
      0,
      LearnedVocab(
        id: vocab.id,
        word: vocab.word,
        translation: vocab.translation,
        example: vocab.example,
        level: vocab.level,
      ),
    );
    notifyListeners();
  }
}
