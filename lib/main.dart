import 'package:bar_games/buaGame/bua_game.dart';
import 'package:bar_games/player_detail.dart';
import 'package:bar_games/player_in_game.dart';
import 'package:bar_games/raceGame/race_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bar Games',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bar Games'),
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
 // int _counter = 0;
  String defaultName = "Default";
  String defaultImage = 'assets/images/playeravatars/blankPlayer.jpg';

  List<PlayerInGame> thePlayers = [];

  @override
  Widget build(BuildContext context) {
    if (thePlayers.isEmpty)
      {
        PlayerInGame player1ID;
        for(var i = 0; i < 4; i++){
          // initialize the players list
          player1ID = PlayerInGame();
          player1ID.playerName = defaultName;
          player1ID.playerAvatar = Image.asset(defaultImage, fit: BoxFit.contain);
          player1ID.playerScore = 0;
          player1ID.uid = i.toString();
          thePlayers.add(player1ID);
        }

      }
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
    if(MediaQuery.of(context).orientation == Orientation.portrait)
    {
      return portrait();
    }
    else {
      return landscape();
    }
  }


  Widget portrait() {
    return
      Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child:
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child:
                      playerWidget(0),
                    ),
                    Expanded(
                      flex: 1,
                      child:
                      playerWidget(1),
                    ),
                    Expanded(
                      flex: 1,
                      child:
                      playerWidget(2),
                    ),
                    Expanded(
                      flex: 1,
                      child:
                      playerWidget(3),
                    ),
                  ]
              ),
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
    return
      Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child:
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child:
                      playerWidget(0),
                    ),
                    Expanded(
                      flex: 1,
                      child:
                      playerWidget(1),
                    ),
                    Expanded(
                      flex: 1,
                      child:
                      playerWidget(2),
                    ),
                    Expanded(
                      flex: 1,
                      child:
                      playerWidget(3),
                    ),
                  ]
              ),
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



  gotoBuaGameActivity(BuildContext context) async {

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BuaGame(playerList: thePlayers)
      ),
    );

    // update player list with data from result
    setState(() {
      thePlayers = result;
    });

  }

  gotoRaceGameActivity(BuildContext context) async {

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RaceGame(playerList: thePlayers)),
    );

// update player list with data from result
    setState(() {
      thePlayers = result;
    });

  }

  gotoPlayerDetailActivity(BuildContext context, int playerNum) async {

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayerDetail(thePlayer: thePlayers[playerNum],)
      ),
    );

    // update player list with data from result
    setState(() {
      if (result != null) {
        thePlayers[playerNum] = result;
      }
    });

  }


  Widget playerWidget(int playerNum) {

    return
      SizedBox(
          width: 100.0,
          //       height: 50.0,
          child:
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child:
              GestureDetector(
                onTap: () => gotoPlayerDetailActivity(context, playerNum),
             //   child:Image.asset(thePlayers[playerNum].playerAvatar, fit: BoxFit.contain),
                child:thePlayers[playerNum].playerAvatar,
              ),
              ),
              Text(
                thePlayers[playerNum].playerName,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                thePlayers[playerNum].playerScore.toString(),
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ],
          )
      );
  }


}
