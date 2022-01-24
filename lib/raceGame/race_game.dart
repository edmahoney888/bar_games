import 'dart:async';
import 'dart:io';
import 'package:bar_games/raceGame/race_game_in_progress.dart';
import 'package:bar_games/raceGame/racer.dart';
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

class _RaceGameState extends State<RaceGame> with TickerProviderStateMixin  {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isReady = false;
  String imagePath = "";
  RaceGameInProgress theGame = RaceGameInProgress();
  Color caughtColor = Colors.grey;
  final double marginSize = 1;
  final double paddingSize = 1;
  bool horsesChosen = false;
  bool raceFinished = false;
  int firstGo = 0;

  // Tween<Offset> tween = Tween<Offset>(
  //   begin: Offset(0.0, 10000.0),
  //   end: Offset(0.0, 0.0),
  // );
  late Animation<Offset> _animation;
  late AnimationController _animationController;


  _RaceGameState();  //constructor

  @override
  void initState() {
    super.initState();
    theGame.numColumns = 2;
//    theGame.resetState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        print('animate complete');
        if (theGame.currentRaceStep < theGame.diceTotals.length) {
          print('currentRaceStep1: ' + theGame.currentRaceStep.toString());
          theGame.currentRaceStep++;
        }

        _animationController.forward();
        setState(() {

        });
      }
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('animate really complete');
        if (theGame.currentRaceStep < theGame.diceTotals.length) {
          print('currentRaceStep2: ' + theGame.currentRaceStep.toString());
          theGame.currentRaceStep++;
        }
        _animationController.forward();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    // _animation = Tween<Offset>(
    //   begin: const Offset(0.0, 0.0),
    //   end: const Offset(2.0, 0.0),
    // ).animate(CurvedAnimation(
    //   parent: _animationController,
    //   curve: Curves.easeInCubic,
    // ));

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
    Racers theRacers = theGame.theRacers;

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
                    _buildRaceImageWithDropZone(theRacers.theRacers[0].racerID,theRacers.theRacers[0].racerImage),
                    _buildRaceImageWithDropZone(theRacers.theRacers[1].racerID,theRacers.theRacers[1].racerImage),
                    _buildRaceImageWithDropZone(theRacers.theRacers[2].racerID,theRacers.theRacers[2].racerImage),
                  ]
              )  ,
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    _buildRaceImageWithDropZone(theRacers.theRacers[3].racerID,theRacers.theRacers[3].racerImage),
                    _buildRaceImageWithDropZone(theRacers.theRacers[4].racerID,theRacers.theRacers[4].racerImage),
                    _buildRaceImageWithDropZone(theRacers.theRacers[5].racerID,theRacers.theRacers[5].racerImage),
                  ]
              ),
            ),
          ]
      ),
    );
  }



  Widget chooseHorsePT(int numColumns) {
    Racers theRacers = theGame.theRacers;
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
                    _buildRaceImageWithDropZone(theRacers.theRacers[0].racerID,theRacers.theRacers[0].racerImage),
                    _buildRaceImageWithDropZone(theRacers.theRacers[1].racerID,theRacers.theRacers[1].racerImage),
                  ]
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    _buildRaceImageWithDropZone(theRacers.theRacers[2].racerID,theRacers.theRacers[2].racerImage),
                    _buildRaceImageWithDropZone(theRacers.theRacers[3].racerID,theRacers.theRacers[3].racerImage),
                  ]
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    _buildRaceImageWithDropZone(theRacers.theRacers[4].racerID,theRacers.theRacers[4].racerImage),
                    _buildRaceImageWithDropZone(theRacers.theRacers[5].racerID,theRacers.theRacers[5].racerImage),
                  ]
              ),
            ),
          ]
      ),
    );

  }


  Widget _buildRaceImageWithDropZone(int id, String imageName) {
    int racerId = id;
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
            Provider.of<BarPlayers>(context, listen: false).setAnswer(player.uid, racerId  );
            print("accept ==== bua id->"+ racerId.toString());
            print("item name->"+ player.playerName + ' item uid->' + player.uid.toString());
            borderColor1 = Colors.black;
          });
        },
        onWillAccept: (player) {
          if (player != null) {
            print("will accept ===== bua id->"+ racerId.toString());
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
    Racers theRacers = theGame.theRacers;
    return
      Expanded(
          flex: 1,
          child:
          Column (
                 mainAxisAlignment: MainAxisAlignment.start,
                 children:  List.generate(6, (rowIndex) {
                   return
                     //raceImageWidget(rowIndex, 0);
                     raceImageWidget(theRacers.theRacers[rowIndex],0);
                         }),
    ),
    );
  }

  // Widget raceHorseLS() {
  //   Racers theRacers = theGame.theRacers;
  //
  //   return Row(
  //     children: <Widget> [
  //       // the number of columns here should match game.raceplaces
  //     Column (
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children:  List.generate(6, (rowIndex) {
  //           return
  //             //raceImageWidget(rowIndex, 0);
  //             raceImageWidget(theRacers.theRacers[rowIndex],0);
  //                 }),
  //               ),
  //       Column (
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children:  List.generate(6, (rowIndex) {
  //           return
  //             raceImageWidget(theRacers.theRacers[rowIndex], 1);
  //         }),
  //       ),
  //       Column (
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children:  List.generate(6, (rowIndex) {
  //           return
  //             raceImageWidget(theRacers.theRacers[rowIndex], 2);
  //         }),
  //       ),
  //       Column (
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children:  List.generate(6, (rowIndex) {
  //           return
  //             raceImageWidget(theRacers.theRacers[rowIndex], 3);
  //         }),
  //       ),
  //       Column (
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children:  List.generate(6, (rowIndex) {
  //           return
  //             raceImageWidget(theRacers.theRacers[rowIndex], 4);
  //         }),
  //       ),
  //       Column (
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children:  List.generate(6, (rowIndex) {
  //           return
  //             raceImageWidget(theRacers.theRacers[rowIndex], 5);
  //         }),
  //       ),
  //       Column (
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children:  List.generate(6, (rowIndex) {
  //           return
  //             raceImageWidget(theRacers.theRacers[rowIndex], 6);
  //         }),
  //       ),
  //     ]
  //   );
  // }

  Widget raceImageWidget(Racer theRacer, int colIndex) {
    int racerID = theRacer.racerID;
    double offsetNow = 0;

      offsetNow = theGame.checkRacer(racerID, theGame.currentRaceStep);
      print('offset now: ' + offsetNow.toString());

     _animation = Tween<Offset>(
       begin: const Offset(0.0, 0.0),
       end: Offset(offsetNow, 0.0),
     ).animate(CurvedAnimation(
       parent: _animationController,
       curve: Curves.easeInCubic,
     ));
    return
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            //ask the racer for these colors

            border:  Border(top: BorderSide(color: theRacer.color, width: 5),
              bottom: BorderSide(color: theRacer.color, width: 5),
            ),

            //ask the racer for these colors
            color: theRacer.color,
          ),

          child:
            SlideTransition(
              position: _animation,
              child:
                Image.asset(theRacer.getImageInRace(colIndex), fit: BoxFit.contain),
            ),
        ),
      );

  }

  // Widget raceImageWidget(int rowIndex, int colIndex) {
  //   int racerID;
  //
  //   return Expanded(
  //     flex: 1,
  //     child:
  //     Container(
  //       decoration: BoxDecoration(
  //         //ask the racer for these colors
  //
  //         border:  Border(top: BorderSide(color: theGame.raceColors[rowIndex+1], width: 5),
  //           bottom: BorderSide(color: theGame.raceColors[rowIndex+1], width: 5),
  //         ),
  //
  //         //ask the racer for these colors
  //         color: theGame.raceColors[rowIndex],
  //       ),
  //
  //       child: Image.asset(theGame.getRacerImage(rowIndex, colIndex), fit: BoxFit.contain),
  //     ),
  //   );
  // }


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
                        while (theGame.allFinished == false) {
                          theGame.rollDice();
                          setState(() {
                            theGame.gameState = 1;
                          });
                        }
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
                          theGame.rollOutGame();
                          theGame.currentRaceStep = 0;
                          setState((){
                            theGame.gameState = 1;
                          });
                        }
                        break;
                      case 1:
                        {
                          _animationController.forward();

                          // while (theGame.diceTotals.length >= theGame.currentRaceStep) {
                          //
                          //   setState(() {
                          //     _animationController.forward();
                          //     theGame.currentRaceStep++;
                          //      }
                          //      );
                          //
                          // }

                //          theGame.gameState = 2;
                        }
                        break;
                      case 2:
                        {
                          setState((){
                            // make sure this is onlyu done once
                            BarPlayers thePlayers = Provider.of<BarPlayers>(context, listen: false);
                            thePlayers.addRndScore(0, theGame.payout(thePlayers.playerList[0].answerChosen));
                            thePlayers.addRndScore(1, theGame.payout(thePlayers.playerList[1].answerChosen));
                            thePlayers.addRndScore(2, theGame.payout(thePlayers.playerList[2].answerChosen));
                            thePlayers.addRndScore(3, theGame.payout(thePlayers.playerList[3].answerChosen));
                            theGame.gameState = 3;
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

  @override
  void dispose() {
        _animationController.dispose();
        super.dispose();
  }

}



