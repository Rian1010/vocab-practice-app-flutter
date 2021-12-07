import 'package:flutter/material.dart';
import 'package:practice_app_crud/providers/vocabs.dart';
import '../providers/vocab.dart';
import 'package:provider/provider.dart';

import 'vocab_item.dart';

class VocabList extends StatefulWidget {
  static const routeName = '/';

  @override
  _VocabListState createState() => _VocabListState();
}

class _VocabListState extends State<VocabList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final vocabData = Provider.of<Vocabs>(context);

    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          const Divider(),
          ListView.builder(
              itemBuilder: (ctx, i) => VocabItem(vocabData.words[i])),
          ListTile(
            title: Text(
              vocabData.words.toString(),
            ),
            subtitle: const Text('Word Example'),
            tileColor: Colors.white,
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              icon: _isExpanded
                  ? const Icon(Icons.expand_less)
                  : const Icon(Icons.expand_more),
            ),
          ),
          if (_isExpanded)
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(color: Colors.blue[100]),
              child: ListView(
                children: const <Widget>[
                  Text('TEST 1'),
                  Text('TEST 2'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
