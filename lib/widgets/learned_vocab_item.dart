import 'package:flutter/material.dart';
import 'package:practice_app_crud/providers/learned_vocab.dart';
import 'package:provider/provider.dart';

class LearnedVocabItem extends StatelessWidget {
  final String id;
  final String word;
  final String translation;

  LearnedVocabItem(
    this.id,
    this.word,
    this.translation,
  );

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => {},
                  icon: const Icon(Icons.restore),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
