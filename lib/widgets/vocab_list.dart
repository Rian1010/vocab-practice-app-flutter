import 'package:flutter/material.dart';
import 'package:practice_app_crud/providers/vocabs.dart';
import '../providers/vocab.dart';
import 'package:provider/provider.dart';

class VocabList extends StatefulWidget {
  const VocabList({Key? key}) : super(key: key);

  @override
  _VocabListState createState() => _VocabListState();
}

class _VocabListState extends State<VocabList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final vocabId = ModalRoute.of(context)!.settings.arguments as String;
    final vocabData =
        Provider.of<Vocabs>(context, listen: false).findById(vocabId);

    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          const Divider(),
          ListTile(
            title: Text(vocabData.words.toString()),
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