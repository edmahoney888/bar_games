
import 'package:flutter/cupertino.dart';

class raceGame extends StatefulWidget {
  @override
  _RaceGameState createState() => _RaceGameState();
}

class _RaceGameState extends State<raceGame> {
  @override
  Widget build(BuildContext context) {
    return _RaceGameWidget();
  }
}

class _RaceGameWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image(image: AssetImage('assets/images/racegame/horse.gif'));

    throw UnimplementedError();
  }

}