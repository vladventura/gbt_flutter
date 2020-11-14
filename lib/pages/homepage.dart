import 'package:flutter/material.dart';
import 'package:gbt_flutter/components/gamelist.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Container(
          child: GameList(),
        ));
  }
}
