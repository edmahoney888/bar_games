
import 'package:flutter/material.dart';
import 'dart:math';

import '../player.dart';
import '../player_in_game.dart';

class BuaGameInProgress {
  String defaultName = "Default Name";
  String defaultImage = 'assets/images/playeravatars/blankPlayer.jpg';
//  List<PlayerInGame> thePlayers = new List();
  PlayerInGame player1ID = new PlayerInGame();
  PlayerInGame player2ID = new PlayerInGame();
  PlayerInGame player3ID = new PlayerInGame();
  PlayerInGame player4ID = new PlayerInGame();

  int gameState = 0;

  int dice1 = 0;
  int dice2 = 0;
  int dice3 = 0;

//  List<BGPlayer> _players;
 // List<Round> _rounds;
 // List<Round> _roundsForGame;
 // List<Game> _games;
//  List<Answers> _answers;
  bool _reveal = false;
//  final dbHelper = DatabaseHelper.instance;

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
    _loadPlayers();
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
    PlayerInGame tempPlayer;

    player1ID.playerName = defaultName;
    player1ID.playerAvatar = defaultImage;
    player2ID.playerName = defaultName;
    player2ID.playerAvatar = defaultImage;
    player3ID.playerName = defaultName;
    player3ID.playerAvatar = defaultImage;
    player4ID.playerName = defaultName;
    player4ID.playerAvatar = defaultImage;

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

  int correctAnswer(int theAnswer)
  {
    int tempAnswer = 0;
    int tempAnswerVal = theAnswer - 1;

    if (dice1 == tempAnswerVal)
      tempAnswer = 1;

    if (dice2 == tempAnswerVal)
      tempAnswer = tempAnswer + 1;

    if (dice3 == tempAnswerVal)
      tempAnswer = tempAnswer + 1;

    return tempAnswer;
  }


  resetAnswers()
  {
//    _answers = null;
  }


  _loadPlayers() async {

    setupPlayers();   //loads default players

    player1ID.playerName = "joy";
    player1ID.playerAvatar = "assets/images/playeravatars/girl01.PNG";
    player2ID.playerName = "jane";
    player2ID.playerAvatar = "assets/images/playeravatars/girl02.PNG";
    player3ID.playerName = "jan";
    player3ID.playerAvatar = "assets/images/playeravatars/girl03.PNG";
    /*
    _players = new List();

    final loadedPlayers = await dbHelper.players();

    for (var n in loadedPlayers) {
      _players.add(n);
      if (selectedPlayer == null) {
        selectedPlayer = n;
      }
    }

     */
  }


  void _printSelectedPlayer() {
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
  }


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


  _loadRoundsForGame(int gameNum) async {
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
  }


  void _printSelectedRound() {
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
  }

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


  String getPlayerImage(int playerNum) {
    String tempImage = "";

    switch (playerNum) {
      case 1: {
        if (player1ID.hasPlayer() )
        {
          tempImage = player1ID.getImage();
        }
      }
      break;
      case 2: {
        if (player2ID.hasPlayer())
        {
          tempImage = player2ID.getImage();
        }
      }
      break;
      case 3: {
        if (player3ID.hasPlayer())
        {
          tempImage = player3ID.getImage();
        }
      }
      break;
      case 4: {
        if (player4ID.hasPlayer())
        {
          tempImage = player4ID.getImage();
        }
      }
      break;
      default: {
        tempImage = "";
      }
    }
    return tempImage;
  }


  String getPlayerName(int playerNum) {
    String tempName = "";

    switch (playerNum) {
      case 1: {

          tempName = player1ID.playerName;

      }
      break;
      case 2: {

          tempName = player2ID.playerName;

      }
      break;
      case 3: {

          tempName = player3ID.playerName;

      }
      break;
      case 4: {

          tempName = player4ID.playerName;

      }
      break;
      default: {
        tempName = "";
      }
    }
    return tempName;
  }


  String getPlayerImageFromID(playerID) {
    String tempImage = "";
    /*
    if (_players != null) {
      for (var n in _players) {
        if (n.id == playerID) {
          tempImage = n.image;
        }
      }
    }

     */
    return tempImage;
  }


  void _printSelectedGame() {
/*
    if (selectedGame != null) {
      print('===== selectedGame ==========');
      print('ID: ${selectedGame.id}');
      print('Name: ${selectedGame.name}');
      print('========================================');
    }
    else
      print('selected game is null');

 */
  }


  String getCurrentRoundImage() {
    String tempImage = "";
/*
    if (currentRound != null) {
      tempImage = currentRound.image;
    }

 */
    return tempImage;
  }


  setPlayerAnswer(int answerNum, int playerNum) {
    /*
    switch (playerNum) {
      case 1: {
        player1ID.setAnswer(answerNum);
      }
      break;
      case 2: {
        player2ID.setAnswer(answerNum);
      }
      break;
      case 3: {
        player3ID.setAnswer(answerNum);
      }
      break;
      case 4: {
        player4ID.setAnswer(answerNum);
      }
      break;
      default: {
      }
    }

     */
  }


  Color getPlayerColor(int playerNum) {
    Color tempColor  = colorUnselected;
/*
    switch (playerNum) {
      case 1: {
        if (player1ID.hasPlayer())
        {
          tempColor = player1ID.itemColor;
        }
      }
      break;
      case 2: {
        if (player2ID.hasPlayer())
        {
          tempColor = player2ID.itemColor;
        }
      }
      break;
      case 3: {
        if (player3ID.hasPlayer())
        {
          tempColor = player3ID.itemColor;
        }
      }
      break;
      case 4: {
        if (player4ID.hasPlayer())
        {
          tempColor = player4ID.itemColor;
        }
      }
      break;
      default: {
        tempColor = colorUnselected;
      }
    }

 */
    return tempColor;
  }


  Color getAnswerColor(int answerNum) {

    Color tempColor  = colorUnselected;
/*
    if (_reveal == false) {
      tempColor = colorAnswerHidden;
    }
    else {
      if (correctAnswer(answerNum) > 0) {
        switch (correctAnswer(answerNum)) {
          case 1:
            {
              tempColor = colorAnswerCorrect1;
            }
            break;
          case 2:
            {
              tempColor = colorAnswerCorrect2;
            }
            break;
          case 3:
            {
              tempColor = colorAnswerCorrect3;
            }
            break;
          default: {
            tempColor = colorAnswerIncorrect;
          }
        }
      }
      else
      {
        tempColor = colorAnswerIncorrect;
      }
    }

     */
    return tempColor;
  }


  loadFirstRound() {
    /*
    if (selectedRound != null) {
      currentRound = selectedRound;
      loadAnswers();
    }
    else {
      print("tlr - selected is null");
    }

     */
  }


  loadAnswers() {
    /*
    Answers tempAnswer;

    _answers = new List();
    if (currentRound != null) {
      tempAnswer = new Answers();
      tempAnswer.count = 0;
      tempAnswer.correct = false;
      _answers.add(tempAnswer);

      tempAnswer = new Answers();
      tempAnswer.count = 0;
      tempAnswer.correct = false;
      _answers.add(tempAnswer);

      tempAnswer = new Answers();
      tempAnswer.count = 0;
      tempAnswer.correct = false;
      _answers.add(tempAnswer);

      tempAnswer = new Answers();
      tempAnswer.count = 0;
      tempAnswer.correct = false;
      _answers.add(tempAnswer);

      tempAnswer = new Answers();
      tempAnswer.count = 0;
      tempAnswer.correct = false;
      _answers.add(tempAnswer);

      tempAnswer = new Answers();
      tempAnswer.count = 0;
      tempAnswer.correct = false;
      _answers.add(tempAnswer);
    }
    else {
      print("LA - currentRound is null");
    }

     */
  }

  loadPlayer(int playerPosition, int playerID)
  {
    /*
    Player tempPlayer  = getPlayerFromList(playerID);

    switch (playerPosition) {
      case 1: {
        player1ID.thePlayer = tempPlayer;
      }
      break;
      case 2: {
        player2ID.thePlayer = tempPlayer;
      }
      break;
      case 3: {
        player3ID.thePlayer = tempPlayer;
      }
      break;
      case 4: {
        player4ID.thePlayer = tempPlayer;
      }
      break;
      default: {
      }
    }

     */
  }

/*
  BGPlayer getPlayerFromList(int playerID)
  {
    BGPlayer tempPlayer;

    for (var n in _players) {
      if (n.id == playerID) {
        tempPlayer = n;
      }
    }


    return tempPlayer;
  }

 */


  showCorrectAnswers() {
    /*
    int tempanswer;
    _reveal = true;

    if (player1ID != null)
    {
      if (player1ID.getAnswer() != -1)
      {
        tempanswer = correctAnswer(player1ID.getAnswer());

        if (tempanswer > 0)
        {
          //     player1ID.itemColor = colorCorrect;
          player1ID.itemColor =  getAnswerColor(tempanswer);

        }
        else
        {
          player1ID.itemColor = colorIncorrect;
        }
      }
    }
    if (player2ID != null)
    {
      if (player2ID.getAnswer() != -1)
      {
        tempanswer = correctAnswer(player2ID.getAnswer());

        if (tempanswer > 0)
        {
          player2ID.itemColor = colorCorrect;
        }
        else
        {
          player2ID.itemColor = colorIncorrect;
        }
      }
    }
    if (player3ID != null)
    {
      if (player3ID.getAnswer() != -1)
      {
        tempanswer = correctAnswer(player3ID.getAnswer());

        if (tempanswer > 0)
        {
          player3ID.itemColor = colorCorrect;
        }
        else
        {
          player3ID.itemColor = colorIncorrect;
        }
      }
    }
    if (player4ID != null)
    {
      if (player4ID.getAnswer() != -1)
      {
        tempanswer = correctAnswer(player4ID.getAnswer());

        if (tempanswer > 0)
        {
          player4ID.itemColor = colorCorrect;
        }
        else
        {
          player4ID.itemColor = colorIncorrect;
        }
      }
    }

     */

  }

  resetPlayerAnswers()
  {
    /*
    _reveal = false;

    if (player1ID != null)
    {
      player1ID.setAnswer(-1);
      player1ID.itemColor = Colors.redAccent;
    }
    if (player2ID != null)
    {
      player2ID.setAnswer(-1);
      player2ID.itemColor = Colors.redAccent;
    }
    if (player3ID != null)
    {
      player3ID.setAnswer(-1);
      player3ID.itemColor = Colors.redAccent;
    }
    if (player4ID != null)
    {
      player4ID.setAnswer(-1);
      player4ID.itemColor = Colors.redAccent;
    }

     */
  }

  /*
  List<BGPlayer> getPlayerList() {
    return _players;
  }

   */

/*
  List<Game> getGameList() {
    return _games;
  }

 */


  setPlayer(BGPlayer thePlayer) {
    /*
    if (thePlayer != null) {
      if (player1ID.thePlayer == null)
        player1ID.thePlayer = thePlayer;
      else if (player2ID.thePlayer == null)
        player2ID.thePlayer = thePlayer;
      else if (player3ID.thePlayer == null)
        player3ID.thePlayer = thePlayer;
      else if (player4ID.thePlayer == null)
        player4ID.thePlayer = thePlayer;
    }

     */
  }

/*
  setGame(Game theGame) {
    selectedGame = theGame;
    _loadRoundsForGame(selectedGame.id);
    loadFirstRound();

    _printSelectedGame();
  }

 */

  rollDice() {
    dice1 = rollADice();
    dice2 = rollADice();
    dice3 = rollADice();

    print("============= roll dice ============");
    print("d1: " + dice1.toString());
    print("d2: " + dice2.toString());
    print("d3: " + dice3.toString());
  }

  int rollADice() {
    final _random = new Random();
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
  }

}