import 'package:flutter/material.dart';

class BarPlayers with ChangeNotifier {
  PlayerInGame player1 = PlayerInGame();
  PlayerInGame player2 = PlayerInGame();
  PlayerInGame player3 = PlayerInGame();
  PlayerInGame player4 = PlayerInGame();

  List<PlayerInGame> playerList = [];

  int _selectedPlayer = 0;

  int get selectedPlayer => _selectedPlayer;

  set selectedPlayer(int value) {
    _selectedPlayer = value;
  }

  BarPlayers() {
    player1.uid = 0;
    player2.uid = 1;
    player3.uid = 2;
    player4.uid = 3;
    playerList.add(player1);
    playerList.add(player2);
    playerList.add(player3);
    playerList.add(player4);
  }

  setAnswer(int playerNum, int theAnswer) {
    playerList[playerNum].setAnswer(theAnswer);
    notifyListeners();
  }

  int getAnswer(int playerNum) {
    return playerList[playerNum].getAnswer();
  }

  Image getImage(int playerNum) {
    return playerList[playerNum].getImage();
  }

  resetAnswers() {
    setAnswer(0, 0);
    setAnswer(1, 0);
    setAnswer(2, 0);
    setAnswer(3, 0);
  }

  setSelectedPlayerName(String pName) {
    playerList[selectedPlayer].playerName = pName;
    notifyListeners();
  }

  setSelectedPlayerImage(Image pImage) {
    playerList[selectedPlayer].playerAvatar = pImage;
    notifyListeners();
  }

  setSelectedPlayerAnswer(int pAnswer) {
    playerList[selectedPlayer].answerChosen = pAnswer;
    notifyListeners();
  }

  addRndScore(int playerNum, int scoreInc) {
    playerList[playerNum].playerRndScore =
        playerList[playerNum].playerRndScore + scoreInc;
    notifyListeners();
  }

  rollUpScore() {
    print("========== rolling up score ==============");
    print("player 0 before: tot: " + playerList[0].playerTotScore.toString());
    print("player 0 before: rnd: " + playerList[0].playerRndScore.toString());
    playerList[0].playerTotScore =
        playerList[0].playerTotScore + playerList[0].playerRndScore;
    playerList[0].playerRndScore = 0;
    print("player 0 after: tot: " + playerList[0].playerTotScore.toString());
    print("player 0 after: rnd: " + playerList[0].playerRndScore.toString());

    print("player 1 before: tot: " + playerList[1].playerTotScore.toString());
    print("player 1 before: rnd: " + playerList[1].playerRndScore.toString());
    playerList[1].playerTotScore =
        playerList[1].playerTotScore + playerList[1].playerRndScore;
    playerList[1].playerRndScore = 0;
    print("player 1 after: tot: " + playerList[1].playerTotScore.toString());
    print("player 1 after: rnd: " + playerList[1].playerRndScore.toString());

    print("player 2 before: tot: " + playerList[2].playerTotScore.toString());
    print("player 2 before: rnd: " + playerList[2].playerRndScore.toString());
    playerList[2].playerTotScore =
        playerList[2].playerTotScore + playerList[2].playerRndScore;
    playerList[2].playerRndScore = 0;
    print("player 2 after: tot: " + playerList[2].playerTotScore.toString());
    print("player 2 after: rnd: " + playerList[2].playerRndScore.toString());

    print("player 3 before: tot: " + playerList[3].playerTotScore.toString());
    print("player 3 before: rnd: " + playerList[3].playerRndScore.toString());
    playerList[3].playerTotScore =
        playerList[3].playerTotScore + playerList[3].playerRndScore;
    playerList[3].playerRndScore = 0;
    print("player 3 after: tot: " + playerList[3].playerTotScore.toString());
    print("player 3 after: rnd: " + playerList[3].playerRndScore.toString());

    resetAnswers();
    notifyListeners();
  }

  correctAnswer(int dice1, int dice2, int dice3) {
    playerList[0].correctAnswer(dice1, dice2, dice3);

    playerList[1].correctAnswer(dice1, dice2, dice3);

    playerList[2].correctAnswer(dice1, dice2, dice3);

    playerList[3].correctAnswer(dice1, dice2, dice3);
    notifyListeners();
  }

  resetState() {
    if (playerList != null) {
      playerList[0].answerChosen = 0;
      playerList[1].answerChosen = 0;
      playerList[2].answerChosen = 0;
      playerList[3].answerChosen = 0;
    }
    notifyListeners();
  }
}

class PlayerInGame with ChangeNotifier {
  String _playerName = "default";

  String get playerName => _playerName;

  set playerName(String value) {
    _playerName = value;
    notifyListeners();
  }

  String defaultAvatar = "assets/images/playeravatars/blankPlayer.jpg";
  Image _playerAvatar = Image.asset(
      "assets/images/playeravatars/blankPlayer.jpg",
      fit: BoxFit.contain);
  int _playerTotScore = 0;
  int _playerRndScore = 0;
  int _uid = 0;
  int _answerChosen = 0;
  Color _itemColor = Colors.redAccent;
  final Color colorUnselected = Colors.redAccent;
  final Color colorSelected = Colors.blueAccent;
  final Color colorCorrect = Colors.amber;
  final Color colorIncorrect = Colors.deepPurpleAccent;

  PlayerInGame();

  setAnswer(int theAnswer) {
    _answerChosen = theAnswer;
    _itemColor = colorSelected;
    notifyListeners();
  }

  int getAnswer() {
    return _answerChosen;
  }

  Image getImage() {
    return _playerAvatar;
  }

  correctAnswer(int dice1, int dice2, int dice3) {
    int tempAnswer = 0;
    int tempAnswerVal = _answerChosen;

    if (dice1 == tempAnswerVal) {
      tempAnswer = 1;
    }

    if (dice2 == tempAnswerVal) {
      tempAnswer = tempAnswer + 1;
    }

    if (dice3 == tempAnswerVal) {
      tempAnswer = tempAnswer + 1;
    }

    _playerRndScore = _playerRndScore + tempAnswer;
  }

  Image get playerAvatar => _playerAvatar;

  set playerAvatar(Image value) {
    _playerAvatar = value;
    notifyListeners();
  }

  int get playerTotScore => _playerTotScore;

  set playerTotScore(int value) {
    _playerTotScore = value;
    notifyListeners();
  }

  int get playerRndScore => _playerRndScore;

  set playerRndScore(int value) {
    _playerRndScore = value;
    notifyListeners();
  }

  int get uid => _uid;

  set uid(int value) {
    _uid = value;
  }

  int get answerChosen => _answerChosen;

  set answerChosen(int value) {
    _answerChosen = value;
    notifyListeners();
  }

  Color get itemColor => _itemColor;

  set itemColor(Color value) {
    _itemColor = value;
    notifyListeners();
  }
}
