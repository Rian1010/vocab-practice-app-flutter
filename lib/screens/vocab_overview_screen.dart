import 'package:flutter/material.dart';
import 'package:practice_app_crud/providers/vocab.dart';
import 'package:practice_app_crud/providers/vocabs.dart';
import 'package:practice_app_crud/widgets/app_drawer.dart';
import 'package:practice_app_crud/widgets/vocab_item.dart';
import 'package:provider/provider.dart';

class VocabOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vocabData = Provider.of<Vocabs>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocab App'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => ChangeNotifierProvider<Vocab>.value(
          value: vocabData.words[i],
          child: VocabItem(),
        ),
        itemCount: vocabData.words.length,
      ),
    );
  }
}
