import 'package:flutter/material.dart';
import 'package:gbt_flutter/notifiers/gamesnotifier.dart';
import 'package:provider/provider.dart';

class SelectedGamePage extends StatefulWidget {
  SelectedGamePage({Key key}) : super(key: key);

  @override
  _SelectedGamePageState createState() => _SelectedGamePageState();
}

class _SelectedGamePageState extends State<SelectedGamePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GamesNotifier>(
      builder: (context, data, child) {
        if (data.selectedGame != null) {
          return Scaffold(body: this.pageBody(data));
        } else {
          Navigator.of(context).pushNamed("/error");
          return Container();
        }
      },
    );
  }

  CustomScrollView pageBody(GamesNotifier data) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.8,
          flexibleSpace: FlexibleSpaceBar(
            background: _coverArt(data),
            title: Container(
              child: Text(data.selectedGame.name),
            ),
          ),
        ),
        SliverFillRemaining(
          child: Text("aifsudbbafuisd"),
        )
      ],
    );
  }

  Hero _coverArt(GamesNotifier data) {
    return Hero(
      tag: "cover_art_" + data.selectedGame.name,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(data.selectedGame.coverArtUrl)),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black12, Colors.black38],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
      ),
    );
  }
}
