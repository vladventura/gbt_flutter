import 'package:flutter/material.dart';
import 'package:gbt_flutter/notifiers/gamesnotifier.dart';
import 'package:provider/provider.dart';

class SelectedGamePage extends StatefulWidget {
  SelectedGamePage({Key key}) : super(key: key);

  @override
  _SelectedGamePageState createState() => _SelectedGamePageState();
}

class _SelectedGamePageState extends State<SelectedGamePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GamesNotifier>(
      builder: (context, data, child) {
        if (data.selectedGame != null) {
          return Scaffold(
              appBar: AppBar(title: Text("Selected Game Page")),
              body: Container(
                child: Text(data.selectedGame.name),
              ));
        } else {
          Navigator.of(context).pushNamed("/error");
          return Container();
        }
      },
    );
  }
}
