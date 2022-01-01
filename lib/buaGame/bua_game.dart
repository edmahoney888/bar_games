
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../bar_constants.dart';
import '../player/player_in_game.dart';
import 'bua_game_in_progress.dart';
import 'package:bar_games/player/player_widget.dart';



class BuaGame extends StatefulWidget {

  BuaGame() : super();

  @override
  _BuaGameState createState() => _BuaGameState();
}

class _BuaGameState extends State<BuaGame> {
  final GlobalKey _draggableKey = GlobalKey();
  _BuaGameState(); //constructor

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  BuaGameInProgress theGame = BuaGameInProgress();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Bar Games: Fish Prawn Crab'
            ''),
      ),
      body: body(context),
    );
  }

  rollDice() {
    theGame.rollDice();
  }

  int getState() {
    return theGame.gameState;
  }


  Widget body(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portrait();
    } else {
      return landscape();
    }
  }

  Widget portrait() {
    return Column(children: <Widget>[
      playerRow(),
      buaTilesPT(2),
      diceRow(),
    ]
    );
  }

  Widget landscape() {
    return Row(children: <Widget>[
      playerCol(),
      buaTilesLS(3),
      diceCol(),
    ]
    );
  }

  Widget buaTilesLS(int numColumns) {

    return Expanded(
      flex: 1,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBuaImageWithDropZone(1, Constants.buaDiceFaces[1]),
                    _buildBuaImageWithDropZone(2, Constants.buaDiceFaces[2]),
                    _buildBuaImageWithDropZone(3, Constants.buaDiceFaces[3]),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBuaImageWithDropZone(4, Constants.buaDiceFaces[4]),
                    _buildBuaImageWithDropZone(5, Constants.buaDiceFaces[5]),
                    _buildBuaImageWithDropZone(6, Constants.buaDiceFaces[6]),
                  ]),
            ),
          ]
      ),
    );
  }

  Widget buaTilesPT(int numColumns) {

    return Expanded(
      flex: 1,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBuaImageWithDropZone(1, Constants.buaDiceFaces[1]),
                    _buildBuaImageWithDropZone(2, Constants.buaDiceFaces[2]),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBuaImageWithDropZone(3, Constants.buaDiceFaces[3]),
                    _buildBuaImageWithDropZone(4, Constants.buaDiceFaces[4]),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBuaImageWithDropZone(5, Constants.buaDiceFaces[5]),
                    _buildBuaImageWithDropZone(6, Constants.buaDiceFaces[6]),
                  ]),
            ),
          ]),
    );
  }

  Widget _buildBuaImageWithDropZone(int id, String imageName) {
    int buaId = id;
    Color borderColor1 = Colors.black;

    return Expanded(
      flex: 1,
      child: DragTarget<PlayerInGame>(
        builder: (context, candidateItems, rejectedItems) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor1, width: 20),
              color: theGame.getAnswerColor(1),
            ),
            child: buaImage(imageName),
          );
        },
        onAccept: (player) {
          setState(() {
            Provider.of<BarPlayers>(context, listen: false).setAnswer(player.uid, buaId );
            borderColor1 = Colors.black;
          });
        },
        onWillAccept: (player) {
          if (player != null) {}
          borderColor1 = Colors.blue;
          return true;
        },
        onLeave: (player) {

          borderColor1 = Colors.black;
          return;
        },
      ),
    );
  }

  Widget buaImage(String imageName) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Image(image: AssetImage(imageName)),
    );
  }

  String getButtonText() {
    String tempText;

    if (getRoundState() == 0) {
      tempText = 'Roll';
    } else if (getRoundState() == 1) {
      tempText = 'Next';
    } else {
      tempText = 'OOOPS!';
    }

    return tempText;
  }

  int getRoundState() {
    return theGame.gameState;
  }

  int getDiceValue(int whichDice) {
    //get dice value from parent
    return theGame.getDiceValue(whichDice);
  }

  Widget diceWidget(int whichDice) {
    int diceValue = getDiceValue(whichDice);
    String tempString = Constants.buaDiceFaces[diceValue];

    return SizedBox(
      width: 75.0,
      child: Image.asset(tempString, fit: BoxFit.contain),
    );
  }

  Widget playerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        playerWidget(
      playerNum: 0,context: context,tileFaces: Constants.buaDiceFaces,
    ),
        playerWidget(
      playerNum: 1,context: context,tileFaces: Constants.buaDiceFaces,
    ),
        playerWidget(
      playerNum: 2,context: context,tileFaces: Constants.buaDiceFaces,
    ),
        playerWidget(
      playerNum: 3,context: context,tileFaces: Constants.buaDiceFaces,
    ),
      ],
    );
  }

  Widget diceRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Center(
        child: ElevatedButton(
          onPressed: () {
            switch (getRoundState()) {
              case 0:
                {
                  setState(() {
                    theGame.rollDice();
                    Provider.of<BarPlayers>(context, listen: true).correctAnswer(theGame.dice1, theGame.dice2, theGame.dice3);
                    theGame.gameState = 1;
                  });
                }
                break;
              case 1:
                {
                  setState(() {
                    theGame.resetState();
                    Provider.of<BarPlayers>(context, listen: false).resetAnswers();
                  });
                }
                break;
              default:
                {}
            }
          },
          child: Text(getButtonText()),
        ),
      ),
      diceWidget(1),
      diceWidget(2),
      diceWidget(3),
      Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Quit"),
        ),
      ),
    ]);
  }

  Widget playerCol() {
    return SizedBox(
        width: 150.0,
        //  height: 75.0,
        child: Column(
          children: <Widget>[
            playerWidget(
              playerNum:0, context: context,tileFaces: Constants.buaDiceFaces,
            ),
            playerWidget(
              playerNum:1,context: context,tileFaces: Constants.buaDiceFaces,
            ),
            playerWidget(
              playerNum:2,context: context,tileFaces: Constants.buaDiceFaces,
            ),
            playerWidget(
              playerNum:3,context: context,tileFaces: Constants.buaDiceFaces,
            ),
          ],
        ));
  }

  Widget diceCol() {
    return Column(children: <Widget>[
      Expanded(
        flex: 1,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              switch (getRoundState()) {
                case 0:
                  {
                    setState(() {
                      theGame.rollDice();
                      Provider.of<BarPlayers>(context, listen: false).correctAnswer(theGame.dice1, theGame.dice2, theGame.dice3);
                      theGame.gameState = 1;
                    });
                  }
                  break;
                case 1:
                  {
                    setState(() {
                      theGame.resetState();
                      Provider.of<BarPlayers>(context, listen: false).resetAnswers();
                    });
                  }
                  break;
                default:
                  {}
              }
            },
            child: Text(getButtonText()),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: diceWidget(1),
      ),
      Expanded(
        flex: 1,
        child: diceWidget(2),
      ),
      Expanded(
        flex: 1,
        child: diceWidget(3),
      ),
      Expanded(
        flex: 1,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Provider.of<BarPlayers>(context, listen: false).rollUpScore();

              Navigator.pop(context);
            },
            child: Text("Finish"),
          ),
        ),
      ),
    ]);
  }
}

