
import 'package:flutter/material.dart';

class PlayerInGame {
  String playerName = "default";
  String defaultAvatar = "assets/images/playeravatars/blankPlayer.jpg";
  Image playerAvatar = Image.asset("assets/images/playeravatars/blankPlayer.jpg", fit: BoxFit.contain);
  int playerScore = 0;
  int playerRndScore = 0;
  String uid = '0';
  int answerChosen = 0;
  Color itemColor = Colors.redAccent;
  final Color colorUnselected = Colors.redAccent;
  final Color colorSelected = Colors.blueAccent;
  final Color colorCorrect = Colors.amber;
  final Color colorIncorrect = Colors.deepPurpleAccent;


  PlayerInGame();


  setAnswer(int theAnswer)
  {
 //   print("======== setting answer: " + theAnswer.toString());
    answerChosen = theAnswer;
    itemColor = colorSelected;
  }

  int getAnswer()
  {
    return answerChosen;
  }


  Image getImage() {
    return playerAvatar;
  }

  addTestPlayer() {

  }

  bool hasPlayer() {

    return true;
  }
}