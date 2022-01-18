
import 'package:bar_games/raceGame/racer.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../bar_constants.dart';


class RaceGameInProgress {
  Racers theRacers = Racers();
  List<int> theRace = [0,0,0,0,0,0,0];
  List<int> finishes = [0,0,0,0,0,0,0];
  int gameState = 0;
  int dice1 = 0;
  int dice2 = 0;
  int dice3 = 0;
  bool firstPlace = false;
  bool secondPlace = false;
  bool thirdPlace = false;
  int numRaceSteps = 7;
  bool allFinished = false;
  List<Color> raceColors = [Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white];


  int horse0 = 0;
  int horse1 = 1;
  int horse2 = 2;
  int horse3 = 3;
  int horse4 = 4;
  int horse5 = 5;
  int horse6 = 6;
  bool horse1Finished = false;
  bool horse2Finished = false;
  bool horse3Finished = false;
  bool horse4Finished = false;
  bool horse5Finished = false;
  bool horse6Finished = false;
  bool firstPlaceFinished = false;
  bool secondPlaceFinished = false;
  bool thirdPlaceFinished = false;
  int numColumns = 0;


  final Color colorUnselected = Colors.redAccent;
  final Color colorSelected = Colors.blueAccent;
  final Color colorCorrect = Colors.amber;
  final Color colorIncorrect = Colors.deepPurpleAccent;

  final Color colorAnswerHidden = Colors.redAccent;
  final Color colorAnswerCorrect = Colors.amber;
  final Color colorAnswerIncorrect = Colors.deepPurpleAccent;

  final Color firstPlaceColor = Colors.amber;
  final Color secondPlaceColor = Colors.red;
  final Color thirdPlaceColor = Colors.green;


  RaceGameInProgress()
  {

  }




  // int getImageNumber(int rowIndex, int colIndex) {
  //
  //     if (rowIndex == horse1 ) {
  //       if (colIndex == theRace[horse1]) {
  //         return horse1;
  //       } else {
  //         return horse0;
  //       }
  //     }
  //
  //     if (rowIndex == horse2 ) {
  //       if (colIndex == theRace[horse2]) {
  //         return horse2;
  //       } else {
  //         return horse0;
  //       }
  //     }
  //
  //     if (rowIndex == horse3 ) {
  //       if (colIndex == theRace[horse3]) {
  //         return horse3;
  //       } else {
  //         return horse0;
  //       }
  //     }
  //
  //     if (rowIndex == horse4 ) {
  //       if (colIndex == theRace[horse4]) {
  //         return horse4;
  //       } else {
  //         return horse0;
  //       }
  //     }
  //
  //     if (rowIndex == horse5 ) {
  //       if (colIndex == theRace[horse5]) {
  //         return horse5;
  //       } else {
  //         return horse0;
  //       }
  //     }
  //
  //     if (rowIndex == horse6 ) {
  //       if (colIndex == theRace[horse6]) {
  //         return horse6;
  //       } else {
  //         return horse0;
  //       }
  //     }
  //
  //   return horse0;
  // }


  // String getRacerImage(rowIndex, colIndex)
  // {
  //   String tempStr;
  //
  //   int imgNum = getImageNumber(rowIndex+1, colIndex);
  //
  //   if (imgNum == -1) {
  //     tempStr = Constants.racerImages[0];
  //   } else {
  //     tempStr = Constants.racerImages[imgNum];
  //   }
  //
  //   return tempStr;
  // }


  resetAnswers()
  {

  }

  Color getAnswerColor(int answerNum) {

    Color tempColor  = colorUnselected;

    return tempColor;
  }

  int payout(int racerID)
  {
    int tempPayout = 0;

    tempPayout = theRacers.payout(racerID);

    return tempPayout;
  }


  checkAllFinished() {

    if (theRacers.allFinished())
    {
         allFinished = true;
         gameState = 2;

    }
    // bool tempAllFinished = true;
    //
    //   for (int counter = 1; counter <= theRace.length-1; counter++)
    //   {
    //     if (theRace[counter] < numRaceSteps) {
    //       tempAllFinished = false;
    //     }
    //   }
    //
    //   if (tempAllFinished) {
    //     print("all finish = true");
    //     allFinished = true;
    //     gameState = 2;
    //   }
  }



  // checkWinners() {
  //
  //   if (firstPlace == false)
  //     {
  //       for (int counter = 0; counter <= theRace.length-1; counter++)
  //         {
  //           if ((theRace[counter] >= numRaceSteps) && ( finishes[counter] == 0)) {
  //             finishes[counter] = 3;
  //             raceColors[counter] = firstPlaceColor;
  //             firstPlace = true;
  //           }
  //         }
  //
  //     }
  //   else if (secondPlace == false)
  //     {
  //       for (int counter = 1; counter <= theRace.length-1; counter++)
  //       {
  //         if ((theRace[counter] >= numRaceSteps) && ( finishes[counter] == 0)) {
  //           finishes[counter] = 2;
  //           raceColors[counter] = secondPlaceColor;
  //           secondPlace = true;
  //         }
  //       }
  //
  //     }
  //   else if (thirdPlace == false)
  //     {
  //       for (int counter = 1; counter <= theRace.length-1; counter++)
  //       {
  //         if ((theRace[counter] >= numRaceSteps) && ( finishes[counter] == 0)) {
  //           finishes[counter] = 1;
  //           raceColors[counter] = thirdPlaceColor;
  //
  //           thirdPlace = true;
  //         }
  //       }
  //     }
  //   else
  //     {
  //
  //     }
  //
  // }

  advance() {
    theRacers.moveRacers(dice1, dice2, dice3);
    // score first dice
  //  theRace[dice1+1] = theRace[dice1+1] + 1;

    //score second dice
  //  theRace[dice2+1] = theRace[dice2+1] + 1;

    //score third dice
  //  theRace[dice3+1] = theRace[dice3+1] + 1;
  }



  rollDice() {
    dice1 = rollADice();
    dice2 = rollADice();
    dice3 = rollADice();

    advance();
  //  checkWinners();
    checkAllFinished();
    print("race: " + theRace.toString() );
  }


  int rollADice() {
    final _random = Random();
    return _random.nextInt(6);
  }


  int getDiceValue(int whichDice) {
    int tempDiceValue = 1;

    switch(whichDice) {
      case 1: {
        tempDiceValue = dice1;
      }
      break;
      case 2: {
        tempDiceValue = dice2;
      }
      break;
      case 3: {
        tempDiceValue = dice3;
      }
      break;
      default: {
        tempDiceValue = 1;
      }
    }

    return tempDiceValue;
  }

  resetState() {
    dice1 = 0;
    dice2 = 0;
    dice3 = 0;

    gameState = 0;

    theRace[0] = 0;
    theRace[1] = 0;
    theRace[2] = 0;
    theRace[3] = 0;
    theRace[4] = 0;
    theRace[5] = 0;
    theRace[6] = 0;

    firstPlace = false;
    secondPlace = false;
    thirdPlace = false;

    allFinished = false;
  }

}