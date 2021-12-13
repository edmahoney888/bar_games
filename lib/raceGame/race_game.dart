import 'dart:io';
import 'package:bar_games/raceGame/race_game_in_progress.dart';
import 'package:flutter/material.dart';

import '../bar_constants.dart';
import '../player_in_game.dart';
//import 'choose_racers.dart';

/*
class Constants{
  static const String FirstItem = 'Load Player';
  static const String SecondItem = 'Load Round';

  static const String Dice1Face = 'assets/dice1.png';
  static const String Dice2Face = 'assets/dice2.png';
  static const String Dice3Face = 'assets/dice3.png';
  static const String Dice4Face = 'assets/dice4.png';
  static const String Dice5Face = 'assets/dice5.png';
  static const String Dice6Face = 'assets/dice6.png';

  /*
  static const String Horse0 = 'assets/race/blankRacer.png';
  static const String Horse1 = 'assets/race/bull.gif';
  static const String Horse2 = 'assets/race/bunny.gif';
  static const String Horse3 = 'assets/race/elephant.gif';
  static const String Horse4 = 'assets/race/frog.gif';
  static const String Horse5 = 'assets/race/gadget.gif';
  static const String Horse6 = 'assets/race/horse.gif';
  static const String Horse7 = 'assets/race/mickey.gif';
  static const String Horse8 = 'assets/race/monkey.gif';
  static const String Horse9 = 'assets/race/ostrich.gif';
  static const String Horse10 = 'assets/race/sheep.gif';
  static const String Horse11 = 'assets/race/tiger.gif';
  static const String Horse12 = 'assets/race/turtle.gif';
*/

  static const List<String> diceFaces = <String>[
    Dice1Face,
    Dice2Face,
    Dice3Face,
    Dice4Face,
    Dice5Face,
    Dice6Face,
  ];

  /*
  List<String> horses = <String>[
    Horse0,
    Horse1,
    Horse2,
    Horse3,
    Horse4,
    Horse5,
    Horse6,
    Horse7,
    Horse8,
    Horse9,
    Horse10,
    Horse11,
    Horse12,
  ];
*/

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
  ];
}

 */



class RaceGame extends StatefulWidget {
  final List <PlayerInGame> playerList;

  RaceGame({required this.playerList}) : super();

  @override
  _RaceGameState createState() => _RaceGameState(playerList);
}

class _RaceGameState extends State<RaceGame> {
  List <PlayerInGame> playerList;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isReady = false;
  String imagePath = "";
  RaceGameInProgress theGame = RaceGameInProgress();
  Color caughtColor = Colors.grey;
  final double marginSize = 1;
  final double paddingSize = 1;
  bool horsesChosen = false;
  bool raceFinished = false;

//  Color borderColor = Colors.black;
  _RaceGameState(this.playerList);  //constructor

  @override
  void initState() {
    super.initState();
//    borderColor = Colors.black;
    theGame.numColumns = 2;
//    theGame.resetState();
  }


  void choiceAction(String choice) {
    if (choice == Constants.firstItem) {
      setState(() {
   //     tempLoadPlayer();
      });
    } else if (choice == Constants.secondItem) {
      setState(() {
   //     loadFirstRound();
      });
    }
  }


  Widget build(BuildContext context) {
    if (theGame.getNumOfPlayers() == 0)
    {
      theGame.loadPlayers(playerList);
    }
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Horse Race'),
        ),
        body: body(context)
    );
  }

  Widget body(BuildContext context) {
    if(MediaQuery.of(context).orientation == Orientation.portrait)
    {
//      print("portrait");
      return portrait();
    }
    else {
//      print("landscape");
      return landscape();
    }
  }

  Widget portrait() {
    return
      Column(
          children: <Widget>[
            playerRow(),
            raceTilesPT(2),
            diceRow(),
          ]
      );
  }


  Widget landscape() {
    return Row(
        children: <Widget>[
          playerCol(),
          raceTilesLS(3),
          diceCol(),
        ]
    );

  }


  Widget raceTilesPT(int numColumns) {
    if (theGame.gameState == 0) {
      return chooseHorsePT(2);
    } else {
      return raceHorsePT();
    }

    }

  Widget raceTilesLS(int numColumns) {


    if (theGame.gameState == 0) {
      return chooseHorseLS(3);
    } else {
      return raceHorseLS();
    }

    }

  Widget chooseHorseLS(int numColumns) {

    return Expanded(
      flex: 1,
      child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [

            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    _buildRaceImageWithDropZone(1,Constants.racerImages[1]),
                    _buildRaceImageWithDropZone(2,Constants.racerImages[2]),
                    _buildRaceImageWithDropZone(3,Constants.racerImages[3]),
                  ]
              )  ,
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    _buildRaceImageWithDropZone(4,Constants.racerImages[4]),
                    _buildRaceImageWithDropZone(5,Constants.racerImages[5]),
                    _buildRaceImageWithDropZone(6,Constants.racerImages[6]),
                  ]
              ),
            ),
          ]
      ),
    );
  }



  Widget chooseHorsePT(int numColumns) {

    return Expanded(
      flex: 1,
      child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    _buildRaceImageWithDropZone(1,Constants.racerImages[1]),
                    _buildRaceImageWithDropZone(2,Constants.racerImages[2]),
                  ]
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    _buildRaceImageWithDropZone(3,Constants.racerImages[3]),
                    _buildRaceImageWithDropZone(4,Constants.racerImages[4]),
                  ]
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    _buildRaceImageWithDropZone(5,Constants.racerImages[5]),
                    _buildRaceImageWithDropZone(6,Constants.racerImages[6]),
                  ]
              ),
            ),
          ]
      ),
    );

  }


  Widget _buildRaceImageWithDropZone(int id, String imageName) {
    int raceId = id;
    Color borderColor1  = Colors.black;

    return Expanded(
      flex: 1,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(
      //        horizontal: 6.0,
      //      ),
      child: DragTarget<PlayerInGame>(
        builder: (context, candidateItems, rejectedItems) {
          return
            Container(
              decoration: BoxDecoration(
                border:  Border.all(color: borderColor1, width: 20),
                color: theGame.getAnswerColor(1),
              ),
              child:
              raceImage(
                  imageName
              ),
            );
        },
        onAccept: (player) {
          setState(() {
            theGame.setPlayerAnswer(raceId, int.parse(player.uid));
 //           print("accept ==== bua id->"+ raceId.toString());
 //           print("item name->"+ player.playerName + ' item uid->' + player.uid);
            borderColor1 = Colors.black;
          });
        },
        onWillAccept: (player) {
          if (player != null) {
 //           print("will accept ===== bua id->"+ raceId.toString());
 //           print("willAccept: " + player.uid.toString());
          }
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
      //   ),
    );
  }

  Widget raceImage(String imageName) {

    //return  Image(image: AssetImage(imageName));

    return  FittedBox(
      fit: BoxFit.contain,
      child:  Image(image: AssetImage(imageName)),
    );

  }

  Widget raceHorsePT() {

    //return  Image(image: AssetImage(imageName));

    return  FittedBox(
      fit: BoxFit.contain,
      child:  Text("race horse PT"),
    );

  }
  Widget raceHorseLS() {
 // int numColumns =  theGame.numColumns;

    return Row(
      children: <Widget> [
        // the number of columns here should match game.raceplaces
      Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children:  List.generate(6, (rowIndex) {
            return
              raceImageWidget(rowIndex, 0);
                  }),
                ),
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children:  List.generate(6, (rowIndex) {
            return
              raceImageWidget(rowIndex, 1);
          }),
        ),
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children:  List.generate(6, (rowIndex) {
            return
              raceImageWidget(rowIndex, 2);
          }),
        ),
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children:  List.generate(6, (rowIndex) {
            return
              raceImageWidget(rowIndex, 3);
          }),
        ),
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children:  List.generate(6, (rowIndex) {
            return
              raceImageWidget(rowIndex, 4);
          }),
        ),
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children:  List.generate(6, (rowIndex) {
            return
              raceImageWidget(rowIndex, 5);
          }),
        ),
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children:  List.generate(6, (rowIndex) {
            return
              raceImageWidget(rowIndex, 6);
          }),
        ),
      ]
    );
  }


  Widget raceImageWidget(int rowIndex, int colIndex) {
    //   String tempFilePath;
//    print ("raceimage col:" + colIndex.toString() + " rowindex: " + rowIndex.toString());

    // return  Image.asset(theGame.getRacerImage(rowIndex, colIndex), fit: BoxFit.contain);
    return Expanded(
      flex: 1,
      child:
      Container(
        decoration: BoxDecoration(
          border:  Border.all(color: theGame.raceColors[rowIndex+1], width: 5),
          color: theGame.raceColors[rowIndex],
        ),
        // child: Text("race:" + rowIndex.toString() + "value: " + theGame.theRace[rowIndex].toString()),
        child: Image.asset(theGame.getRacerImage(rowIndex, colIndex), fit: BoxFit.contain),
      ),
    );
  }

/*
  Widget portrait() {
    return Column(
        children: <Widget>[
          /*
          Row(
            children: <Widget>[
              Draggable <int>(
                data: 1,
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: theGame.getPlayerColor(1),
                    ),
                    child: imagePlayerWidget(theGame.getPlayerImage(1))
                ),
                feedback: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: imagePlayerWidget(theGame.getPlayerImage(1)),
                  ),
                  color: Colors.pink,
                ),
              ),
              Draggable <int>(
                data: 2,
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: theGame.getPlayerColor(2),
                    ),
                    child: imagePlayerWidget(theGame.getPlayerImage(2))
                ),
                feedback: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: imagePlayerWidget(theGame.getPlayerImage(2)),
                  ),
                  color: Colors.pink,
                ),
              ),
              Draggable <int>(
                data: 3,
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: theGame.getPlayerColor(3),
                    ),
                    child: imagePlayerWidget(theGame.getPlayerImage(3))
                ),
                feedback: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: imagePlayerWidget(theGame.getPlayerImage(3)),
                  ),
                  color: Colors.pink,
                ),
              ),
              Draggable <int>(
                data: 4,
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: theGame.getPlayerColor(4),
                    ),
                    child: imagePlayerWidget(theGame.getPlayerImage(4))
                ),
                feedback: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: imagePlayerWidget(theGame.getPlayerImage(4)),
                  ),
                  color: Colors.pink,
                ),
              ),

                  Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.black),
                      ),
                      child:
                      Container(
                        margin: const EdgeInsets.all(1.0),
                        padding: const EdgeInsets.all(10.0),
                        child: diceWidget(1),
                      )
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.black),
                    ),
                    child:
                    Container(
                      margin: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.all(10.0),
                      child: diceWidget(2),
                    ),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.black),
                    ),
                    child:
                    Container(
                      margin: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.all(10.0),
                      child: diceWidget(3),
                    ),
                  ),
                /*
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      setState((){
                        reveal();
                      });
                    },
                    child: Text('Roll!'),
                  ),
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      setState((){
                        theGame.nextRound();
                      });
                    },
                    child: Text('Next Round!'),
                  ),
                ),
                */
              ]
          ),
          */
          Flexible(
              fit: FlexFit.tight,
              child: raceTiles(2)),

          Row(
            children: <Widget>[
              Center(
                child: RaisedButton(
                  onPressed: () {
                    setState((){
                      reveal();
                    });
                  },
                  child: Text('Roll!'),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    setState((){
                      theGame.nextRound();
                    });
                  },
                  child: Text('Next Round!'),
                ),
              ),
              Expanded(
                flex: 1,
                child:
                Center(
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.pop(context, theGame.thePlayers);
                    }
                    ,
                    child: Text("Quit"),
                  ),
                ),
              ),
            ],
          ),
        ]
    );
  }

 */


  /*
  Widget landscape() {
    return Row(
        children: <Widget>[

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Draggable <int>(
                data: 1,
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: theGame.getPlayerColor(1),
                    ),
                    child: imagePlayerWidget(theGame.getPlayerImage(1))
                ),
                feedback: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: imagePlayerWidget(theGame.getPlayerImage(1)),
                  ),
                  color: Colors.pink,
                ),
              ),
              Draggable <int>(
                data: 2,
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: theGame.getPlayerColor(2),
                    ),
                    child: imagePlayerWidget(theGame.getPlayerImage(2))
                ),
                feedback: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: imagePlayerWidget(theGame.getPlayerImage(2)),
                  ),
                  color: Colors.pink,
                ),
              ),
              Draggable <int>(
                data: 3,
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: theGame.getPlayerColor(3),
                    ),
                    child: imagePlayerWidget(theGame.getPlayerImage(3))
                ),
                feedback: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: imagePlayerWidget(theGame.getPlayerImage(3)),
                  ),
                  color: Colors.pink,
                ),
              ),
              Draggable <int>(
                data: 4,
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: theGame.getPlayerColor(4),
                    ),
                    child: imagePlayerWidget(theGame.getPlayerImage(4))
                ),
                feedback: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: imagePlayerWidget(theGame.getPlayerImage(4)),
                  ),
                  color: Colors.pink,
                ),
              ),
            ],
          ),

          Flexible(
              fit: FlexFit.tight,
              child: raceTiles(11)
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      setState((){
                        if (horsesChosen == false)
                        {
                          horsesChosen = true;
                        }
                        else
                        {
                          theGame.nextRound();
                          horsesChosen = false;
                        }

                      });

                    },
                    child: Text('Next Round!'),
                  ),
                ),
                Expanded(
                  child:
                  Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.black),
                      ),
                      child:
                      Container(
                        margin: const EdgeInsets.all(1.0),
                        padding: const EdgeInsets.all(10.0),
                        child: diceWidget(1),
                      )
                  ),

                ),

                Expanded(
                  child:
                  Container(
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.black),
                    ),
                    child:
                    Container(
                      margin: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.all(10.0),
                      child: diceWidget(2),
                    ),

                  ),
                ),
                Expanded(
                  child:
                  Container(
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.black),
                    ),
                    child:
                    Container(
                      margin: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.all(10.0),
                      child: diceWidget(3),
                    ),

                  ),
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {

                      setState((){
                        reveal();
                      });



                    },
                    child: Text('Start!'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:
                  Center(
                    child: ElevatedButton(
                      onPressed: ()
                      {
                        Navigator.pop(context, theGame.thePlayers);
                      }
                      ,
                      child: Text("Quit"),
                    ),
                  ),
                ),
              ]
          ),
        ]
    );
  }

   */


  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.red, //                   <--- border color
        width: 5.0,
      ),
    );
  }

  Widget imagePlayerWidget(String filePath) {

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: filePath == null
            ?  SizedBox(
          child: Image.asset('assets/blankPlayer.jpg', fit: BoxFit.contain),
        )
            : SizedBox(
          child: Image.file(File(filePath), fit: BoxFit.contain),
        ),
      ),
    );
  }


  Widget imageRoundWidget(String filePath) {

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: filePath == null
            ?  SizedBox(
          child: Image.asset('assets/blankPlayer.jpg', fit: BoxFit.contain),
        )
            : SizedBox(
          child: Image.file(File(filePath), fit: BoxFit.contain),
        ),
      ),
    );
  }


  Widget imagePreviewWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: imagePath == null
            ? null
            : SizedBox(
          child: Image.file(File(imagePath)),
          height: 290.0,
        ),
      ),
    );
  }




/*
  void showInSnackBar(String value) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(value)
    ));
  }

 */

/*
  tempLoadPlayer() {
    theGame.loadPlayer(1,1);
    theGame.loadPlayer(2,2);
    theGame.loadPlayer(3,3);
    theGame.loadPlayer(4,4);
  }

 */

/*
  loadFirstRound() {
    theGame.loadFirstRound();
  }

 */

/*
  reveal()
  {
    theGame.rollDice();

    raceFinished = theGame.showCorrectAnswers();
  }

 */


/*
  addPlayer(BuildContext context) {
    final result = Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChoosePlayers(theGame: theGame)),
    );
  }

 */

/*
  Widget raceTiles(int numColumns) {
    Color borderColor1= Colors.black;
    Color borderColor2= Colors.black;
    Color borderColor3= Colors.black;
    Color borderColor4= Colors.black;
    Color borderColor5= Colors.black;
    Color borderColor6= Colors.black;

    if (borderColor1 == null)
      borderColor1 = Colors.black;
    if (borderColor2 == null)
      borderColor2 = Colors.black;
    if (borderColor3 == null)
      borderColor3 = Colors.black;
    if (borderColor4 == null)
      borderColor4 = Colors.black;
    if (borderColor5 == null)
      borderColor5 = Colors.black;
    if (borderColor6 == null)
      borderColor6 = Colors.black;

    if (horsesChosen == false)
    {
      return Container(
        child:
        GridView.count(
            crossAxisCount: numColumns,
            children: <Widget> [
              DragTarget <int>(
                builder:
                    (context, List<int> candidateData, rejectedData) {
                  return
                    Container(
                      decoration: new BoxDecoration(
                        border:  new Border.all(color: borderColor1, width: 20),
                        color: theGame.getAnswerColor(1),
                      ),
                      child: SizedBox(

                        child: Image.asset(theGame.getHorseImageStr(0), fit: BoxFit.contain),
                      ),
                    );
                },
                onWillAccept: (data) {
//            print("willAccept: "+ data.toString());
                  borderColor1 = Colors.blue;
                  return true;
                },
                onLeave: (data) {
                  //             print("willAccept: "+ data.toString());
                  borderColor1 = Colors.black;
                  return true;
                },
                onAccept: (data) {
                  setState((){
                    theGame.setPlayerAnswer(1,data);
                    borderColor1 = Colors.black;
                  });
                },
              ),
              DragTarget <int>(
                builder:
                    (context, List<int> candidateData, rejectedData) {
                  return
                    Container(
                      decoration: new BoxDecoration(
                        border:  new Border.all(color: borderColor2, width: 20),
                        color: theGame.getAnswerColor(2),
                      ),
                      child: SizedBox(
                        child: Image.asset(theGame.getHorseImageStr(1), fit: BoxFit.contain),
                      ),
                    );
                },
                onWillAccept: (data) {
                  borderColor2 = Colors.blue;
                  return true;
                },
                onLeave: (data) {
                  borderColor2 = Colors.black;
                  return true;
                },
                onAccept: (data) {
                  setState(() {
                    borderColor2 = Colors.black;
                    theGame.setPlayerAnswer(2,data);
                  });
                },
              ),
              DragTarget <int>(
                builder:
                    (context, List<int> candidateData, rejectedData) {
                  return
                    Container(
                      decoration: new BoxDecoration(
                        border:  new Border.all(color: borderColor3, width: 20),
                        color: theGame.getAnswerColor(3),
                      ),
                      child: SizedBox(
                        child: Image.asset(theGame.getHorseImageStr(2), fit: BoxFit.contain),
                      ),
                    );
                },
                onWillAccept: (data) {
                  borderColor3 = Colors.blue;
                  return true;
                },
                onLeave: (data) {
                  borderColor3 = Colors.black;
                  return true;
                },
                onAccept: (data) {
                  setState((){
                    borderColor3 = Colors.black;
                    theGame.setPlayerAnswer(3,data);
                  });
                },
              ),
              DragTarget <int>(
                builder:
                    (context, List<int> candidateData, rejectedData) {
                  return
                    Container(
                      decoration: new BoxDecoration(
                        border:  new Border.all(color: borderColor4, width: 20),
                        color: theGame.getAnswerColor(4),
                      ),
                      child: SizedBox(
                        child: Image.asset(theGame.getHorseImageStr(3), fit: BoxFit.contain),
                      ),
                    );
                },
                onWillAccept: (data) {
                  borderColor4 = Colors.blue;
                  return true;
                },
                onLeave: (data) {
                  borderColor4 = Colors.black;
                  return true;
                },
                onAccept: (data) {
                  setState((){
                    borderColor4 = Colors.black;
                    theGame.setPlayerAnswer(4,data);
                  });
                },
              ),
              DragTarget <int>(
                builder:
                    (context, List<int> candidateData, rejectedData) {
                  return
                    Container(
                      decoration: new BoxDecoration(
                        border:  new Border.all(color: borderColor5, width: 20),
                        color: theGame.getAnswerColor(5),
                      ),
                      child: SizedBox(
                        child: Image.asset(theGame.getHorseImageStr(4), fit: BoxFit.contain),
                      ),
                    );
                },
                onWillAccept: (data) {
                  borderColor5 = Colors.blue;
                  return true;
                },
                onLeave: (data) {
                  borderColor5 = Colors.black;
                  return true;
                },
                onAccept: (data) {
                  setState((){
                    borderColor5 = Colors.black;
                    theGame.setPlayerAnswer(5,data);
                  });
                },
              ),
              DragTarget <int>(
                builder:
                    (context, List<int> candidateData, rejectedData) {
                  return
                    Container(
                      decoration: new BoxDecoration(
                        border:  new Border.all(color: borderColor6, width: 20),
                        color: theGame.getAnswerColor(6),
                      ),
                      child: SizedBox(
                        child: Image.asset(theGame.getHorseImageStr(5), fit: BoxFit.contain),
                      ),
                    );
                },
                onWillAccept: (data) {
                  borderColor6 = Colors.blue;
                  return true;
                },
                onLeave: (data) {
                  borderColor6 = Colors.black;
                  return true;
                },
                onAccept: (data) {
                  setState((){
                    borderColor6 = Colors.black;
                    theGame.setPlayerAnswer(6,data);
                  });
                },
              ),

            ]

        ),
      );
    }
    else
    {
      return Container(
        child:
        GridView.count(
          crossAxisCount: numColumns,

          children: List.generate(6 * numColumns, (index) {
            return Center(
              child: raceImageWidget(index, numColumns),
              //    child: Image.asset(Constants.horses[theGame.getImageNumber(index, numColumns)], fit: BoxFit.contain),
            );
          }),
        ),
      );
    }

  }

 */



  int getDiceValue(int whichDice) {
    //get dice value from parent
    return theGame.getDiceValue(whichDice);
  }


  Widget diceWidget(int whichDice) {

    int diceValue = getDiceValue(whichDice);
    String tempString = Constants.diceFaces[diceValue+1];
//    print("which dice: " + whichDice.toString());
//    print("diceValue: " + diceValue.toString());
//    print("image Asset: " + tempString);

    return SizedBox(
      width: 75.0,
      //       height: 50.0,
      child:
      Image.asset(tempString, fit: BoxFit.contain),
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

    return
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: ()
                {

                  switch (getRoundState()) {
                    case 0:
                      {
                        setState((){
                          theGame.rollDice();
                          theGame.gameState = 1;
                        });
                      }
                      break;
                    case 1:
                      {
                        setState((){
       //                   theGame.resetState();
                        });
                      }
                      break;
                    default:
                      {}
                  }

                }
                ,
                child: Text(getButtonText()),
              ),
            ),
            diceWidget(1),
            diceWidget(2),
            diceWidget(3),

            Center(
              child: ElevatedButton(
                onPressed: ()
                {
                  theGame.resetState();
                  Navigator.pop(context, theGame.thePlayers);
                }
                ,
                child: Text("Quit"),
              ),
            ),
          ]
      );
  }


  Widget playerCol() {

    return
      SizedBox(
          width: 75.0,
          //  height: 75.0,
          child:
          Column(
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
          )
      );
  }


  Widget diceCol() {

    return
      Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child:
              Center(
                child: ElevatedButton(
                  onPressed: ()
                  {

                    switch (getRoundState()) {
                      case 0:
                        {
                          setState((){
                            theGame.gameState = 1;
                          });
                        }
                        break;
                      case 1:
                        {
                          setState((){
                            theGame.rollDice();

                          });
                        }
                        break;
                      case 2:
                        {
                          setState((){
                            theGame.awardFinishes();

                          });
                        }
                        break;
                      default:
                        {}
                    }

                  }
                  ,
                  child: Text(getButtonText()),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child:
              diceWidget(1),
            ),
            Expanded(
              flex: 1,
              child:
              diceWidget(2),
            ),
            Expanded(
              flex: 1,
              child:
              diceWidget(3),
            ),

            Expanded(
              flex: 1,
              child:
              Center(
                child: ElevatedButton(
                  onPressed: ()
                  {
                    theGame.rollupScore();
                    theGame.resetState();
                    Navigator.pop(context, theGame.thePlayers);
                  }
                  ,
                  child: Text("Quit"),
                ),
              ),
            ),
          ]
      );
  }

  final GlobalKey _draggableKey = GlobalKey();

  Widget _buildPlayer({
    required PlayerInGame player,
  }) {
    return
      Expanded(
        flex: 1,
        child:
        Draggable<PlayerInGame>(
          data: player,
          dragAnchorStrategy: pointerDragAnchorStrategy,
          feedback: DraggingListItem(
            dragKey: _draggableKey,
            playerImage: player.playerAvatar,
          ),
          child: playerAvatar(
              player: player
          ),
        ),
      );
  }


  Widget playerAvatar({
    required PlayerInGame player,
  }) {
    Image answerImage;
  //  double opacitySetting = 0.5;


    if (player.answerChosen == 0)
    {
//      opacitySetting = 0.0;
      answerImage = player.playerAvatar;
 //     print("player original: " + answerImage);
    }
    else
    {
 //     opacitySetting = 0.5;
 //     answerImage = Constants.racerImages[player.answerChosen];
      answerImage = Image(image: AssetImage(Constants.racerImages[player.answerChosen]));
//      print("player changed: " + answerImage);
    }

    return Material(
      elevation: 12.0,
      borderRadius: BorderRadius.circular(20),
      //    child: Padding(
      //      padding: const EdgeInsets.all(5.0),
      child:
      ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          width: 100,
          height: 96,
          child:
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                answerImage,
               // Text(player.playerName + ": " + player.playerScore.toString()),
                Text(player.playerName),
                Text('Rd: ' + player.playerRndScore.toString()),
                Text('Tot: ' + player.playerScore.toString()),
              ]
          ),
        ),
      ),
    );
  }


  String getButtonText() {
    String tempText;

    if (getRoundState() == 0) {
      tempText = 'Go To Races';
    } else if (getRoundState() == 1) {
      tempText = 'Run Race';
    } else if (getRoundState() == 2) {
      tempText = 'Finish';
    } else {
      tempText = 'OOOPS!';
    }

    return tempText;
  }

  int getRoundState() {
    return theGame.gameState;
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
          //  child: Image.asset(imageName, fit: BoxFit.contain),
            child: playerImage,
          ),
        ),
      ),
    );
  }
}

