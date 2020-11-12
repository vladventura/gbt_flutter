import "package:flutter/material.dart";
import 'package:gbt_flutter/models/game.dart';

class Game3 extends StatelessWidget {
  final GameModel game;
  const Game3({@required this.game}) : super();

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
            child: Container(
              width: 300,
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
