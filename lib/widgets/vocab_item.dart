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
    final vocabs = Provider.of<Vocabs>(context, listen: false);
    bool _isExpanded = false;

    return Consumer<Vocab>(
      builder: (ctx, vocab, child) => Card(
        margin: const EdgeInsets.all(10),
        elevation: 7,
        color: vocab.isIgnored ? Colors.grey.shade50 : Colors.white,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                vocab.word,
                style: TextStyle(
                  color: vocab.isIgnored
                      ? Colors.black87.withOpacity(0.35)
                      : Colors.black87,
                ),
              ),
              subtitle: Text(
                vocab.example,
                style: TextStyle(
                  color: vocab.isIgnored
                      ? Colors.black87.withOpacity(0.35)
                      : Colors.black87,
                ),
              ),
              trailing: Wrap(
                children: <Widget>[
                  IconButton(
                    onPressed: () => {
                      vocab.toggleIgnoreState(),
                    },
                    icon: const Icon(Icons.remove_red_eye),
                    color: vocab.isIgnored ? Colors.grey[350] : Colors.grey,
                  ),
                  IconButton(
                    onPressed: () => {
                      vocab.toggleDoneState(),
                      if (vocab.isDone && !vocab.isIgnored)
                        // Provider.of<Learned>(context, listen: false)
                        //     .addLearnedWord(
                        // learnedVoc.learned.values.toList()[i].id,
                        learnedWords.addLearnedWord(
                          vocab.id,
                          vocab.word,
                          vocab.translation,
                          vocab.level,
                          vocab.example,
                        ),
                      if (vocab.isDone && !vocab.isIgnored)
                        {
                          vocabs.removeFromNewWords(vocab.id),
                        },
                      ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Added to the learned vocabulary list!',
                          ),
                          duration: const Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {},
                          ),
                        ),
                      )
                      // ),
                    },
                    icon: const Icon(Icons.done),
                    color:
                        vocab.isIgnored ? Colors.blueGrey[200] : Colors.green,
                  ),
                  IconButton(
                    icon: _isExpanded && !vocab.isIgnored && !vocab.isDone
                        ? const Icon(Icons.expand_less)
                        : const Icon(Icons.expand_more),
                    onPressed: () {
                      _isExpanded = !_isExpanded;
                    },
                  ),
                ],
              ),
            ),
            if (_isExpanded && !vocab.isIgnored && !vocab.isDone)
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(color: Colors.blue.shade100),
                child: ListView(
                  children: <Widget>[
                    Text('Meaning: ${vocab.translation}'),
                    Text('Level: ${vocab.level.toString()}'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
