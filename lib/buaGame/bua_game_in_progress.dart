
import 'package:flutter/material.dart';
import 'dart:math';
import '../player/player.dart';

class BuaGameInProgress {
  String defaultName = "Default Name";
  String defaultImage = 'assets/images/playeravatars/blankPlayer.jpg';
  int gameState = 0;
  int dice1 = 0;
  int dice2 = 0;
  int dice3 = 0;

  final Color colorUnselected = Colors.blueGrey;
  final Color colorSelected = Colors.blueAccent;
  final Color colorCorrect = Colors.amber;
  final Color colorIncorrect = Colors.deepPurpleAccent;

  final Color colorAnswerHidden = Colors.redAccent;
  final Color colorAnswerCorrect1 = Colors.amber;
  final Color colorAnswerIncorrect = Colors.deepPurpleAccent;
  final Color colorAnswerCorrect2 = Colors.red;
  final Color colorAnswerCorrect3 = Colors.green;


  BuaGameInProgress()
  {

    _loadGames();
    _loadRounds();
  }


  setupPlayers()
  {

  }


  bool playerGotCorrectAnswer(int playerNum)
  {
    bool tempAnswer = false;

    return tempAnswer;
  }




  resetAnswers()
  {

  }


  _loadGames() async {

  }


  _loadRounds() async {

  }


  nextRound()  {

    return;
  }


  String getPlayerImageFromID(playerID) {
    String tempImage = "";

    return tempImage;
  }


  String getCurrentRoundImage() {
    String tempImage = "";

    return tempImage;
  }


  Color getPlayerColor(int playerNum) {
    Color tempColor  = colorUnselected;

    return tempColor;
  }


  Color getAnswerColor(int answerNum) {

    Color tempColor  = colorUnselected;

    return tempColor;
  }


  loadFirstRound() {

  }


  loadAnswers() {

  }

  loadPlayer(int playerPosition, int playerID)
  {

  }



  showCorrectAnswers() {


  }

  resetPlayerAnswers()
  {

  }


  setPlayer(BGPlayer thePlayer) {

  }


  rollDice() {
    dice1 = rollADice();
    dice2 = rollADice();
    dice3 = rollADice();

  }


  int rollADice() {
    final _random = Random();
    return _random.nextInt(6) + 1;
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

  }


}