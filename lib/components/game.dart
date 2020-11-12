import "package:flutter/material.dart";
import 'package:gbt_flutter/models/game.dart';

class Game extends StatelessWidget {
  final GameModel game;
  const Game({@required this.game}) : super();

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
          Positioned(
            top: 320,
            left: 15,
            child: Container(
              width: 270,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1, color: Colors.black12, spreadRadius: 2)
                ],
              ),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(7),
                        child: Text(
                          game.name,
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    height: 47,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
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
                            ])),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(((game.currentHours / game.hltbHours) * 100)
                              .toStringAsFixed(1) +
                          "%"),
                    ),
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
