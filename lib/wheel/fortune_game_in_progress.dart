
class FortuneGameInProgress {
  int _result = 0;

  set result(int value) {
    _result = value;
  }

  int row = 12;
  int col = 4;

  var wheel = List.generate(12, (i) => List.generate(4, (j) => 0, growable: false), growable: false);
  List<int> red   = [0,0,0,0];
  List<int> black = [0,0,0,0];


  FortuneGameInProgress()
  {

  }

  placeNumBet(int wheelNum, int playerNum)
  {
    wheel[wheelNum][playerNum] = wheel[wheelNum][playerNum] + 1;
    print(" -- player: " + playerNum.toString() + " wheelNum: " + wheelNum.toString());
  }

  placeBetRed(int playerNum)
  {
    red[playerNum] = red[playerNum] + 1;
  }

  placeBetBlack(int playerNum)
  {
    black[playerNum] = black[playerNum] + 1;
  }

  int winRed(int playerNum)
  {
    int returnVal = 0;
    int modifier = 0;

    if (_result.isOdd )
      modifier = 2;

    returnVal = red[playerNum] * modifier;
    red[playerNum] = 0;

    return returnVal;
  }

  int winBlack(int playerNum)
  {
    int returnVal = 0;
    int modifier = 0;

    if (_result.isEven )
      modifier = 2;

    returnVal = black[playerNum] * modifier;
    black[playerNum] = 0;

    return returnVal;
  }

  int winNumber(int playerNum)
  {
    int returnVal = 0;

    returnVal = wheel[_result][playerNum] * 13;

    return returnVal;
  }

  clearWheel()
  {
    for(var i = 0; i < 12; i++){
      wheel[i][0] = 0 ;
      wheel[i][1] = 0 ;
      wheel[i][2] = 0 ;
      wheel[i][3] = 0 ;
    }
  }

}
