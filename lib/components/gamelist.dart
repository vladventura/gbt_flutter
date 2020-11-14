import "package:flutter/material.dart";
import 'package:gbt_flutter/components/gamecard.dart';
import 'package:gbt_flutter/notifiers/gamesnotifier.dart';
import 'package:provider/provider.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GamesNotifier>(builder: (context, data, child) {
      List<GameCard> list =
          data.savedGames.map((e) => GameCard(game: e)).toList();
      return ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: list,
      );
    });
  }
}
