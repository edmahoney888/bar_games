

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';


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


  @override
  Widget build(BuildContext context) {
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


    return Scaffold(
      appBar: AppBar(
        title: Text('Wheel of Luck'),
      ),
      body: GestureDetector(
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
}
