import 'package:flutter/material.dart';
import 'package:practice_app_crud/providers/learned_vocab.dart';
import 'package:practice_app_crud/providers/vocabs.dart';
import 'package:practice_app_crud/widgets/learned_vocab_item.dart';
import 'package:provider/provider.dart';
import '../providers/vocab.dart';

class VocabItem extends StatefulWidget with ChangeNotifier {
  VocabItem({Key? key}) : super(key: key);

  @override
  State<VocabItem> createState() => _VocabItemState();
}

class _VocabItemState extends State<VocabItem> {
  @override
  Widget build(BuildContext context) {
    final learnedWords = Provider.of<Learned>(context, listen: false);
    bool _isExpanded = false;
    return Consumer<Vocab>(
      builder: (ctx, vocabs, child) => Card(
        margin: const EdgeInsets.all(10),
        elevation: 7,
        color: vocabs.isIgnored ? Colors.grey.shade50 : Colors.white,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                vocabs.word,
                style: TextStyle(
                  color: vocabs.isIgnored
                      ? Colors.black87.withOpacity(0.35)
                      : Colors.black87,
                ),
              ),
              subtitle: Text(
                vocabs.example,
                style: TextStyle(
                  color: vocabs.isIgnored
                      ? Colors.black87.withOpacity(0.35)
                      : Colors.black87,
                ),
              ),
              trailing: Wrap(
                children: <Widget>[
                  IconButton(
                    onPressed: () => {
                      vocabs.toggleIgnoreState(),
                    },
                    icon: const Icon(Icons.remove_red_eye),
                    color: vocabs.isIgnored ? Colors.grey[350] : Colors.grey,
                  ),
                  IconButton(
                    onPressed: () => {
                      vocabs.toggleDoneState(),
                      if (vocabs.isDone)
                        // Provider.of<Learned>(context, listen: false)
                        //     .addLearnedWord(
                        // learnedVoc.learned.values.toList()[i].id,
                        learnedWords.addLearnedWord(
                          vocabs.id,
                          vocabs.word,
                          vocabs.translation,
                          vocabs.level,
                          vocabs.example,
                        ),
                      // ),
                    },
                    icon: const Icon(Icons.done),
                    color: !vocabs.isDone || vocabs.isIgnored
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
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(color: Colors.blue.shade100),
                child: ListView(
                  children: <Widget>[
                    Text('Meaning: ${vocabs.translation}'),
                    Text('Level: ${vocabs.level.toString()}'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
