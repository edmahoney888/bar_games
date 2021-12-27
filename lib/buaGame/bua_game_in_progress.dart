
import 'package:flutter/material.dart';
import 'dart:math';

import '../player/player.dart';
import '../player/player_in_game.dart';

class BuaGameInProgress {
  String defaultName = "Default Name";
  String defaultImage = 'assets/images/playeravatars/blankPlayer.jpg';
//  List<PlayerInGame> thePlayers = [];
  int gameState = 0;
  int dice1 = 0;
  int dice2 = 0;
  int dice3 = 0;

 // bool _reveal = false;

  final Color colorUnselected = Colors.redAccent;
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
 //   _players = new List(1);
    //_loadPlayers();
    _loadGames();
    _loadRounds();
  }

/*
  Map<String, dynamic> toMap() {
    return {
      'currentGame': currentGame,
      'currentRound': currentRound,
    };
  }

 */

/*
  setPlayers(List<Player> thePlayers)
  {
    _players = thePlayers;

    setupPlayers();
  }

 */

/*
  setGames(List<Game> theGames)
  {
    _games = theGames;
  }

 */

/*
  setRounds(List<Round> theRounds)
  {
    _rounds = theRounds;

    setupRounds();
  }

 */


  setupPlayers()
  {
    /*
    PlayerInGame tempPlayer;

    player1ID.playerName = defaultName;
    player1ID.playerAvatar = defaultImage;
    player2ID.playerName = defaultName;
    player2ID.playerAvatar = defaultImage;
    player3ID.playerName = defaultName;
    player3ID.playerAvatar = defaultImage;
    player4ID.playerName = defaultName;
    player4ID.playerAvatar = defaultImage;

     */

/*
    if (_players != null) {
      for (var n in _players) {
        tempPlayer = new PlayerInGame();
        tempPlayer.thePlayer = n;
        thePlayers.add(tempPlayer);
      }
    }

 */
  }

  /*
  setupRounds()
  {
    Answers tempAnswer;

    _answers = new List();
    if (currentRound != null) {
      tempAnswer = new Answers();
      tempAnswer.value = currentRound.correctAnswer;
      tempAnswer.correct = true;
      _answers.add(tempAnswer);

      tempAnswer = new Answers();
      tempAnswer.value = currentRound.incorrectAnswer1;
      tempAnswer.correct = false;
      _answers.add(tempAnswer);

      tempAnswer = new Answers();
      tempAnswer.value = currentRound.incorrectAnswer2;
      tempAnswer.correct = false;
      _answers.add(tempAnswer);

      _answers.shuffle();
    }
  }

   */

/*
  String getAnswer(int theAnswer) {
    String tempAnswer = "unk";

    if (_answers != null) {
      switch (theAnswer) {
        case 1:
          {
            tempAnswer = _answers.elementAt(0).value;
          }
          break;
        case 2:
          {
            tempAnswer = _answers.elementAt(1).value;
          }
          break;
        case 3:
          {
            tempAnswer = _answers.elementAt(2).value;
          }
          break;
        default:
          {
            tempAnswer = "unk";
          }
      }
    }
    return tempAnswer;
  }

 */


  bool playerGotCorrectAnswer(int playerNum)
  {
    bool tempAnswer = false;
    /*
    int whichAnswer;

    if (thePlayers.elementAt(playerNum).answerChosen > -1)
    {
      whichAnswer = thePlayers[playerNum].getAnswer();
      tempAnswer = _answers[whichAnswer].correct;
    }

     */
    return tempAnswer;
  }

  // int getNumOfPlayers()
  // {
  //   return thePlayers.length;
  // }

/*  int correctAnswer(int theAnswer)
  {
    int tempAnswer = 0;
    int tempAnswerVal = theAnswer;

    if (dice1 == tempAnswerVal) {
      tempAnswer = 1;
    }

    if (dice2 == tempAnswerVal) {
      tempAnswer = tempAnswer + 1;
    }

    if (dice3 == tempAnswerVal) {
      tempAnswer = tempAnswer + 1;
    }

    return tempAnswer;
  }*/


  resetAnswers()
  {
  //  player1ID.setAnswer(0);
  //  player2ID.setAnswer(0);
  //  player3ID.setAnswer(0);
  //  player4ID.setAnswer(0);
  }


  // loadPlayers(List<PlayerInGame> thePlayers)  {
  //   this.thePlayers = thePlayers;
  //
  // //  setupPlayers();   //loads default players
  //
  //  // player1ID.playerName = "joy";
  // //  player1ID.playerAvatar = "assets/images/playeravatars/girl01.PNG";
  //  // player2ID.playerName = "jane";
  // //  player2ID.playerAvatar = "assets/images/playeravatars/girl02.PNG";
  //  // player3ID.playerName = "jay";
  //  // player3ID.playerAvatar = "assets/images/playeravatars/girl03.PNG";
  //   /*
  //   _players = new List();
  //
  //   final loadedPlayers = await dbHelper.players();
  //
  //   for (var n in loadedPlayers) {
  //     _players.add(n);
  //     if (selectedPlayer == null) {
  //       selectedPlayer = n;
  //     }
  //   }
  //
  //    */
  // }


 // void _printSelectedPlayer() {
/*
    if (selectedPlayer != null) {
      print('===== selectedPlayer ==========');
      print('ID: ${selectedPlayer.id}');
      print('Name: ${selectedPlayer.name}');
      print('Dob: ${selectedPlayer.dob}');
      print('Phone: ${selectedPlayer.phone}');
      print('Line ID: ${selectedPlayer.lineID}');
      print('Image: ${selectedPlayer.image}');
      print('========================================');
    }
    else
      print('selected player is null');

 */
 // }


  _loadGames() async {
    /*
    _games = new List();
    final loadedGames = await dbHelper.games();

    for (var n in loadedGames) {
      _games.add(n);
      if (selectedGame == null) {
        selectedGame = n;
      }
    }

     */
  }



  _loadRounds() async {
    /*
    _rounds = new List();
    final loadedRounds = await dbHelper.rounds();

    for (var n in loadedRounds) {
      _rounds.add(n);
      if (selectedRound == null) {
        selectedRound = n;
      }
    }

     */
  }


  //_loadRoundsForGame(int gameNum) async {
    /*
    if (_roundsForGame != null)
      _roundsForGame = null;
    _roundsForGame = new List();
    selectedRound = null;

    for (var n in _rounds) {
      if (n.gameID == gameNum) {
        _roundsForGame.add(n);
        if (selectedRound == null)
          selectedRound = n;
      }
    }

     */
  //}


 // void _printSelectedRound() {
/*
    if (selectedRound != null) {
      print('===== selectedRound ==========');
      print('ID: ${selectedRound.id}');
      print('Name: ${selectedRound.name}');
      print('correctanswer: ${selectedRound.correctAnswer}');
      print('incorrectAnswer1: ${selectedRound.incorrectAnswer1}');
      print('incorrectAnswer2: ${selectedRound.incorrectAnswer2}');
      print('Image: ${selectedRound.image}');
      print('========================================');
    }
    else
      print('selected player is null');

 */
  //}

  nextRound()  {
    /*
    bool foundRound = false;
    resetPlayerAnswers();


    if (_roundsForGame.length > 0) {
      for (var n in _roundsForGame)
      {
        if (foundRound == true)
        {
          selectedRound = n;
          currentRound = selectedRound;
          loadAnswers();
          return;
        }
        if (n.id == selectedRound.id) {
          foundRound = true;
        }
      }
    }
    */
    return;
  }


  // Image getPlayerImage(int playerNum) {
  //   Image tempImage;
  //
  //   tempImage = thePlayers[playerNum].getImage();
  //
  //   return tempImage;
  // }


  // String getPlayerName(int playerNum) {
  //   String tempName = "";
  //
  //   tempName = thePlayers[playerNum].playerName;
  //
  //   return tempName;
  // }


  String getPlayerImageFromID(playerID) {
    String tempImage = "";

    return tempImage;
  }




  String getCurrentRoundImage() {
    String tempImage = "";

    return tempImage;
  }


  // setPlayerAnswer(int answerNum, int playerNum) {
  //
  //   thePlayers[playerNum].answerChosen = answerNum;
  //
  // }


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


/*
  score() {

    //score player 1
    int tempScore = 0;
   // print("============= score before ============");
   // print("player 1 score: " + thePlayers[0].playerRndScore.toString());
   // print("player 2 score: " + thePlayers[1].playerRndScore.toString());
   // print("player 3 score: " + thePlayers[2].playerRndScore.toString());
   // print("player 4 score: " + thePlayers[3].playerRndScore.toString());

    tempScore = correctAnswer(thePlayers[0].answerChosen);
    thePlayers[0].playerRndScore = thePlayers[0].playerRndScore + tempScore;
    tempScore = correctAnswer(thePlayers[1].answerChosen);
    thePlayers[1].playerRndScore = thePlayers[1].playerRndScore + tempScore;
    tempScore = correctAnswer(thePlayers[2].answerChosen);
    thePlayers[2].playerRndScore = thePlayers[2].playerRndScore + tempScore;
    tempScore = correctAnswer(thePlayers[3].answerChosen);
    thePlayers[3].playerRndScore = thePlayers[3].playerRndScore + tempScore;

  //  print("============= score after ============");
  //  print("player 1 score: " + thePlayers[0].playerRndScore.toString());
  //  print("player 2 score: " + thePlayers[1].playerRndScore.toString());
  //  print("player 3 score: " + thePlayers[2].playerRndScore.toString());
  //  print("player 4 score: " + thePlayers[3].playerRndScore.toString());

  }*/


  rollDice() {
    dice1 = rollADice();
    dice2 = rollADice();
    dice3 = rollADice();

  //  score();

   // print("============= roll dice ============");
   // print("d1: " + dice1.toString());
   // print("d2: " + dice2.toString());
   // print("d3: " + dice3.toString());
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

    // thePlayers[0].answerChosen = 0;
    // thePlayers[1].answerChosen = 0;
    // thePlayers[2].answerChosen = 0;
    // thePlayers[3].answerChosen = 0;
  }


/*  rollupScore() {
    thePlayers[0].playerScore = thePlayers[0].playerScore + thePlayers[0].playerRndScore;

    thePlayers[1].playerScore = thePlayers[1].playerScore + thePlayers[1].playerRndScore;

    thePlayers[2].playerScore = thePlayers[2].playerScore + thePlayers[2].playerRndScore;

    thePlayers[3].playerScore = thePlayers[3].playerScore + thePlayers[3].playerRndScore;

    thePlayers[0].playerRndScore = 0;

    thePlayers[1].playerRndScore = 0;

    thePlayers[2].playerRndScore = 0;

    thePlayers[3].playerRndScore = 0;
  }*/
}