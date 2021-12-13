import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../player_in_game.dart';
import 'bua_game_in_progress.dart';

class Constants {
  static const String firstItem = 'Load Player';
  static const String secondItem = 'Load Round';

  static const String zeroDiceFace = 'assets/images/buagame/blank.png';
  static const String firstDiceFace = 'assets/images/buagame/crab.png';
  static const String secondDiceFace = 'assets/images/buagame/fish.png';
  static const String thirdDiceFace = 'assets/images/buagame/prawn.png';
  static const String fourthDiceFace = 'assets/images/buagame/tiger.png';
  static const String fifthDiceFace = 'assets/images/buagame/rooster.png';
  static const String sixthDiceFace = 'assets/images/buagame/gourd.png';

  static const List<String> diceFaces = <String>[
    zeroDiceFace,
    firstDiceFace,
    secondDiceFace,
    thirdDiceFace,
    fourthDiceFace,
    fifthDiceFace,
    sixthDiceFace,
  ];

  static const List<String> choices = <String>[
    firstItem,
    secondItem,
  ];
}

//const List<Item> _items = [
/*
  Item(
    name: 'joy',
    score: 0,
    uid: '1',
    imageName: "assets/images/playeravatars/girl01.PNG",

  ),
  Item(
    name: 'jane',
    score: 0,
    uid: '2',
    imageName: "assets/images/playeravatars/girl02.PNG",
  ),
  Item(
    name: 'julie',
    score: 0,
    uid: '3',
    imageName: "assets/images/playeravatars/girl03.PNG",
  ),
  Item(
    name: 'josie',
    score: 0,
    uid: '4',
    imageName: "assets/images/playeravatars/girl04.jpg",
  ),

   */
//];

class BuaGame extends StatefulWidget {
  final List<PlayerInGame> playerList;

  BuaGame({required this.playerList}) : super();

  @override
  _BuaGameState createState() => _BuaGameState(playerList);
}

class _BuaGameState extends State<BuaGame> {
  List<PlayerInGame> playerList;

  _BuaGameState(this.playerList); //constructor

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  BuaGameInProgress theGame = BuaGameInProgress();

  @override
  Widget build(BuildContext context) {
    if (theGame.getNumOfPlayers() == 0) {
      theGame.loadPlayers(playerList);
    }
  //  print(
 //       "player pass->" + playerList[0].uid + " ->" + playerList[0].playerName);
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

//  int GetDiceValue(int whichDice) {
//    return theGame.getDiceValue(whichDice);
//  }

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
    ]);
  }

  Widget landscape() {
    return Row(children: <Widget>[
      playerCol(),
      buaTilesLS(3),
      diceCol(),
    ]);
  }

  Widget buaTilesLS(int numColumns) {
  //  Color borderColor1 = Colors.black;
  //  Color borderColor2 = Colors.black;
 //   Color borderColor3 = Colors.black;
  //  Color borderColor4 = Colors.black;
 //   Color borderColor5 = Colors.black;
 //  Color borderColor6 = Colors.black;

  //  if (borderColor1 == null) borderColor1 = Colors.black;
 //   if (borderColor2 == null) borderColor2 = Colors.black;
 //   if (borderColor3 == null) borderColor3 = Colors.black;
 //   if (borderColor4 == null) borderColor4 = Colors.black;
 //   if (borderColor5 == null) borderColor5 = Colors.black;
 //   if (borderColor6 == null) borderColor6 = Colors.black;

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
                    _buildBuaImageWithDropZone(1, Constants.diceFaces[1]),
                    _buildBuaImageWithDropZone(2, Constants.diceFaces[2]),
                    _buildBuaImageWithDropZone(3, Constants.diceFaces[3]),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBuaImageWithDropZone(4, Constants.diceFaces[4]),
                    _buildBuaImageWithDropZone(5, Constants.diceFaces[5]),
                    _buildBuaImageWithDropZone(6, Constants.diceFaces[6]),
                  ]),
            ),
          ]),
    );
  }

  Widget buaTilesPT(int numColumns) {
 //   Color borderColor1 = Colors.black;
 //   Color borderColor2 = Colors.black;
 //   Color borderColor3 = Colors.black;
 //   Color borderColor4 = Colors.black;
 //   Color borderColor5 = Colors.black;
 //   Color borderColor6 = Colors.black;

 //   if (borderColor1 == null) borderColor1 = Colors.black;
 //   if (borderColor2 == null) borderColor2 = Colors.black;
 //   if (borderColor3 == null) borderColor3 = Colors.black;
 //   if (borderColor4 == null) borderColor4 = Colors.black;
 //   if (borderColor5 == null) borderColor5 = Colors.black;
 //   if (borderColor6 == null) borderColor6 = Colors.black;

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
                    _buildBuaImageWithDropZone(1, Constants.diceFaces[1]),
                    _buildBuaImageWithDropZone(2, Constants.diceFaces[2]),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBuaImageWithDropZone(3, Constants.diceFaces[3]),
                    _buildBuaImageWithDropZone(4, Constants.diceFaces[4]),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBuaImageWithDropZone(5, Constants.diceFaces[5]),
                    _buildBuaImageWithDropZone(6, Constants.diceFaces[6]),
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
            theGame.setPlayerAnswer(buaId, int.parse(player.uid));
            borderColor1 = Colors.black;
          });
        },
        onWillAccept: (player) {
          if (player != null) {}
          borderColor1 = Colors.blue;
          return true;
        },
        onLeave: (player) {
//            if (player != null) {
//              print("bua id->"+ buaId.toString());
//              print("onLeave: " + player.uid.toString());
//            }
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
    String tempString = Constants.diceFaces[diceValue];

    return SizedBox(
      width: 75.0,
      child: Image.asset(tempString, fit: BoxFit.contain),
    );
  }

  Widget playerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
    _buildPlayer(
      player: theGame.thePlayers[0],
    ),
    _buildPlayer(
      player: theGame.thePlayers[1],
    ),
    _buildPlayer(
      player: theGame.thePlayers[2],
    ),
    _buildPlayer(
      player: theGame.thePlayers[3],
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
                    theGame.gameState = 1;
                  });
                }
                break;
              case 1:
                {
                  setState(() {
                    theGame.resetState();
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
            Navigator.pop(context, theGame.thePlayers);
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
            _buildPlayer(
              player: theGame.thePlayers[0],
            ),
            _buildPlayer(
              player: theGame.thePlayers[1],
            ),
            _buildPlayer(
              player: theGame.thePlayers[2],
            ),
            _buildPlayer(
              player: theGame.thePlayers[3],
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
                      theGame.gameState = 1;
                    });
                  }
                  break;
                case 1:
                  {
                    setState(() {
                      theGame.resetState();
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
              theGame.rollupScore();
              Navigator.pop(context, theGame.thePlayers);
            },
            child: Text("Finish"),
          ),
        ),
      ),
    ]);
  }

  Widget _buildPlayer({
    required PlayerInGame player,
  }) {
    return Expanded(
      flex: 1,
      child: Draggable<PlayerInGame>(
        data: player,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: DraggingListItem(
          dragKey: _draggableKey,
          playerImage: player.playerAvatar,
        ),
        child: playerAvatar(player: player),
      ),
    );
  }

  Widget playerAvatar({
    required PlayerInGame player,
  }) {
    Image answerImage;
 //   double opacitySetting = 0.5;

    if (player.answerChosen == 0) {
//      opacitySetting = 0.0;
      answerImage = player.playerAvatar;
    } else {
 //     opacitySetting = 0.5;
      answerImage =
          Image(image: AssetImage(Constants.diceFaces[player.answerChosen]));
    }

    return Material(
      elevation: 12.0,
      borderRadius: BorderRadius.circular(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          width: 100,
          height: 96,
          child:
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            answerImage,
            Text(player.playerName),
                Text('Rd: ' + player.playerRndScore.toString()),
                Text('Tot: ' + player.playerScore.toString()),
          ]
          ),
        ),
      ),
    );
  }
}

final GlobalKey _draggableKey = GlobalKey();

class PlayerAvatar extends StatelessWidget {
  PlayerAvatar({
    Key? key,
    this.name = '',
    this.score = 0,
    required this.imageName,
    this.answer = 0,
    this.isDepressed = false,
  }) : super(key: key);

  final String name;
  final int score;
  final int answer;
  final String imageName;
  final bool isDepressed;
  String answerImage = "";
  double opacitySetting = 0.5;

  @override
  Widget build(BuildContext context) {
    if (answer == 0) {
      opacitySetting = 0.0;
      answerImage = imageName;
//      print("player original: " + answerImage);
    } else {
      opacitySetting = 0.5;
      answerImage = Constants.diceFaces[answer];
 //     print("player changed: " + answerImage);
    }

    return Material(
      elevation: 12.0,
      borderRadius: BorderRadius.circular(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          width: 100,
          height: 96,
          child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
            Image.asset(answerImage, fit: BoxFit.contain),
            Text(name + ": " + score.toString()),
          ]),
        ),
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    Key? key,
    required this.dragKey,
    required this.playerImage,
  }) : super(key: key);

  final GlobalKey dragKey;
  final Image playerImage;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Opacity(
            opacity: 0.85,
            child: playerImage,
          ),
        ),
      ),
    );
  }
}

@immutable
class Item {
  const Item({
    required this.score,
    required this.name,
    required this.uid,
    required this.imageName,
  });
  final int score;
  final String name;
  final String uid;
  final String imageName;
}
