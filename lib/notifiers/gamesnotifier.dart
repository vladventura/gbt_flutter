// Mock data
import 'package:flutter/foundation.dart';
import 'package:gbt_flutter/mocks/mocks.dart' show allGames;
import 'package:gbt_flutter/models/game.dart';

class GamesNotifier with ChangeNotifier {
  List<GameModel> _savedGames;
  GameModel _selectedGame;

  List<GameModel> get savedGames => _savedGames;
  GameModel get selectedGame => _selectedGame;

  set savedGames(List<GameModel> l) {
    this._savedGames = l;
    notifyListeners();
  }

  void addGameToList(GameModel incoming) {
    /// Here we check if the game is already on the DB (search a game with that name)
    /// If not we add to the list
    /// Then insert it on the DB
    this._savedGames.add(incoming);
    notifyListeners();
  }

  set selectedGame(GameModel incoming) {
    this._selectedGame = incoming;
    notifyListeners();
  }

  void initialize() {
    /// Here we would query the DB for any saved game and return each row
    this._savedGames = allGames
        .map((e) => new GameModel(
            name: e['name'],
            coverArtUrl: e['cover_art_url'],
            currentHours: e['current_hours'],
            hltbHours: e['hltb_hours'],
            consoles: e['consoles']))
        .toList();
  }
}
