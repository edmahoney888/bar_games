import 'package:bar_games/player_in_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants{

  static const String FirstAvatar = 'assets/images/playeravatars/blankPlayer.jpg';
  static const String SecondAvatar = 'assets/images/playeravatars/girl01.PNG';
  static const String ThirdAvatar = 'assets/images/playeravatars/girl02.PNG';
  static const String FourthAvatar = 'assets/images/playeravatars/girl03.PNG';
  static const String FifthAvatar = 'assets/images/playeravatars/girl04.jpg';

  static const List<String> avatarImages = <String>[
    FirstAvatar,
    SecondAvatar,
    ThirdAvatar,
    FourthAvatar,
    FifthAvatar,
  ];
}

class playerDetail extends StatefulWidget {
  final PlayerInGame thePlayer;

  playerDetail({required this.thePlayer}) : super();

  @override
  _playerDetailState createState() => _playerDetailState(thePlayer);
}

class _playerDetailState extends State<playerDetail> {
  PlayerInGame thePlayer;

  _playerDetailState(this.thePlayer); //constructor
  final myController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print("player pass->" + thePlayer.uid + " ->" + thePlayer.playerName);
    myController.text = thePlayer.playerName;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Bar Games: Player Detail'
            ''),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portrait();
    } else {
      return landscape();
    }
  }

  Widget portrait() {
    return Column(children: <Widget>[
      playerWidget(),
      Center(
        child: ElevatedButton(
          onPressed: () {
            thePlayer.playerName = myController.text;
            Navigator.pop(context, thePlayer);
          },
          child: Text("Finish"),
        ),
      ),
    ]);
  }

  Widget landscape() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      playerWidget(),
      Center(
        child: ElevatedButton(
          onPressed: () {
            thePlayer.playerName = myController.text;
            Navigator.pop(context, thePlayer);
          },
          child: Text("Finish"),
        ),
      ),
    ]);
  }

  Widget playerWidget() {

    return Container(
      width: 100.0,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 100.0,
                //       height: 50.0,
                child:
                GestureDetector(
                  onTap: () =>
                  setState(() {
                    nextImage();
                  }),

                  child:Image.asset(thePlayer.playerAvatar, fit: BoxFit.contain),
                ),
              ),
            ],
          ),
          Text("PlayerName: "),
          TextField(
            controller: myController,
          ),
        ],
      ),
    );
  }

  void nextImage() {
    int tempAvatarIndex = 0;

    tempAvatarIndex = Constants.avatarImages.indexOf(thePlayer.playerAvatar);
    if (tempAvatarIndex == Constants.avatarImages.length - 1 )
      tempAvatarIndex = 0;
    else
      tempAvatarIndex++;
    thePlayer.playerAvatar = Constants.avatarImages[tempAvatarIndex];
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
}
