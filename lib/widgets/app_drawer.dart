import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Hello Learner!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.speaker_notes,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text('Practice Vocabulary'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          Divider(),
          ListTile(
              leading: Icon(
                Icons.work,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text('Learned Vocabulary'))
        ],
      ),
    );
  }
}
