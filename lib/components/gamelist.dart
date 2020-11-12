import "package:flutter/material.dart";
import "package:gbt_flutter/models/game.dart";

class GameList extends StatefulWidget {
  final List<GameModel> games;

  GameList({@required this.games});

  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(""),
    );
  }
}
