import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gbt_flutter/models/game.dart';
import 'components/gamecard.dart';
import 'package:provider/provider.dart';
import 'notifiers/gamesnotifier.dart';

void main() {
  // We probably would use a multi provider here
  runApp(ChangeNotifierProvider(
      create: (context) => GamesNotifier(), child: App()));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    print("===========INITIALIZE RAN===========");
    Provider.of<GamesNotifier>(context, listen: false).initialize();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    GameModel gameModel = new GameModel(
        name: "Genshin Impact",
        coverArtUrl:
            "https://giantbomb1.cbsistatic.com/uploads/scale_medium/45/459166/3245697-genshin.jpg",
        currentHours: 150,
        hltbHours: 2000,
        consoles: <String>["PS4", "PC", "Android", "iOS"]);
    print("========================HELLO========================");
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Demo Time"),
            ),
            body: Container(
              child: Consumer<GamesNotifier>(
                builder: (context, data, child) {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        data.savedGames.map((e) => GameCard(game: e)).toList(),
                  );
                },
              ),
            )));
  }
}
