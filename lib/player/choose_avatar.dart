

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bar_constants.dart';

/*
class Constants{

  static const String firstAvatar = 'assets/images/playeravatars/blankPlayer.jpg';
  static const String secondAvatar = 'assets/images/playeravatars/girl01.PNG';
  static const String thirdAvatar = 'assets/images/playeravatars/girl02.PNG';
  static const String fourthAvatar = 'assets/images/playeravatars/girl03.PNG';
  static const String fifthAvatar = 'assets/images/playeravatars/femaleSexyWhite.png';

  static const List<String> avatarImages = <String>[
    firstAvatar,
    secondAvatar,
    thirdAvatar,
    fourthAvatar,
    fifthAvatar,
  ];
}
*/


class ChooseAvatar extends StatefulWidget {

  ChooseAvatar() : super();

  @override
  _ChooseAvatarState createState() => _ChooseAvatarState();
}


class _ChooseAvatarState extends State {

//  var _galleryImage;
  var imagePicker;
  var type;
  int imageNumReturn = 0;
  // Image chosenImage = Image.asset(Constants.avatar00, fit: BoxFit.contain);
  // Image chosenImage1 = Image.asset(Constants.avatar01, fit: BoxFit.contain);
  // Image chosenImage2 = Image.asset(Constants.avatar02, fit: BoxFit.contain);
  // Image chosenImage3 = Image.asset(Constants.avatar03, fit: BoxFit.contain);
  // Image chosenImage4 = Image.asset(Constants.avatar04, fit: BoxFit.contain);
  Color answerColor = Colors.red;

  _ChooseAvatarState(); //constructor
  final myController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

//    _galleryImage = Constants.FirstAvatar;
  }

  @override
  Widget build(BuildContext context) {

    //  myController.text = thePlayer.playerName;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Bar Games: Choose Avatar '
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
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            flex: 4,
            child: Scrollbar(
              thickness: 20,
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                playerImageWidget(1),
                playerImageWidget(2),
                playerImageWidget(3),
                playerImageWidget(4),
                playerImageWidget(5),
                playerImageWidget(6),
                playerImageWidget(7),
                playerImageWidget(8),
                playerImageWidget(9),
                playerImageWidget(10),
                playerImageWidget(11),
                playerImageWidget(12),
                playerImageWidget(13),
                playerImageWidget(14),
                playerImageWidget(15),
                playerImageWidget(16),
                playerImageWidget(17),
                playerImageWidget(18),
                playerImageWidget(19),
                playerImageWidget(20),
                playerImageWidget(21),
                playerImageWidget(22),
                playerImageWidget(23),
                playerImageWidget(24),
              ],
            ),
            ),

          ),

          Expanded(
            flex: 1,
            child:
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, imageNumReturn);
              },
              child: Text("Finish"),
            ),
          ),

        ]
    );
  }

  Widget landscape(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            flex: 4,
            child: Scrollbar(
              thickness: 20,
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                playerImageWidget(1),
                playerImageWidget(2),
                playerImageWidget(3),
                playerImageWidget(4),
                playerImageWidget(5),
                playerImageWidget(6),
                playerImageWidget(7),
                playerImageWidget(8),
                playerImageWidget(9),
                playerImageWidget(10),
                playerImageWidget(11),
                playerImageWidget(12),
                playerImageWidget(13),
                playerImageWidget(14),
                playerImageWidget(15),
                playerImageWidget(16),
                playerImageWidget(17),
                playerImageWidget(18),
                playerImageWidget(19),
                playerImageWidget(20),
                playerImageWidget(21),
                playerImageWidget(22),
                playerImageWidget(23),
                playerImageWidget(24),
              ],
            ),
            ),
          ),

          Expanded(
            flex: 1,
            child:
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, imageNumReturn);
              },
              child: Text("Finish"),
            ),
          ),

        ]
    );
  }

  Widget playerImageWidget(int imageNum) {
  //  Color borderColor1  = Colors.black;
    Color answerColor1  = Colors.black;
    if (imageNumReturn == imageNum) {
      answerColor1 = answerColor;
    }

    return Container(
      width: 500.0,
      decoration: BoxDecoration(
        border: Border.all(color: answerColor1, width: 20),
        color: answerColor1,
      ),

      child:
      GestureDetector(
        onTap: () =>
            setState(() {
              imageNumReturn = imageNum;
            }),
        child:Image.asset(Constants.avatarImages[imageNum], fit: BoxFit.contain),
        //   child:Image.asset(thePlayer.playerAvatar, fit: BoxFit.contain),
      ),

    );
  }

}