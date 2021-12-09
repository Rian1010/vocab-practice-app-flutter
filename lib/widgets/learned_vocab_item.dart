import 'package:flutter/material.dart';
import 'package:practice_app_crud/providers/learned_vocab.dart';
import 'package:practice_app_crud/providers/vocabs.dart';
import 'package:provider/provider.dart';

class LearnedVocabItem extends StatelessWidget {
  final String id;
  final String word;
  final String translation;
  final String example;
  final int level;

  LearnedVocabItem(
    this.id,
    this.word,
    this.translation,
    this.example,
    this.level,
  );

  @override
  Widget build(BuildContext context) {
    final exerciseList = Provider.of<Vocabs>(context);

    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(word),
            subtitle: Text(translation),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () => {
                    exerciseList.addToNewWords(
                        id, word, translation, example, level),
                    exerciseList.removeFromNewWords(id),
                  },
                  icon: const Icon(Icons.restore),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
