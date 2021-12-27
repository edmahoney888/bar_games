import 'dart:io';
import 'package:bar_games/raceGame/race_game_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bar_constants.dart';
import '../player/player_in_game.dart';

import 'package:bar_games/player/player_widget.dart';


class RaceGame extends StatefulWidget {

  RaceGame() : super();

  @override
  _RaceGameState createState() => _RaceGameState();
}

class _RaceGameState extends State<RaceGame> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isReady = false;
  String imagePath = "";
  RaceGameInProgress theGame = RaceGameInProgress();
  Color caughtColor = Colors.grey;
  final double marginSize = 1;
  final double paddingSize = 1;
  bool horsesChosen = false;
  bool raceFinished = false;

  _RaceGameState();  //constructor

  @override
  void initState() {
    super.initState();
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
      return portrait();
    }
    else {
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
            Provider.of<BarPlayers>(context, listen: false).setAnswer(player.uid, raceId  );
            print("accept ==== bua id->"+ raceId.toString());
            print("item name->"+ player.playerName + ' item uid->' + player.uid.toString());
            borderColor1 = Colors.black;
          });
        },
        onWillAccept: (player) {
          if (player != null) {
            print("will accept ===== bua id->"+ raceId.toString());
            print("willAccept: " + player.uid.toString());
          }
          borderColor1 = Colors.blue;
          return true;
        },
        onLeave: (player) {

          borderColor1 = Colors.black;
          return;
        },
      ),
      //   ),
    );
  }

  Widget raceImage(String imageName) {

    return  FittedBox(
      fit: BoxFit.contain,
      child:  Image(image: AssetImage(imageName)),
    );

  }

  Widget raceHorsePT() {

    return  FittedBox(
      fit: BoxFit.contain,
      child:  Text("race horse PT"),
    );

  }
  Widget raceHorseLS() {

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

    return Expanded(
      flex: 1,
      child:
      Container(
        decoration: BoxDecoration(

          border:  Border(top: BorderSide(color: theGame.raceColors[rowIndex+1], width: 5),
            bottom: BorderSide(color: theGame.raceColors[rowIndex+1], width: 5),
          ),

          color: theGame.raceColors[rowIndex],
        ),

        child: Image.asset(theGame.getRacerImage(rowIndex, colIndex), fit: BoxFit.contain),
      ),
    );
  }


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


  int getDiceValue(int whichDice) {
    //get dice value from parent
    return theGame.getDiceValue(whichDice);
  }


  Widget diceWidget(int whichDice) {

    int diceValue = getDiceValue(whichDice);
    String tempString = Constants.diceFaces[diceValue+1];

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
        playerWidget(
          playerNum: 0,context: context, tileFaces: Constants.racerImages,
        ),
        playerWidget(
          playerNum: 1,context: context,tileFaces: Constants.racerImages,
        ),
        playerWidget(
          playerNum: 2,context: context,tileFaces: Constants.racerImages,
        ),
        playerWidget(
          playerNum: 3,context: context,tileFaces: Constants.racerImages,
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
                  Provider.of<BarPlayers>(context, listen: false).rollUpScore();
                  theGame.resetState();
                  Navigator.pop(context);
                }
                ,
                child: Text("Finish"),
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
              playerWidget(
                playerNum: 0,context: context,tileFaces: Constants.racerImages,
              ),
              playerWidget(
                playerNum: 1,context: context,tileFaces: Constants.racerImages,
              ),
              playerWidget(
                playerNum: 2,context: context,tileFaces: Constants.racerImages,
              ),
              playerWidget(
                playerNum: 3,context: context,tileFaces: Constants.racerImages,
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
                            // make sure this is onlyu done once
                            BarPlayers thePlayers = Provider.of<BarPlayers>(context, listen: false);
                            thePlayers.addRndScore(0, theGame.finishes[thePlayers.playerList[0].answerChosen]);
                            thePlayers.addRndScore(0, theGame.finishes[thePlayers.playerList[1].answerChosen]);
                            thePlayers.addRndScore(0, theGame.finishes[thePlayers.playerList[2].answerChosen]);
                            thePlayers.addRndScore(0, theGame.finishes[thePlayers.playerList[3].answerChosen]);

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
                    Provider.of<BarPlayers>(context, listen: false).rollUpScore();
                    theGame.resetState();
                    Navigator.pop(context);
                  }
                  ,
                  child: Text("Finish"),
                ),
              ),
            ),
          ]
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


