import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'bua_game_in_progress.dart';

class Constants{
  static const String FirstItem = 'Load Player';
  static const String SecondItem = 'Load Round';

  static const String FirstDiceFace = 'assets/images/buagame/crab.png';
  static const String SecondDiceFace = 'assets/images/buagame/fish.png';
  static const String ThirdDiceFace = 'assets/images/buagame/prawn.png';
  static const String FourthDiceFace = 'assets/images/buagame/tiger.png';
  static const String FifthDiceFace = 'assets/images/buagame/rooster.png';
  static const String SixthDiceFace = 'assets/images/buagame/gourd.png';


  static const List<String> diceFaces = <String>[
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


class buaGame extends StatefulWidget {
  @override
  _BuaGameState createState() => _BuaGameState();
}

class _BuaGameState extends State<buaGame> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  BuaGameInProgress theGame = new BuaGameInProgress();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
        appBar: AppBar(
        title: Text('Bar Games: Bua Game'
        ''),
        ),
      body: body(context),
    );

 //   return _BuaGameWidget();
  }

  RollDice() {
    theGame.rollDice();
  }

  int GetState() {
    return theGame.gameState;
  }

  int GetDiceValue(int whichDice) {
    return theGame.getDiceValue(whichDice);
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
            buaTiles(2),
            Row(
              children: <Widget>[
                diceWidget(1),
                diceWidget(2),
                diceWidget(3),
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
                              theGame.resetState();
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
              ]
          ),
          ]
      );
  }


  Widget landscape() {
    return Row(
        children: <Widget>[
          playerCol(),
          buaTiles(3),
          Column(
              children: <Widget>[
                diceWidget(1),
                diceWidget(2),
                diceWidget(3),
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
                            theGame.resetState();
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
              ]
          ),
        ]
    );

  }

  Widget buaTiles(int numColumns) {
    Color borderColor1= Colors.black;
    Color borderColor2= Colors.black;
    Color borderColor3= Colors.black;
    Color borderColor4= Colors.black;
    Color borderColor5= Colors.black;
    Color borderColor6= Colors.black;

    if (borderColor1 == null)
      borderColor1 = Colors.black;
    if (borderColor2 == null)
      borderColor2 = Colors.black;
    if (borderColor3 == null)
      borderColor3 = Colors.black;
    if (borderColor4 == null)
      borderColor4 = Colors.black;
    if (borderColor5 == null)
      borderColor5 = Colors.black;
    if (borderColor6 == null)
      borderColor6 = Colors.black;

    return Container(
      child:
          Expanded(
      child: GridView.count(
          crossAxisCount: numColumns,
          children: <Widget> [
            FittedBox(
              child:  Image(image: AssetImage('assets/images/buagame/crab.png')),
              fit: BoxFit.fill,
            ),
            FittedBox(
              child:  Image(image: AssetImage('assets/images/buagame/fish.png')),
              fit: BoxFit.fill,
            ),
            FittedBox(
              child:  Image(image: AssetImage('assets/images/buagame/prawn.png')),
              fit: BoxFit.fill,
            ),
            FittedBox(
              child:  Image(image: AssetImage('assets/images/buagame/tiger.png')),
              fit: BoxFit.fill,
            ),
            FittedBox(
              child:  Image(image: AssetImage('assets/images/buagame/rooster.png')),
              fit: BoxFit.fill,
            ),
            FittedBox(
              child:  Image(image: AssetImage('assets/images/buagame/gourd.png')),
              fit: BoxFit.fill,
            ),
         //   Image(image: AssetImage('assets/images/buagame/crab.png')),
         //   Image(image: AssetImage('assets/images/buagame/fish.png')),
         //   Image(image: AssetImage('assets/images/buagame/prawn.png')),
         //   Image(image: AssetImage('assets/images/buagame/tiger.png')),
         //   Image(image: AssetImage('assets/images/buagame/rooster.png')),
         //   Image(image: AssetImage('assets/images/buagame/gourd.png')),
          ]

      ),
          )
    );
  }

  String getButtonText() {
    String tempText;

    if (getRoundState() == 0)
      tempText = 'Roll';
    else if (getRoundState() == 1)
      tempText = 'Next';
    else
      tempText = 'OOOPS!';

    return tempText;
  }

  int getRoundState() {
    // get state from parent

    return theGame.gameState;
  }

  int getDiceValue(int whichDice) {
    //get dice value from parent
    return theGame.getDiceValue(whichDice);
  }


  Widget diceWidget(int whichDice) {

    int diceValue = getDiceValue(whichDice);
    String tempString = Constants.diceFaces[diceValue];
    print("which dice: " + whichDice.toString());
    print("diceValue: " + diceValue.toString());
    print("image Asset: " + tempString);

    return Container(
      width: 100.0,
      //       height: 50.0,
      child:
      Image.asset(tempString, fit: BoxFit.contain),
    );
  }

  Widget playerRow() {

    return Row(
      children: <Widget>[
        Image.asset(theGame.getPlayerImage(1), fit: BoxFit.contain),
        Image.asset(theGame.getPlayerImage(2), fit: BoxFit.contain),
        Image.asset(theGame.getPlayerImage(3), fit: BoxFit.contain),
        Image.asset(theGame.getPlayerImage(4), fit: BoxFit.contain),
    ],
    );
  }

  Widget playerCol() {

    return
      Container(
        width: 100.0,
        //       height: 50.0,
        child:
          Column(
            children: <Widget>[
              Image(image: AssetImage(theGame.getPlayerImage(1))),

    //    Image.asset(theGame.getPlayerImage(1), fit: BoxFit.contain),
              Image.asset(theGame.getPlayerImage(2), fit: BoxFit.contain),
              Image.asset(theGame.getPlayerImage(3), fit: BoxFit.contain),
              Image.asset(theGame.getPlayerImage(4), fit: BoxFit.contain),
            ],
          )
      );
  }


}