import 'package:flutter/material.dart';
import 'package:practice_app_crud/providers/vocabs.dart';
import 'package:practice_app_crud/screens/vocab_overview_screen.dart';
import 'package:practice_app_crud/widgets/vocab_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Vocabs>(
      create: (context) => Vocabs(),
      child: MaterialApp(
        title: 'Practice App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.greenAccent),
        ),
        home: const VocabOverviewScreen(),
      ),
    );
  }
}
