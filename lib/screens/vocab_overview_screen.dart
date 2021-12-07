import 'package:flutter/material.dart';
import 'package:practice_app_crud/widgets/app_drawer.dart';
import 'package:practice_app_crud/widgets/vocab_list.dart';

class VocabOverviewScreen extends StatelessWidget {
  const VocabOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocab App'),
      ),
      drawer: const AppDrawer(),
      body: const VocabList(),
    );
  }
}
