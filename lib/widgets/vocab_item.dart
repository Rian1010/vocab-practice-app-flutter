import 'package:flutter/material.dart';
import '../providers/vocab.dart' as voc;

class VocabItem extends StatefulWidget {
  final voc.VocabItem vocabulary;

  VocabItem(this.vocabulary);

  @override
  State<VocabItem> createState() => _VocabItemState();
}

class _VocabItemState extends State<VocabItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('${widget.vocabulary.word}'),
          )
        ],
      ),
    );
  }
}
