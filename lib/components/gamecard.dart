import "package:flutter/material.dart";
import 'package:gbt_flutter/models/game.dart';

class GameCard extends StatelessWidget {
  final GameModel game;
  const GameCard({@required this.game}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(game.coverArtUrl), fit: BoxFit.cover)),
          ),
          Container(
            width: 300,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(blurRadius: 1, color: Colors.black12, spreadRadius: 2)
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
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
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
          ),
          Positioned(
              top: 380,
              child: Container(
                  width: 300,
                  height: 20,
                  padding: EdgeInsets.only(
                      left: ((game.currentHours / game.hltbHours) * 300) + 5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.green,
                        Colors.lightGreen
                      ], stops: [
                        (game.currentHours / game.hltbHours),
                        (game.currentHours / game.hltbHours)
                      ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: Text(((game.currentHours / game.hltbHours) * 100)
                          .toStringAsFixed(1) +
                      "%")))
        ],
      ),
    );
  }
}
