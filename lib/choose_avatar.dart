

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants{

  static const String firstAvatar = 'assets/images/playeravatars/blankPlayer.jpg';
  static const String secondAvatar = 'assets/images/playeravatars/girl01.PNG';
  static const String thirdAvatar = 'assets/images/playeravatars/girl02.PNG';
  static const String fourthAvatar = 'assets/images/playeravatars/girl03.PNG';
  static const String fifthAvatar = 'assets/images/playeravatars/girl04.jpg';

  static const List<String> avatarImages = <String>[
    firstAvatar,
    secondAvatar,
    thirdAvatar,
    fourthAvatar,
    fifthAvatar,
  ];
}


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
  Image chosenImage = Image.asset(Constants.thirdAvatar, fit: BoxFit.contain);
  Image chosenImage1 = Image.asset(Constants.secondAvatar, fit: BoxFit.contain);
  Image chosenImage2 = Image.asset(Constants.thirdAvatar, fit: BoxFit.contain);
  Image chosenImage3 = Image.asset(Constants.fourthAvatar, fit: BoxFit.contain);
  Image chosenImage4 = Image.asset(Constants.fifthAvatar, fit: BoxFit.contain);
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
    return Column(children: <Widget>[
      Expanded(
        flex: 1,
        child:
        playerImageWidget(1),
      ),
      Expanded(
        flex: 1,
        child:
        playerImageWidget(2),
      ),
      Expanded(
        flex: 1,
        child:
        //    playerWidgetCol(),
        playerImageWidget(3),
      ),
      Expanded(
        flex: 1,
        child:
        playerImageWidget(4),
      ),

      Expanded(
        flex: 1,
        child:
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, imageNumReturn);
            },
            child: Text("Finish"),
          ),
        ),
      ),
    ]
    );
  }

  Widget landscape(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //    playerWidgetRow(),
          Expanded(
            flex: 1,
            child:
            playerImageWidget(1),
          ),
          Expanded(
            flex: 1,
            child:
            playerImageWidget(2),
          ),
          Expanded(
            flex: 1,
            child:
            playerImageWidget(3),
          ),
          Expanded(
            flex: 1,
            child:
            playerImageWidget(4),
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