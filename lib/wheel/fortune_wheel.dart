

import 'dart:async';

import 'package:bar_games/player/player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import '../bar_constants.dart';


class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wheel of Luck',
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  StreamController<int> selected = StreamController<int>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  FortuneItemStyle oddStyle =  FortuneItemStyle(
    color: Colors.red, // <-- custom circle slice fill color
    borderColor: Colors.white, // <-- custom circle slice stroke color
    borderWidth: 3, // <-- custom circle slice stroke width
  );
  FortuneItemStyle evenStyle =  FortuneItemStyle(
    color: Colors.black, // <-- custom circle slice fill color
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
        title: Text('Bar Games: Fish Prawn Crab'
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
        child: fWheelPT(context),
      ),
    ]
    );
  }

  Widget landscape(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        flex: 1,
        child: playerCol(),
      ),
      Expanded(
        flex: 1,
        child: fWheelLS(context),
      ),
    ]
    );
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
            print("====> random val:" + returnval.toString());

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
                  FortuneItem(
                      child: Text('1'),
                      style: oddStyle
                  ),
                  FortuneItem(child: Text('2'),
                      style: evenStyle),
                  FortuneItem(child: Text('3'),
                      style: oddStyle),
                  FortuneItem(child: Text('4'),
                      style: evenStyle),
                  FortuneItem(child: Text('5'),
                      style: oddStyle),
                  FortuneItem(child: Text('6'),
                      style: evenStyle),
                  FortuneItem(child: Text('7'),
                      style: oddStyle),
                  FortuneItem(child: Text('8'),
                      style: evenStyle),
                  FortuneItem(child: Text('9'),
                      style: oddStyle),
                  FortuneItem(child: Text('10'),
                      style: evenStyle),
                  FortuneItem(child: Text('11'),
                      style: oddStyle),
                  FortuneItem(child: Text('12'),
                      style: evenStyle),
                  // for (var it in items) FortuneItem(child: Text(it)),
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
            print("====> random val:" + returnval.toString());

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
                  FortuneItem(
                      child: Text('1'),
                      style: oddStyle
                  ),
                  FortuneItem(child: Text('2'),
                      style: evenStyle),
                  FortuneItem(child: Text('3'),
                      style: oddStyle),
                  FortuneItem(child: Text('4'),
                      style: evenStyle),
                  FortuneItem(child: Text('5'),
                      style: oddStyle),
                  FortuneItem(child: Text('6'),
                      style: evenStyle),
                  FortuneItem(child: Text('7'),
                      style: oddStyle),
                  FortuneItem(child: Text('8'),
                      style: evenStyle),
                  FortuneItem(child: Text('9'),
                      style: oddStyle),
                  FortuneItem(child: Text('10'),
                      style: evenStyle),
                  FortuneItem(child: Text('11'),
                      style: oddStyle),
                  FortuneItem(child: Text('12'),
                      style: evenStyle),
                  // for (var it in items) FortuneItem(child: Text(it)),
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget playerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        playerWidget(
          playerNum: 0,context: context,tileFaces: Constants.buaDiceFaces,
        ),
        playerWidget(
          playerNum: 1,context: context,tileFaces: Constants.buaDiceFaces,
        ),
        playerWidget(
          playerNum: 2,context: context,tileFaces: Constants.buaDiceFaces,
        ),
        playerWidget(
          playerNum: 3,context: context,tileFaces: Constants.buaDiceFaces,
        ),
      ],
    );
  }

  Widget playerCol() {
    return SizedBox(
        width: 150.0,
        //  height: 75.0,
        child: Column(
          children: <Widget>[
            playerWidget(
              playerNum:0, context: context,tileFaces: Constants.buaDiceFaces,
            ),
            playerWidget(
              playerNum:1,context: context,tileFaces: Constants.buaDiceFaces,
            ),
            playerWidget(
              playerNum:2,context: context,tileFaces: Constants.buaDiceFaces,
            ),
            playerWidget(
              playerNum:3,context: context,tileFaces: Constants.buaDiceFaces,
            ),
          ],
        ));
  }

}
