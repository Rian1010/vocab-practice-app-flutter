import 'package:flutter/foundation.dart';
import 'package:practice_app_crud/providers/vocab.dart';

class Vocabs with ChangeNotifier {
  final List<Vocab> _words = [
    Vocab(
      id: 'w1',
      word: 'Hallo!',
      translation: 'Hello!',
      difficulty: 1,
    ),
    Vocab(
      id: 'w2',
      word: 'Wie geht es dir?',
      translation: 'How are you?',
      difficulty: 2,
    ),
    Vocab(
      id: 'w3',
      word: 'Wie',
      translation: 'How',
      difficulty: 1,
    ),
  ];

  List<Vocab> get words {
    return [..._words];
  }

  List<Vocab> get learnedWords {
    return _words.where((word) => word.isDone).toList();
  }

  List<Vocab> get ignoredWords {
    return _words.where((word) => word.isIgnored).toList();
  }

  Vocab findById(String id) {
    return _words.firstWhere((word) => word.id == id);
  }
}
