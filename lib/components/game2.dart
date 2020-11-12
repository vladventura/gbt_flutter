import "package:flutter/material.dart";
import 'package:gbt_flutter/models/game.dart';

class Game2 extends StatelessWidget {
  final GameModel game;
  const Game2({@required this.game}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 250,
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(game.coverArtUrl), fit: BoxFit.cover)),
          ),
          Positioned(
            top: 330,
            left: -10,
            child: Container(
              width: 270,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [
                      (game.currentHours / game.hltbHours),
                      (game.currentHours / game.hltbHours)
                    ],
                    colors: [
                      Colors.green,
                      Colors.lightGreen
                    ]),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1, color: Colors.black12, spreadRadius: 2)
                ],
              ),
              child: Container(
                  padding: EdgeInsets.all(7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            game.name,
                            style: TextStyle(
                                fontFamily: 'Montserrat', fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          Text(game.currentHours.toString() +
                              " out of " +
                              game.hltbHours.toString())
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
