import 'package:flutter/material.dart';
import 'package:practice_app_crud/providers/learned_vocab.dart';
import 'package:practice_app_crud/providers/vocabs.dart';
import 'package:practice_app_crud/screens/learned_vocabs_screen.dart';
import 'package:practice_app_crud/screens/vocab_overview_screen.dart';
import 'package:practice_app_crud/widgets/vocab_item.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Vocabs>(
          create: (ctx) => Vocabs(),
        ),
        ChangeNotifierProvider<VocabItem>(
          create: (ctx) => VocabItem(),
        ),
        ChangeNotifierProvider<Learned>(
          create: (ctx) => Learned(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Practice App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                .copyWith(secondary: Colors.greenAccent),
          ),
          home: VocabOverviewScreen(),
          routes: {
            LearnedVocabsScreen.routeName: (ctx) => LearnedVocabsScreen(),
          },
        );
      },
    );
  }
}
