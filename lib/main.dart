import 'package:flutter/material.dart';
import 'package:gbt_flutter/models/game.dart';
import 'components/gamecard.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameModel gameModel = new GameModel(
        name: "Genshin Impact",
        coverArtUrl:
            "https://giantbomb1.cbsistatic.com/uploads/scale_medium/45/459166/3245697-genshin.jpg",
        currentHours: 150,
        hltbHours: 2000,
        consoles: <String>["PS4", "PC", "Android", "iOS"]);
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Demo Time"),
            ),
            body: Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GameCard(game: gameModel),
                  GameCard(game: gameModel),
                  GameCard(game: gameModel),
                ],
              ),
            )));
  }
}
