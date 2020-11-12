import "package:flutter/material.dart";

class GameModel {
  final String name;
  final String coverArtUrl;
  final int currentHours;
  final int hltbHours;
  final List<String> consoles;

  GameModel(
      {@required this.name,
      @required this.coverArtUrl,
      @required this.currentHours,
      @required this.hltbHours,
      @required this.consoles});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name": this.name,
      "cover_art_url": this.coverArtUrl,
      "current_hours": this.currentHours,
      "hltb_hours": this.hltbHours,
      "consoles": this.consoles
    };
  }
}
