import 'dart:io';

import 'package:bar_games/player_in_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'image_from_gallery_ex.dart';

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

enum ImageSourceType { gallery, camera }

class playerDetail extends StatefulWidget {
  final PlayerInGame thePlayer;

  playerDetail({required this.thePlayer}) : super();

  @override
  _playerDetailState createState() => _playerDetailState(thePlayer);
}

class _playerDetailState extends State<playerDetail> {
  PlayerInGame thePlayer;
//  var _galleryImage;
  var imagePicker;
  var type;
  Image chosenImage = Image.asset(Constants.FirstAvatar, fit: BoxFit.contain);

  _playerDetailState(this.thePlayer); //constructor
  final myController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
//    _galleryImage = Constants.FirstAvatar;
  }

  @override
  Widget build(BuildContext context) {
    print("player pass->" + thePlayer.uid + " ->" + thePlayer.playerName);
  //  myController.text = thePlayer.playerName;

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
      playerWidgetCol(),
      playerGalleryWidget(),
      playerCameraWidget(),
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
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          playerWidgetRow(),
          playerGalleryWidget(),
          playerCameraWidget(),
          ElevatedButton(
            onPressed: () {
              thePlayer.playerName = myController.text;
              Navigator.pop(context, thePlayer);
              },
          child: Text("Finish"),
        ),

    ]);
  }

  Widget playerWidgetCol() {

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

                  child:chosenImage,
//                  child:Image.asset(thePlayer.playerAvatar, fit: BoxFit.contain),
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

  Widget playerWidgetRow() {

    return Container(
      width: 500.0,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child:
              Container(
                width: 100.0,
                //       height: 50.0,
                child:
                GestureDetector(
                  onTap: () =>
                      setState(() {
                        nextImage();
                      }),
                  child:chosenImage,
               //   child:Image.asset(thePlayer.playerAvatar, fit: BoxFit.contain),
                ),
              ),
    ),
    //      Text("PlayerName: "),
          Expanded(
            flex: 1,
            child:
 //         Padding(
 //           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
  //          child:
            Container(
              width: 200.0,
              child:
            TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
                labelText: 'Enter player name'
            ),
            controller: myController,
          ),
          ),
 //   ),
    ),

        ],
      ),
    );
  }


  void nextImage() {
    int tempAvatarIndex = 0;
/*
    tempAvatarIndex = Constants.avatarImages.indexOf(thePlayer.playerAvatar);
    if (tempAvatarIndex == Constants.avatarImages.length - 1 )
      tempAvatarIndex = 0;
    else
      tempAvatarIndex++;
    thePlayer.playerAvatar = Constants.avatarImages[tempAvatarIndex];
    chosenImage = Image.asset(thePlayer.playerAvatar, fit: BoxFit.contain);

 */
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }



  Widget playerGalleryWidget() {
    type = ImageSource.gallery;
    var galImage;

    if (kIsWeb)
      return
        Text("is web");
    else
      return Column(
      children: <Widget>[
        SizedBox(
          height: 52,
        ),
    ElevatedButton(
    onPressed: () async {
    XFile image = await imagePicker.pickImage(
    source:  ImageSource.gallery);
    setState(() {
      galImage = File(image.path);

    chosenImage = Image.file(
      galImage,
      width: 200.0,
      height: 200.0,
      fit: BoxFit.fitHeight,
    );
      thePlayer.playerAvatar = chosenImage;
    });
    },
    child: Text("Gallery"),
    ),

      ],
    );
  }

  Widget playerCameraWidget() {
    type = ImageSource.camera;
    var camImage;
    if (kIsWeb)
      return
        Text("is web");
    else
      return Column(
        children: <Widget>[
          SizedBox(
            height: 52,
          ),
          ElevatedButton(
            onPressed: () async {

              XFile image = await imagePicker.pickImage(
                  source:  ImageSource.camera, preferredCameraDevice: CameraDevice.front);


              setState(() {
                camImage = File(image.path);

                chosenImage = Image.file(
                  camImage,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.fitHeight,
                );
                thePlayer.playerAvatar = chosenImage;
              });
            },
            child: Text("Camera"),
          ),

        ],
      );
  }


  /*
  Widget playerGalleryWidget() {
    type = ImageSource.gallery;
    if (kIsWeb)
      return
        Text("is web");
    else
      return Column(
        children: <Widget>[
          SizedBox(
            height: 52,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source:  ImageSource.gallery);
                setState(() {
                  _galleryImage = File(image.path);
                });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.red[200]),
                child: _galleryImage != null
                    ? Image.file(
                  _galleryImage,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.fitHeight,
                )
                    : Container(
                  decoration: BoxDecoration(
                      color: Colors.red[200]),
                  width: 200,
                  height: 200,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          )
        ],
      );
  }

   */

}
