import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gbt_flutter/routegenerator.dart';
import 'package:provider/provider.dart';
import 'notifiers/gamesnotifier.dart';

void main() {
  // We probably would use a multi provider here
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<GamesNotifier>(create: (_) => GamesNotifier())
  ], child: App()));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    Provider.of<GamesNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.route,
    );
  }
}
