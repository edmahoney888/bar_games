import 'dart:async';

import 'package:games_with_friends/player/player_in_game.dart';
import 'package:games_with_friends/player/player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:provider/provider.dart';

import '../bar_constants.dart';
import 'money_game_in_progress.dart';

class MoneyPage extends StatefulWidget {
  @override
  _MoneyPageState createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  StreamController<int> selected = StreamController<int>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  FortuneGameInProgress theGame = FortuneGameInProgress();

  FortuneItemStyle oddStyle = FortuneItemStyle(
    color: Colors.red, // <-- custom circle slice fill color
    borderColor: Colors.white, // <-- custom circle slice stroke color
    borderWidth: 3, // <-- custom circle slice stroke width
  );
  FortuneItemStyle evenStyle = FortuneItemStyle(
    color: Colors.black, // <-- custom circle slice fill color
    borderColor: Colors.white, // <-- custom circle slice stroke color
    borderWidth: 3, // <-- custom circle slice stroke width
  );
  FortuneItemStyle wStyle20 = FortuneItemStyle(
    color: Colors.green, // <-- custom circle slice fill color
    borderColor: Colors.white, // <-- custom circle slice stroke color
    borderWidth: 3, // <-- custom circle slice stroke width
  );
  FortuneItemStyle wStyle50 = FortuneItemStyle(
    color: Colors.blueAccent, // <-- custom circle slice fill color
    borderColor: Colors.white, // <-- custom circle slice stroke color
    borderWidth: 3, // <-- custom circle slice stroke width
  );
  FortuneItemStyle wStyle100 = FortuneItemStyle(
    color: Colors.redAccent, // <-- custom circle slice fill color
    borderColor: Colors.white, // <-- custom circle slice stroke color
    borderWidth: 3, // <-- custom circle slice stroke width
  );
  FortuneItemStyle wStyle500 = FortuneItemStyle(
    color: Colors.purpleAccent, // <-- custom circle slice fill color
    borderColor: Colors.white, // <-- custom circle slice stroke color
    borderWidth: 3, // <-- custom circle slice stroke width
  );
  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Games with Friends: Money Wheel'
            ''),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portrait(context);
    } else {
      return landscape(context);
    }
  }

  Widget portrait(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        flex: 1,
        child: playerRow(),
      ),
      Expanded(
        flex: 1,
        child: bettingFieldPT(3),
      ),
      Expanded(
        flex: 1,
        child: fWheelPT(context),
      ),
    ]);
  }

  Widget landscape(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        flex: 1,
        child: playerCol(),
      ),
      // Expanded(
      //   flex: 2,
      //   child: bettingFieldLS(3),
      // ),
      Expanded(
        flex: 2,
        child: fWheelLS(context),
      ),
    ]);
  }

  @override
  Widget fWheelPT(BuildContext context) {
    final items = <String>[
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
    ];

    int returnval = 0;

    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            returnval = Fortune.randomInt(0, items.length);
            print("====> random val1:" + returnval.toString());
            theGame.result = returnval;

            selected.add(
              returnval,
            );
          });
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  FortuneItem(child: Text('1'), style: oddStyle),
                  FortuneItem(child: Text('2'), style: evenStyle),
                  FortuneItem(child: Text('3'), style: oddStyle),
                  FortuneItem(child: Text('4'), style: evenStyle),
                  FortuneItem(child: Text('5'), style: oddStyle),
                  FortuneItem(child: Text('6'), style: evenStyle),
                  FortuneItem(child: Text('7'), style: oddStyle),
                  FortuneItem(child: Text('8'), style: evenStyle),
                  FortuneItem(child: Text('9'), style: oddStyle),
                  FortuneItem(child: Text('10'), style: evenStyle),
                  FortuneItem(child: Text('11'), style: oddStyle),
                  FortuneItem(child: Text('12'), style: evenStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget fWheelLS(BuildContext context) {
    final items = <String>[
      '100',
      '20',
      '50',
      '20',
      '100',
      '20',
      '50',
      '20',
      '50',
      '20',
      '500',
      '20',
      '50',
      '20',
      '100',
      '20',
      '50',
      '20',
      '50',
      '20',
    ];

    int returnval = 0;

    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {

            returnval = Fortune.randomInt(0, items.length);
            print("====> random val2:" + returnval.toString());
            theGame.result = returnval;

            selected.add(
              returnval,
            );

            Provider.of<BarPlayers>(context, listen: false).addRndScore(0, theGame.winNumber(0));
            Provider.of<BarPlayers>(context, listen: false).addRndScore(1, theGame.winNumber(1));
            Provider.of<BarPlayers>(context, listen: false).addRndScore(2, theGame.winNumber(2));
            Provider.of<BarPlayers>(context, listen: false).addRndScore(3, theGame.winNumber(3));
            Provider.of<BarPlayers>(context, listen: false).addRndScore(0, theGame.winBlack(0));
            Provider.of<BarPlayers>(context, listen: false).addRndScore(1, theGame.winBlack(1));
            Provider.of<BarPlayers>(context, listen: false).addRndScore(2, theGame.winBlack(2));
            Provider.of<BarPlayers>(context, listen: false).addRndScore(3, theGame.winBlack(3));
            Provider.of<BarPlayers>(context, listen: false).addRndScore(0, theGame.winRed(0));
            Provider.of<BarPlayers>(context, listen: false).addRndScore(1, theGame.winRed(1));
            Provider.of<BarPlayers>(context, listen: false).addRndScore(2, theGame.winRed(2));
            Provider.of<BarPlayers>(context, listen: false).addRndScore(3, theGame.winRed(3));

            theGame.clearWheel();
          });
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  FortuneItem(child: Text('0'), style: evenStyle),
                  FortuneItem(child: Text('20'), style: wStyle20),
                  FortuneItem(child: Text('50'), style: wStyle50),
                  FortuneItem(child: Text('20'), style: wStyle20),
                  FortuneItem(child: Text('100'), style: wStyle100),
                  FortuneItem(child: Text('20'), style: wStyle20),
                  FortuneItem(child: Text('50'), style: wStyle50),
                  FortuneItem(child: Text('20'), style: wStyle20),
                  FortuneItem(child: Text('50'), style: wStyle50),
                  FortuneItem(child: Text('20'), style: wStyle20),
                  FortuneItem(child: Text('500'), style: wStyle500),
                  FortuneItem(child: Text('20'), style: wStyle20),
                  FortuneItem(child: Text('50'), style: wStyle50),
                  FortuneItem(child: Text('20'), style: wStyle20),
                  FortuneItem(child: Text('100'), style: wStyle100),
                  FortuneItem(child: Text('20'), style: wStyle20),
                  FortuneItem(child: Text('50'), style: wStyle50),
                  FortuneItem(child: Text('20'), style: wStyle20),
                  FortuneItem(child: Text('50'), style: wStyle50),
                  FortuneItem(child: Text('20'), style: wStyle20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget bettingFieldLS(int numColumns) {

    return
      //Expanded(
    //  flex: 1,
     // child:
    Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBetFieldWithDropZone(0, Colors.red),
                    _buildBetFieldWithDropZone(1, Colors.black),
                    _buildBetFieldWithDropZone(2, Colors.red),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBetFieldWithDropZone(3, Colors.black),
                    _buildBetFieldWithDropZone(4, Colors.red),
                    _buildBetFieldWithDropZone(5, Colors.black),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBetFieldWithDropZone(6, Colors.red),
                    _buildBetFieldWithDropZone(7, Colors.black),
                    _buildBetFieldWithDropZone(8, Colors.red),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBetFieldWithDropZone(9, Colors.black),
                    _buildBetFieldWithDropZone(10, Colors.red),
                    _buildBetFieldWithDropZone(11, Colors.black),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildRedBetFieldWithDropZone(Colors.red),
                    _buildBlackBetFieldWithDropZone(Colors.black),

                  ]),
            ),
          ]
      );
 //   );


      // GridView.count(
      //     crossAxisCount: 3,
      //     crossAxisSpacing: 0.0,
      //     mainAxisSpacing: 0.0,
      //     children: [
      //       _buildBetFieldWithDropZone(0, Colors.red),
      //       _buildBetFieldWithDropZone(1, Colors.black),
      //       _buildBetFieldWithDropZone(2, Colors.red),
      //       _buildBetFieldWithDropZone(3, Colors.black),
      //       _buildBetFieldWithDropZone(4, Colors.red),
      //       _buildBetFieldWithDropZone(5, Colors.black),
      //       _buildBetFieldWithDropZone(6, Colors.red),
      //       _buildBetFieldWithDropZone(7, Colors.black),
      //       _buildBetFieldWithDropZone(8, Colors.red),
      //       _buildBetFieldWithDropZone(9, Colors.black),
      //       _buildBetFieldWithDropZone(10, Colors.red),
      //       _buildBetFieldWithDropZone(11, Colors.black),
      //     ]);
  }

  // Widget bettingFieldLS(int numColumns) {
  //
  //   return Expanded(
  //     flex: 1,
  //     child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Expanded(
  //             flex: 1,
  //             child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   _buildBetFieldWithDropZone(1, Colors.red),
  //                   _buildBetFieldWithDropZone(2, Colors.black),
  //                   _buildBetFieldWithDropZone(3, Colors.red),
  //                 ]),
  //           ),
  //           Expanded(
  //             flex: 1,
  //             child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   _buildBetFieldWithDropZone(4, Colors.black),
  //                   _buildBetFieldWithDropZone(5, Colors.red),
  //                   _buildBetFieldWithDropZone(6, Colors.black),
  //                 ]),
  //           ),
  //           Expanded(
  //             flex: 1,
  //             child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   _buildBetFieldWithDropZone(7, Colors.red),
  //                   _buildBetFieldWithDropZone(8, Colors.black),
  //                   _buildBetFieldWithDropZone(9, Colors.red),
  //                 ]),
  //           ),
  //           Expanded(
  //             flex: 1,
  //             child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   _buildBetFieldWithDropZone(10, Colors.black),
  //                   _buildBetFieldWithDropZone(11, Colors.red),
  //                   _buildBetFieldWithDropZone(12, Colors.black),
  //                 ]),
  //           ),
  //         ]
  //     ),
  //   );
  // }

  Widget bettingFieldPT(int numColumns) {
    return Expanded(
      flex: 1,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBetFieldWithDropZone(1, Colors.red),
                    _buildBetFieldWithDropZone(2, Colors.black),
                    _buildBetFieldWithDropZone(3, Colors.red),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBetFieldWithDropZone(4, Colors.black),
                    _buildBetFieldWithDropZone(5, Colors.red),
                    _buildBetFieldWithDropZone(6, Colors.black),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBetFieldWithDropZone(7, Colors.red),
                    _buildBetFieldWithDropZone(8, Colors.black),
                    _buildBetFieldWithDropZone(9, Colors.red),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBetFieldWithDropZone(10, Colors.black),
                    _buildBetFieldWithDropZone(11, Colors.red),
                    _buildBetFieldWithDropZone(12, Colors.black),
                  ]),
            ),
          ]),
    );
  }

  Widget _buildBetFieldWithDropZone(int id, Color fieldColor) {
    int wheelId = id;
    int wheelNum = id + 1;
    Color borderColor1 = Colors.blue;

    return Expanded(
      flex: 1,
      child: DragTarget<PlayerInGame>(
        builder: (context, candidateItems, rejectedItems) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor1, width: 6),
              color: fieldColor,
            ),
            child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  fixNum(wheelNum),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          );
        },
        onAccept: (player) {
          setState(() {
            // need to set bet here
            theGame.placeNumBet(wheelId, player.uid);
            Provider.of<BarPlayers>(context, listen: false).addRndScore(player.uid, -1);
            borderColor1 = Colors.blue;
          });
        },
        onWillAccept: (player) {
          if (player != null) {}
          borderColor1 = Colors.yellow;
          return true;
        },
        onLeave: (player) {
          borderColor1 = Colors.blue;
          return;
        },
      ),
    );
  }

  String fixNum(int numToFix) {
    String tempString = numToFix.toString();

    if (numToFix < 10)
      {
        tempString = '0' + tempString;
      }

    return tempString;
  }


  Widget _buildRedBetFieldWithDropZone(Color fieldColor) {
    Color borderColor1 = Colors.blue;

    return Expanded(
      flex: 1,
      child: DragTarget<PlayerInGame>(
        builder: (context, candidateItems, rejectedItems) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor1, width: 6),
              color: fieldColor,
            ),
            child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  "  Red  ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          );
        },
        onAccept: (player) {
          setState(() {
            // need to set bet here
            theGame.placeBetRed(player.uid);
            Provider.of<BarPlayers>(context, listen: false).addRndScore(player.uid, -1);
            borderColor1 = Colors.blue;
          });
        },
        onWillAccept: (player) {
          if (player != null) {}
          borderColor1 = Colors.yellow;
          return true;
        },
        onLeave: (player) {
          borderColor1 = Colors.blue;
          return;
        },
      ),
    );
  }

  Widget _buildBlackBetFieldWithDropZone(Color fieldColor) {
    Color borderColor1 = Colors.blue;

    return Expanded(
      flex: 1,
      child: DragTarget<PlayerInGame>(
        builder: (context, candidateItems, rejectedItems) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor1, width: 6),
              color: fieldColor,
            ),
            child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  " Black",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          );
        },
        onAccept: (player) {
          setState(() {
            // need to set bet here
            theGame.placeBetBlack(player.uid);
            Provider.of<BarPlayers>(context, listen: false).addRndScore(player.uid, -1);
            borderColor1 = Colors.blue;
          });
        },
        onWillAccept: (player) {
          if (player != null) {}
          borderColor1 = Colors.yellow;
          return true;
        },
        onLeave: (player) {
          borderColor1 = Colors.blue;
          return;
        },
      ),
    );
  }

  Widget playerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        playerWidget(
          playerNum: 0,
          context: context,
          tileFaces: Constants.buaDiceFaces,
        ),
        playerWidget(
          playerNum: 1,
          context: context,
          tileFaces: Constants.buaDiceFaces,
        ),
        playerWidget(
          playerNum: 2,
          context: context,
          tileFaces: Constants.buaDiceFaces,
        ),
        playerWidget(
          playerNum: 3,
          context: context,
          tileFaces: Constants.buaDiceFaces,
        ),
      ],
    );
  }

  Widget playerCol() {
    return SizedBox(
        width: 50.0,
        //  height: 75.0,
        child: Column(
          children: <Widget>[
            playerWidget(
              playerNum: 0,
              context: context,
              tileFaces: Constants.buaDiceFaces,
            ),
            playerWidget(
              playerNum: 1,
              context: context,
              tileFaces: Constants.buaDiceFaces,
            ),
            playerWidget(
              playerNum: 2,
              context: context,
              tileFaces: Constants.buaDiceFaces,
            ),
            playerWidget(
              playerNum: 3,
              context: context,
              tileFaces: Constants.buaDiceFaces,
            ),
          ],
        ));
  }
}
