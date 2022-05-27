import 'dart:ui';

import 'package:bar_games/buaGame/bua_game.dart';
import 'package:bar_games/player/player_detail.dart';
import 'package:bar_games/player/player_in_game.dart';
import 'package:bar_games/raceGame/race_game.dart';
import 'package:bar_games/wheel/fortune_wheel.dart';
import 'package:bar_games/wheel2/money_wheel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BarPlayers(),
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'Games with Friends',
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Bar Games'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: body(context),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget body(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portrait();
    } else {
      return landscape();
    }
  }

  Widget portrait() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                flex: 1,
                child: playerWidget(0),
              ),
              Expanded(
                flex: 1,
                child: playerWidget(1),
              ),
              Expanded(
                flex: 1,
                child: playerWidget(2),
              ),
              Expanded(
                flex: 1,
                child: playerWidget(3),
              ),
            ]),
          ),
          const SizedBox(height: 30),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              gotoBuaGameActivity(context);
            },
            child: const Text('Fish-Crab-Prawn Game'),
          ),
          const SizedBox(height: 30),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              gotoRaceGameActivity(context);
            },
            child: const Text('Race Game'),
          ),
        ],
      ),
    );
  }

  Widget landscape() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                flex: 1,
                child: playerWidget(0),
              ),
              Expanded(
                flex: 1,
                child: playerWidget(1),
              ),
              Expanded(
                flex: 1,
                child: playerWidget(2),
              ),
              Expanded(
                flex: 1,
                child: playerWidget(3),
              ),
            ]),
          ),
          const SizedBox(height: 30),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              gotoBuaGameActivity(context);
              setState(() {

              });
            },
            child: const Text('Fish-Crab-Prawn Game'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              gotoRaceGameActivity(context);
            },
            child: const Text('Race Game'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              gotoFortuneWheelActivity(context);
            },
            child: const Text('Wheel Of Luck'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              gotoMoneyWheelActivity(context);
            },
            child: const Text('Money Wheel'),
          ),
        ],
      ),
    );
  }

  gotoBuaGameActivity(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BuaGame()),
    );
    setState(() {
      //do something
    });

  }

  gotoRaceGameActivity(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RaceGame()),
    );
    setState(() {
      //do something
    });
  }

  gotoFortuneWheelActivity(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FortunePage()),
    );
    setState(() {
      //do something
    });
  }

  gotoMoneyWheelActivity(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MoneyPage()),
    );
    setState(() {
      //do something
    });
  }


  gotoPlayerDetailActivity(BuildContext context, int playerNum) async {
    Provider.of<BarPlayers>(context, listen: false).selectedPlayer = playerNum;

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayerDetail()),
    );
    setState(() {
      //do something
    });
  }

  Widget playerWidget(int playerNum) {
    return SizedBox(
        width: 100.0,
        //       height: 50.0,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => gotoPlayerDetailActivity(context, playerNum),
                child: Provider.of<BarPlayers>(context, listen: false)
                    .playerList[playerNum]
                    .playerAvatar,
              ),
            ),
            Text(
              Provider.of<BarPlayers>(context, listen: false)
                  .playerList[playerNum]
                  .playerName,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontSize: 18.0,
                  ),
            ),
            const SizedBox(height: 10.0),
            Text(
              Provider.of<BarPlayers>(context, listen: false)
                  .playerList[playerNum]
                  .playerTotScore
                  .toString(),
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
            ),
          ],
        ));
  }
}
