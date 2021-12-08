import 'package:flutter/material.dart';
import 'package:practice_app_crud/providers/learned_vocab.dart';
import 'package:practice_app_crud/widgets/app_drawer.dart';
import 'package:practice_app_crud/widgets/learned_vocab_item.dart';
import 'package:provider/provider.dart';

class LearnedVocabsScreen extends StatefulWidget {
  static String routeName = '/learned-vocabulary';

  @override
  State<LearnedVocabsScreen> createState() => _LearnedVocabsScreenState();
}

class _LearnedVocabsScreenState extends State<LearnedVocabsScreen> {
  @override
  Widget build(BuildContext context) {
    final learnedWord = Provider.of<Learned>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learned List'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => LearnedVocabItem(learnedWord.learned[i]),
        itemCount: learnedWord.learned.length,
      ),
    );
  }
}
