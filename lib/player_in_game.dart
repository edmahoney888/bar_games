
import 'package:flutter/material.dart';

class PlayerInGame {
  String playerName = "default";
  String playerAvatar = "assets/images/playeravatars/blankPlayer.jpg";
  int answerChosen = -1;
  Color itemColor = Colors.redAccent;
  final Color colorUnselected = Colors.redAccent;
  final Color colorSelected = Colors.blueAccent;
  final Color colorCorrect = Colors.amber;
  final Color colorIncorrect = Colors.deepPurpleAccent;


  PlayerInGame();


  setAnswer(int theAnswer)
  {
    print("======== setting answer: " + theAnswer.toString());
    answerChosen = theAnswer;
    itemColor = colorSelected;
  }

  int getAnswer()
  {
    return answerChosen;
  }


  String getImage() {
    return playerAvatar;
  }

  addTestPlayer() {

  }

  bool hasPlayer() {

    return true;
  }
}