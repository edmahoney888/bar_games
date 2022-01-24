
import 'dart:ui';

import 'package:flutter/material.dart';

import '../bar_constants.dart';


class Racers {
  int finishState = 0;
  List<Racer> theRacers = [];


  Racers() {
    Racer tempRacer = Racer(0,0,Constants.racerImages[0]);
    // build racer list
    theRacers.add(tempRacer);
    tempRacer = Racer(1,1,Constants.racerImages[1]);
    theRacers.add(tempRacer);
    tempRacer = Racer(2,2,Constants.racerImages[2]);
    theRacers.add(tempRacer);
    tempRacer = Racer(3,3,Constants.racerImages[3]);
    theRacers.add(tempRacer);
    tempRacer = Racer(4,4,Constants.racerImages[4]);
    theRacers.add(tempRacer);
    tempRacer = Racer(5,5,Constants.racerImages[5]);
    theRacers.add(tempRacer);
  }

  resetRacers() {
    finishState = 0;
    for (int counter = 0; counter <= theRacers.length-1; counter++)
    {
      theRacers[counter].color = Colors.white;
      theRacers[counter].place = 0;
      theRacers[counter].finishPlace = 0;
    }
  }

  moveRacers(int dice1, int dice2, int dice3) {
    bool finished = false;
    // add code for calculating finish
    for (int counter = 0; counter <= theRacers.length-1; counter++)
      {
        if (theRacers[counter].isFinished() == false)
        {
          theRacers[counter].moveRacer(dice1, dice2, dice3);
          if (theRacers[counter].isFinished()) {
            finished = true;
            theRacers[counter].finish(finishState);
          }
        }
      }
    if (finished)
      finishState = finishState + 1;
  }

  isRacerFinished(int racerID) {
    Racer tempRacer = getRacer(racerID);

    if (tempRacer.isFinished() )
      return true;
    else
      return false;

  }

  Racer getRacer(int racerID) {
    Racer tempRacer =  Racer(-1,-1,Constants.racerBlank);
    for (int counter = 0; counter <= theRacers.length-1; counter++)
    {
      if (theRacers[counter]._racerID == racerID) {
        tempRacer = theRacers[counter];
        break;
      }
    }
    return tempRacer;
  }

  Color getRacerColor(int racerID) {
    Color tempColor = Colors.white;

    Racer tempRacer = getRacer(racerID);
    tempColor = tempRacer._color;
    return tempColor;
  }

  bool allFinished() {
    bool tempFinished = true;

    for (int counter = 0; counter <= theRacers.length-1; counter++)
    {
      if (theRacers[counter].isFinished() == false)
      {
        tempFinished = false;
        break;
      }
    }

    return tempFinished;
  }


  int payout(int racerID){
    int tempPayout = 0;
    int finished = 0;

    finished = getRacer(racerID).finishPlace;
    if (finished == 0)
      tempPayout = 3;
    else if (finished == 1)
      tempPayout = 2;
    else if (finished == 2)
      tempPayout = 1;
    else
      tempPayout = 0;

    return tempPayout;
  }
}



class Racer {
  final Color firstPlaceColor = Colors.amber;
  final Color secondPlaceColor = Colors.red;
  final Color thirdPlaceColor = Colors.green;


  int _racerID = 0;
  int _lane = 0;
  int _finishPlace = 0;

  int get racerID => _racerID;

  set racerID(int value) {
    _racerID = value;
  }

  String _racerImage = '';
  int _place = 0;
  Color _color =  Colors.white;


  Racer(this._racerID, this._lane, this._racerImage);

  Map<String, dynamic> toMap() {
    return {
      'racerID': _racerID,
      'lane': _lane,
      'avatar': _racerImage,
      'place': _place,
      'color': _color,
    };
  }

  int get lane => _lane;

  set lane(int value) {
    _lane = value;
  }

  String get racerImage => _racerImage;

  set racerImage(String value) {
    _racerImage = value;
  }

  int get place => _place;

  set place(int value) {
    _place = value;
  }

  Color get color => _color;

  set color(Color value) {
    _color = value;
  }

  moveRacer(int dice1, int dice2, int dice3) {
    if (dice1 == _lane) _place = _place + 1;
    if (dice2 == _lane) _place = _place + 1;
    if (dice3 == _lane) _place = _place + 1;
  }

  bool isFinished() {
    if (_place > Constants.raceLength)
      return true;
    else
      return false;
  }

  String getImageInRace(int racePosition) {
    String tempStr = Constants.racerBlank;

//    if (racePosition == _place)
      tempStr = _racerImage;

    return tempStr;
  }

  finish(int theFinishPlace) {
    _finishPlace = theFinishPlace;
    if (theFinishPlace == 0)    //first place
      {

      _color = firstPlaceColor;
      }
    else if (theFinishPlace == 1)   // seconds place
      {
      _color = secondPlaceColor;
      }
    else if (theFinishPlace == 2)    // third place
        {
        _color = thirdPlaceColor;
        }
    else    // after third place
      {

      }
  }

  int get finishPlace => _finishPlace;

  set finishPlace(int value) {
    _finishPlace = value;
  }
}