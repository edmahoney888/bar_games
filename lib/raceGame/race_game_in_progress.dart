
import 'package:flutter/material.dart';
import 'dart:math';

import '../player_in_game.dart';

class Constants{
  static const String FirstItem = 'Load Player';
  static const String SecondItem = 'Load Round';

  static const String ZeroRacer = 'assets/images/racegame/blankRacer.png';
  static const String FirstRacer = 'assets/images/racegame/bunny.gif';
  static const String SecondRacer = 'assets/images/racegame/elephant.gif';
  static const String ThirdRacer = 'assets/images/racegame/horse.gif';
  static const String FourthRacer = 'assets/images/racegame/monkey.gif';
  static const String FifthRacer = 'assets/images/racegame/ostrich.gif';
  static const String SixthRacer = 'assets/images/racegame/tiger.gif';


  static const List<String> racerImages = <String>[
    ZeroRacer,
    FirstRacer,
    SecondRacer,
    ThirdRacer,
    FourthRacer,
    FifthRacer,
    SixthRacer,
  ];

  static const String ZeroDiceFace = 'assets/images/common/blankdice.png';
  static const String FirstDiceFace = 'assets/images/common/dice1.png';
  static const String SecondDiceFace = 'assets/images/common/dice2.png';
  static const String ThirdDiceFace = 'assets/images/common/dice3.png';
  static const String FourthDiceFace = 'assets/images/common/dice4.png';
  static const String FifthDiceFace = 'assets/images/common/dice5.png';
  static const String SixthDiceFace = 'assets/images/common/dice6.png';


  static const List<String> diceFaces = <String>[
  ZeroDiceFace,
  FirstDiceFace,
  SecondDiceFace,
  ThirdDiceFace,
  FourthDiceFace,
  FifthDiceFace,
  SixthDiceFace,
  ];

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
  ];
}

class RaceGameInProgress {
  String defaultName = "Default Name";
  String defaultImage = 'assets/images/playeravatars/blankPlayer.jpg';
  List<PlayerInGame> thePlayers = [];
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
  List<Color> raceColors = [Colors.black,Colors.black,Colors.black,Colors.black,Colors.black,Colors.black,Colors.black];

  /*
  Game currentGame;
  Round currentRound;
  Player selectedPlayer;
  Round selectedRound;
  Game selectedGame;
  List<PlayerInGame> thePlayers = new List();
  PlayerInGame player1ID = new PlayerInGame();
  PlayerInGame player2ID = new PlayerInGame();
  PlayerInGame player3ID = new PlayerInGame();
  PlayerInGame player4ID = new PlayerInGame();
  PlayerInGame player5ID = new PlayerInGame();
  PlayerInGame player6ID = new PlayerInGame();

   */
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

/*
  List<int> horseFinish;
  List<Player> _players;
  List<Round> _rounds;
  List<Round> _roundsForGame;
  List<Game> _games;
  List<Answers> _answers;

 */
  bool _reveal = false;
//  final dbHelper = DatabaseHelper.instance;

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


  List<String> horses = <String>[
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

  RaceGameInProgress()
  {
  //  loadPlayers();
  //  _loadGames();
 //  _loadRounds();
  }

  int getNumOfPlayers()
  {
    return thePlayers.length;
  }

  loadPlayers(List<PlayerInGame> thePlayers)  {
    this.thePlayers = thePlayers;
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

/*
  setupPlayers()
  {
    PlayerInGame tempPlayer;

    if (_players != null) {
      for (var n in _players) {
        tempPlayer = new PlayerInGame();
        tempPlayer.thePlayer = n;
        thePlayers.add(tempPlayer);
      }
    }
  }

 */

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


  int getImageNumber(int rowIndex, int colIndex) {
//    int tempInt = 0;

    // horse 1 is ( 0 * numcolumns) -> (1 * numcolumns) - 1
  //  if (rowIndex < colIndex)
      if (rowIndex == horse1 ) {
        if (colIndex == theRace[horse1])
          return horse1;
        else
          return horse0;
      }

    // horse 2 is ( 1 * numcolumns) -> (2 * numcolumns) - 1
 //   if (rowIndex < (2 * colIndex))
      if (rowIndex == horse2 ) {
        if (colIndex == theRace[horse2])
          return horse2;
        else
          return horse0;
      }

    // horse 3 is ( 2 * numcolumns) -> (3 * numcolumns) - 1
  //  if (rowIndex < (3* colIndex))
      if (rowIndex == horse3 ) {
        if (colIndex == theRace[horse3])
          return horse3;
        else
          return horse0;
      }

    // horse 4 is ( 3 * numcolumns) -> (4 * numcolumns) - 1
 //   if (rowIndex < (4 * colIndex))
      if (rowIndex == horse4 ) {
        if (colIndex == theRace[horse4])
          return horse4;
        else
          return horse0;
      }

    // horse 5 is ( 4 * numcolumns) -> (5 * numcolumns) - 1
 //   if (rowIndex < (5 * colIndex))
      if (rowIndex == horse5 ) {
        if (colIndex == theRace[horse5])
          return horse5;
        else
          return horse0;
      }

    // horse 6 is ( 5 * numcolumns) -> (6 * numcolumns) - 1
 //   if (rowIndex < (6 * colIndex))
      if (rowIndex == horse6 ) {
        if (colIndex == theRace[horse6])
          return horse6;
        else
          return horse0;
      }

    return horse0;
  }


  String getRacerImage(rowIndex, colIndex)
  {
    String tempStr;

    int imgNum = getImageNumber(rowIndex+1, colIndex);

    if (imgNum == -1)
      tempStr = Constants.racerImages[0];
    else
      tempStr = Constants.racerImages[imgNum];

//    print('ID: ${imgNum}');
//    print('Image: ${tempStr}');

    return tempStr;
  }

/*
  String getHorseImageStr(int horseNum)
  {
    String tempStr;

    tempStr = Constants.racerImages[horseNum];

    print('horseNum: ${horseNum}');
    print('Image: ${tempStr}');

    return tempStr;
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

/*
  bool playerGotCorrectAnswer(int playerNum)
  {
    bool tempAnswer = false;
    int whichAnswer;

    if (thePlayers.elementAt(playerNum).answerChosen > -1)
    {
      whichAnswer = thePlayers[playerNum].getAnswer();
      tempAnswer = _answers[whichAnswer].correct;
    }
    return tempAnswer;
  }

 */

  /*
  bool correctAnswer(int theAnswer)
  {
    bool tempAnswer = false;
    int tempAnswerVal = theAnswer - 1;

    if (dice1 == tempAnswerVal)
      tempAnswer = true;

    if (dice2 == tempAnswerVal)
      tempAnswer = true;

    if (dice3 == tempAnswerVal)
      tempAnswer = true;

    return tempAnswer;
  }

   */


  resetAnswers()
  {
  //  _answers = null;
  }

  Color getAnswerColor(int answerNum) {

    Color tempColor  = colorUnselected;

    return tempColor;
  }

  setPlayerAnswer(int answerNum, int playerNum) {

    thePlayers[playerNum].answerChosen = answerNum;

  }


/*
  void _printSelectedPlayer() {

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
  }

 */

/*
  _loadGames() async {
    _games = new List();
    final loadedGames = await dbHelper.games();

    for (var n in loadedGames) {
      _games.add(n);
      if (selectedGame == null) {
        selectedGame = n;
      }
    }
  }

 */


/*
  _loadRounds() async {
    _rounds = new List();
    final loadedRounds = await dbHelper.rounds();

    for (var n in loadedRounds) {
      _rounds.add(n);
      if (selectedRound == null) {
        selectedRound = n;
      }
    }
  }

 */

/*
  _loadRoundsForGame(int gameNum) async {
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
  }

 */

/*
  void _printSelectedRound() {

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
  }

 */

  /*
  nextRound()  {

    horse1 = 0;
    horse2 = 0;
    horse3 = 0;
    horse4 = 0;
    horse5 = 0;
    horse6 = 0;


    player1ID.itemColor = Colors.redAccent;

    player2ID.itemColor = Colors.redAccent;

    player3ID.itemColor = Colors.redAccent;

    player4ID.itemColor = Colors.redAccent;

    player5ID.itemColor = Colors.redAccent;

    player6ID.itemColor = Colors.redAccent;

    // bool foundRound = false;
    // resetPlayerAnswers();

    /*
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
    }*/
    horses.shuffle();

    horse1Finished = false;
    horse2Finished = false;
    horse3Finished = false;
    horse4Finished = false;
    horse5Finished = false;
    horse6Finished = false;

    firstPlaceFinished = false;
    secondPlaceFinished = false;
    thirdPlaceFinished = false;

    return;
  }

   */


  Image getPlayerImage(int playerNum) {
    Image tempImage;

    tempImage = thePlayers[playerNum].playerAvatar;

    return tempImage;
  }
  /*
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
        tempImage = null;
      }
    }
    return tempImage;
  }

   */

/*
  String getPlayerImageFromID(playerID) {
    String tempImage;
    if (_players != null) {
      for (var n in _players) {
        if (n.id == playerID) {
          tempImage = n.image;
        }
      }
    }
    return tempImage;
  }

 */

/*
  void _printSelectedGame() {

    if (selectedGame != null) {
      print('===== selectedGame ==========');
      print('ID: ${selectedGame.id}');
      print('Name: ${selectedGame.name}');
      print('========================================');
    }
    else
      print('selected game is null');
  }

 */

/*
  String getCurrentRoundImage() {
    String tempImage;

    if (currentRound != null) {
      tempImage = currentRound.image;
    }
    return tempImage;
  }

 */

/*
  setPlayerAnswer(int answerNum, int playerNum) {
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
        print('===== Player Answer ==========');
        print('player num: ${playerNum}');
        print('answer num: ${answerNum}');
      }
      break;
      case 5: {
        player5ID.setAnswer(answerNum);
      }
      break;
      case 6: {
        player6ID.setAnswer(answerNum);
      }
      break;

      default: {
      }
    }
  }

 */

/*
  Color getPlayerColor(int playerNum) {
    Color tempColor  = colorUnselected;

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
      case 5: {
        if (player5ID.hasPlayer())
        {
          tempColor = player5ID.itemColor;
        }
      }
      break;
      case 6: {
        if (player6ID.hasPlayer())
        {
          tempColor = player6ID.itemColor;
        }
      }
      break;

      default: {
        tempColor = colorUnselected;
      }
    }
    return tempColor;
  }

 */

/*
  Color getAnswerColor(int answerNum) {
    Color tempColor  = colorUnselected;

    if (_reveal == false) {
      tempColor = colorAnswerHidden;
    }
    else {
      if (correctAnswer(answerNum)) {
        tempColor = colorAnswerCorrect;
      }
      else
      {
        tempColor = colorAnswerIncorrect;
      }
    }
    return tempColor;
  }

 */

/*
  loadFirstRound() {
    if (selectedRound != null) {
      currentRound = selectedRound;
      loadAnswers();
    }
    else {
      print("tlr - selected is null");
    }
  }

 */

/*
  loadAnswers() {
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
  }

 */

  /*
  loadPlayer(int playerPosition, int playerID)
  {
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
      case 5: {
        player5ID.thePlayer = tempPlayer;
      }
      break;
      case 6: {
        player6ID.thePlayer = tempPlayer;
      }
      break;
      default: {
      }
    }
  }

   */

/*
  Player getPlayerFromList(int playerID)
  {
    Player tempPlayer;

    for (var n in _players) {
      if (n.id == playerID) {
        tempPlayer = n;
      }
    }
    return tempPlayer;
  }

 */

/*
  bool showCorrectAnswers() {
    bool tempanswer;
    bool raceFinish = false;
    _reveal = true;

    switch(dice1) {
      case 0: {
        horse1++;
        print("horse 1 - dice 1: " + horse1.toString() + " numcolumns: " + numColumns.toString());

      }
      break;
      case 1: {
        horse2++;
        print("horse 2 - dice 1: " + horse2.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 2: {
        horse3++;
        print("horse 3 - dice 1: " + horse3.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 3: {
        horse4++;
        print("horse 4 - dice 1: " + horse4.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 4: {
        horse5++;
        print("horse 5 - dice 1: " + horse5.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 5: {
        horse6++;
        print("horse 6 - dice 1: " + horse6.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      default: {
      }
    }
    switch(dice2) {
      case 0: {
        horse1++;
        print("horse 1 - dice 2: " + horse1.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 1: {
        horse2++;
        print("horse 2 - dice 2: " + horse2.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 2: {
        horse3++;
        print("horse 3 - dice 2: " + horse3.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 3: {
        horse4++;
        print("horse 4 - dice 2: " + horse4.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 4: {
        horse5++;
        print("horse 5 - dice 2: " + horse5.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 5: {
        horse6++;
        print("horse 6 - dice 2: " + horse6.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      default: {
      }
    }
    switch(dice3) {
      case 0: {
        horse1++;
        print("horse 1 - dice 3: " + horse1.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 1: {
        horse2++;
        print("horse 2 - dice 3: " + horse2.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 2: {
        horse3++;
        print("horse 3 - dice 3: " + horse3.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 3: {
        horse4++;
        print("horse 4 - dice 3: " + horse4.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 4: {
        horse5++;
        print("horse 5 - dice 3: " + horse5.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      case 5: {
        horse6++;
        print("horse 6 - dice 3: " + horse6.toString() + " numcolumns: " + numColumns.toString());
      }
      break;
      default: {
      }
    }

    horseFinish = new List();

    if (horse1 > 10 && !horse1Finished) {
      horseFinishThisRound(1);
      horse1Finished = true;

      //     player1ID.itemColor = Colors.amber;
    }
    if (horse2 > 10 && !horse2Finished) {
      horseFinishThisRound(2);
      horse2Finished = true;
//      player2ID.itemColor = Colors.amber;
    }
    if (horse3 > 10 && !horse3Finished) {
      horseFinishThisRound(3);
      horse3Finished = true;
      //    player3ID.itemColor = Colors.amber;
    }
    if (horse4 > 10 && !horse4Finished) {
      horseFinishThisRound(4);
      horse4Finished = true;
      //     player4ID.itemColor = Colors.amber;
    }
    if (horse5 > 10 && !horse5Finished) {
      horseFinishThisRound(5);
      horse5Finished = true;
      //     player5ID.itemColor = Colors.amber;
    }
    if (horse6 > 10 && !horse6Finished) {
      horseFinishThisRound(6);
      horse6Finished = true;
      //     player6ID.itemColor = Colors.amber;
    }

    racePlace();

    return allHorseFinished();
  }

 */

  /*
  resetPlayerAnswers()
  {
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
    if (player5ID != null)
    {
      player5ID.setAnswer(-1);
      player5ID.itemColor = Colors.redAccent;
    }

    if (player6ID != null)
    {
      player6ID.setAnswer(-1);
      player6ID.itemColor = Colors.redAccent;
    }

  }

   */

  /*
  List<Player> getPlayerList() {
    return _players;
  }

   */

/*
  List<Game> getGameList() {
    return _games;
  }

 */

/*
  setPlayer(Player thePlayer) {
    if (thePlayer != null) {
      if (player1ID.thePlayer == null)
        player1ID.thePlayer = thePlayer;
      else if (player2ID.thePlayer == null)
        player2ID.thePlayer = thePlayer;
      else if (player3ID.thePlayer == null)
        player3ID.thePlayer = thePlayer;
      else if (player4ID.thePlayer == null)
        player4ID.thePlayer = thePlayer;
      else if (player5ID.thePlayer == null)
        player5ID.thePlayer = thePlayer;
      else if (player6ID.thePlayer == null)
        player6ID.thePlayer = thePlayer;
    }
  }

 */

/*
  setGame(Game theGame) {
    selectedGame = theGame;
    _loadRoundsForGame(selectedGame.id);
    loadFirstRound();

    _printSelectedGame();
  }

 */


  awardFinishes() {
    // score player 1

    thePlayers[0].playerScore = thePlayers[0].playerScore + finishes[thePlayers[0].answerChosen];
    thePlayers[1].playerScore = thePlayers[1].playerScore + finishes[thePlayers[1].answerChosen];
    thePlayers[2].playerScore = thePlayers[2].playerScore + finishes[thePlayers[2].answerChosen];
    thePlayers[3].playerScore = thePlayers[3].playerScore + finishes[thePlayers[3].answerChosen];
  }


  checkAllFinished() {
    bool tempAllFinished = true;

      for (int counter = 1; counter <= theRace.length-1; counter++)
      {
        if (theRace[counter] < numRaceSteps)
          tempAllFinished = false;
      }

      if (tempAllFinished)
        gameState = 2;
  }



  checkWinners() {

    if (firstPlace == false)
      {
        for (int counter = 1; counter <= theRace.length-1; counter++)
          {
 //           print("check first place - counter: " + counter.toString());
 //           print("theRace: " + theRace[counter].toString());
 //           print("finishes: " + finishes[counter].toString());
 //           print("numRaceSteps: " + numRaceSteps.toString());
            if ((theRace[counter] >= numRaceSteps) && ( finishes[counter] == 0)) {
              finishes[counter] = 3;
              raceColors[counter] = firstPlaceColor;
 //             print("===finishedfirst!: " + counter.toString());
              firstPlace = true;
            }
          }

      }
    else if (secondPlace == false)
      {
        for (int counter = 1; counter <= theRace.length-1; counter++)
        {
//          print("check second place - counter: " + counter.toString());
//          print("theRace: " + theRace[counter].toString());
//          print("finishes: " + finishes[counter].toString());
 //         print("numRaceSteps: " + numRaceSteps.toString());
          if ((theRace[counter] >= numRaceSteps) && ( finishes[counter] == 0)) {
            finishes[counter] = 2;
            raceColors[counter] = secondPlaceColor;
 //           print("===finished second!: " + numRaceSteps.toString());
            secondPlace = true;
          }
        }

      }
    else if (thirdPlace == false)
      {
        for (int counter = 1; counter <= theRace.length-1; counter++)
        {
//          print("check third place - counter: " + counter.toString());
//          print("theRace: " + theRace[counter].toString());
//          print("finishes: " + finishes[counter].toString());
//          print("numRaceSteps: " + numRaceSteps.toString());
          if ((theRace[counter] >= numRaceSteps) && ( finishes[counter] == 0)) {
            finishes[counter] = 1;
            raceColors[counter] = thirdPlaceColor;
 //           print("===finished third!: " + numRaceSteps.toString());
            thirdPlace = true;
          }
        }

      }
    else
      {

      }

//    print("==== finishes =======");
//    print("finishes 1: " + finishes[1].toString() );
//    print("finishes 2: " + finishes[2].toString() );
//    print("finishes 3: " + finishes[3].toString() );
//    print("finishes 4: " + finishes[4].toString() );
//    print("finishes 5: " + finishes[5].toString() );
 //   print("finishes 6: " + finishes[6].toString() );

 //   print("==== race colors =======");
//    print("race color 1: " + raceColors[1].toString() );
//    print("race color 2: " + raceColors[2].toString() );
//    print("race color 3: " + raceColors[3].toString() );
 //   print("race color 4: " + raceColors[4].toString() );
//    print("race color 5: " + raceColors[5].toString() );
 //   print("race color 6: " + raceColors[6].toString() );
  }

  score() {
    // score first dice
    theRace[dice1+1] = theRace[dice1+1] + 1;

    //score second dice
    theRace[dice2+1] = theRace[dice2+1] + 1;

    //score third dice
    theRace[dice3+1] = theRace[dice3+1] + 1;
  }

  rollDice() {
    dice1 = rollADice();
    dice2 = rollADice();
    dice3 = rollADice();

    score();
    checkWinners();
    checkAllFinished();

//    print("============= roll dice ============");
//    print("d1: " + dice1.toString());
//    print("d2: " + dice2.toString());
//    print("d3: " + dice3.toString());

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

    if (thePlayers != null) {
      thePlayers[0].answerChosen = 0;
      thePlayers[1].answerChosen = 0;
      thePlayers[2].answerChosen = 0;
      thePlayers[3].answerChosen = 0;
    }

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
  }

  /*
  rollDice() {
    final _random = new Random();
    dice1 = _random.nextInt(6);
    dice2 = _random.nextInt(6);
    dice3 = _random.nextInt(6);
    print("============= roll dice ============");
    print("d1: " + dice1.toString());
    print("d2: " + dice2.toString());
    print("d3: " + dice3.toString());
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

   */

  /*
  racePlace()
  {
    int playerAnswer;

    if (horseFinish.length > 0) {
      if (firstPlaceFinished == false) {
        playerAnswer = player1ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player1ID.itemColor = firstPlace;
        }
        playerAnswer = player2ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player2ID.itemColor = firstPlace;
        }
        playerAnswer = player3ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player3ID.itemColor = firstPlace;
        }
        playerAnswer = player4ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player4ID.itemColor = firstPlace;
        }
        firstPlaceFinished = true;
      }
      else if (secondPlaceFinished == false) {
        playerAnswer = player1ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player1ID.itemColor = secondPlace;
        }
        playerAnswer = player2ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player2ID.itemColor = secondPlace;
        }
        playerAnswer = player3ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player3ID.itemColor = secondPlace;
        }
        playerAnswer = player4ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player4ID.itemColor = secondPlace;
        }
        secondPlaceFinished = true;
      }
      else if (thirdPlaceFinished == false) {
        playerAnswer = player1ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player1ID.itemColor = thirdPlace;
        }
        playerAnswer = player2ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player2ID.itemColor = thirdPlace;
        }
        playerAnswer = player3ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player3ID.itemColor = thirdPlace;
        }
        playerAnswer = player4ID.answerChosen;
        if (horseFinish.contains(playerAnswer)) {
          player4ID.itemColor = thirdPlace;
        }

        thirdPlaceFinished = true;
      }
    }
  }

   */

  /*
  horseFinishThisRound(int horseNum)
  {
    horseFinish.add(horseNum);

  }

   */

  /*
  bool allHorseFinished() {
    bool raceFinish = false;

    if (horse1Finished &&  horse2Finished && horse3Finished && horse4Finished && horse5Finished && horse6Finished)
      raceFinish = true;

    return raceFinish;
  }

   */
}