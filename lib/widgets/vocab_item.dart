import 'package:flutter/material.dart';
import '../providers/vocab.dart';

class VocabItem extends StatefulWidget {
  final Vocab vocabulary;

  VocabItem(this.vocabulary);

  @override
  State<VocabItem> createState() => _VocabItemState();
}

class _VocabItemState extends State<VocabItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 7,
      color: widget.vocabulary.isIgnored ? Colors.grey.shade50 : Colors.white,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              widget.vocabulary.word,
              style: TextStyle(
                color: widget.vocabulary.isIgnored
                    ? Colors.black87.withOpacity(0.35)
                    : Colors.black87,
              ),
            ),
            subtitle: Text(
              widget.vocabulary.example,
              style: TextStyle(
                color: widget.vocabulary.isIgnored
                    ? Colors.black87.withOpacity(0.35)
                    : Colors.black87,
              ),
            ),
            trailing: Wrap(
              children: <Widget>[
                IconButton(
                  onPressed: () => {
                    setState(() {
                      widget.vocabulary.toggleIgnoreState();
                    })
                  },
                  icon: const Icon(Icons.remove_red_eye),
                  color: widget.vocabulary.isIgnored
                      ? Colors.grey[350]
                      : Colors.grey,
                ),
                IconButton(
                  onPressed: () => {
                    setState(() {
                      widget.vocabulary.toggleDoneState();
                    })
                  },
                  icon: const Icon(Icons.done),
                  color: widget.vocabulary.isDone || widget.vocabulary.isIgnored
                      ? Colors.blueGrey[200]
                      : Colors.green,
                ),
                IconButton(
                  onPressed: () => {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    })
                  },
                  icon: _isExpanded
                      ? const Icon(Icons.expand_less)
                      : const Icon(Icons.expand_more),
                ),
              ],
            ),
          ),
          if (_isExpanded)
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(color: Colors.blue.shade100),
              child: ListView(
                children: <Widget>[
                  Text('Meaning: ${widget.vocabulary.translation}'),
                  Text('Level: ${widget.vocabulary.level.toString()}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
