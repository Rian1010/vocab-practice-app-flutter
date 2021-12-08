import 'package:flutter/material.dart';
import 'package:practice_app_crud/providers/learned_vocab.dart';
import 'package:provider/provider.dart';

class LearnedVocabItem extends StatefulWidget {
  final LearnedVocab learnedVocab;

  LearnedVocabItem(this.learnedVocab);

  @override
  _LearnedVocabItemState createState() => _LearnedVocabItemState();
}

class _LearnedVocabItemState extends State<LearnedVocabItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(widget.learnedVocab.word),
            subtitle: Text(widget.learnedVocab.example),
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
