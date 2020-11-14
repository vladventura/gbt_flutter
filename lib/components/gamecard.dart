import 'dart:ui';
import "package:flutter/material.dart";
import 'package:gbt_flutter/components/progressbar.dart';
import 'package:gbt_flutter/models/game.dart';
import 'package:gbt_flutter/notifiers/gamesnotifier.dart';
import 'package:provider/provider.dart';

class GameCard extends StatefulWidget {
  final GameModel game;
  GameCard({@required this.game}) : super();

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  final cardHeight;
  final double cardWidth;
  final double topBoxWidth;
  final double topBoxHeight;
  final double progressBarHeight;
  final double progressBarDepth;

  _GameCardState()
      : cardHeight =
            (window.physicalSize.height / window.devicePixelRatio) * 0.75,
        cardWidth = (window.physicalSize.width / window.devicePixelRatio) * 0.8,
        topBoxWidth =
            (window.physicalSize.width / window.devicePixelRatio) * 0.8,
        topBoxHeight =
            (window.physicalSize.height / window.devicePixelRatio) * 0.125,
        progressBarHeight =
            (window.physicalSize.height / window.devicePixelRatio) * 0.035,
        progressBarDepth =
            ((window.physicalSize.height / window.devicePixelRatio) * 0.75) -
                ((window.physicalSize.height / window.devicePixelRatio) *
                    0.035);

  @override
  Widget build(BuildContext context) {
    return Consumer<GamesNotifier>(builder: (context, data, child) {
      return GestureDetector(
        onTap: () {
          data.selectedGame = widget.game;
          Navigator.of(context).pushNamed('/selectedGame');
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(
              (MediaQuery.of(context).devicePixelRatio) * 10,
              (MediaQuery.of(context).devicePixelRatio) * 10,
              (MediaQuery.of(context).devicePixelRatio) * 10,
              (MediaQuery.of(context).devicePixelRatio) * 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: cardWidth,
                height: cardHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          color: Colors.black12,
                          offset: Offset(5, 5))
                    ],
                    image: DecorationImage(
                        image: NetworkImage(widget.game.coverArtUrl),
                        fit: BoxFit.cover)),
              ),
              _topBanner(),
              _progressBar()
            ],
          ),
        ),
      );
    });
  }

  Container _topBanner() {
    return Container(
      width: this.topBoxWidth,
      height: this.topBoxHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: Colors.white,
      ),
      child: Container(
          padding: EdgeInsets.all(7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    widget.game.name,
                    style:
                        // TODO: Bring this onto a global theme for the app
                        TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                  )
                ],
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                // TODO: Get icons for each console/platform
                children: [
                  Text("[PS4]"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("[PC]"),
                  SizedBox(width: 10),
                  Text("[iOS]"),
                  SizedBox(width: 10),
                  Text("[Android]"),
                ],
              )
            ],
          )),
    );
  }

  Positioned _progressBar() {
    return Positioned(
        top: this.progressBarDepth,
        child: ProgressBar(
          height: this.progressBarHeight,
          width: this.cardWidth,
          percentage: (widget.game.currentHours / widget.game.hltbHours) * 100,
          hoursSpent: widget.game.currentHours,
        ));
  }
}
