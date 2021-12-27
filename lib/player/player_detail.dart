import 'dart:io';

import 'package:bar_games/player/player_in_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'choose_avatar.dart';
import 'package:provider/provider.dart';
//import 'image_from_gallery_ex.dart';

enum ImageSourceType { gallery, camera }

class PlayerDetail extends StatefulWidget {
  PlayerDetail() : super();

  @override
  _PlayerDetailState createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetail> {
  var imagePicker;
  var type;
  int imageNumReturn = 0;
  Image chosenImage = Image.asset(Constants.firstAvatar, fit: BoxFit.contain);

  _PlayerDetailState(); //constructor
  final myController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
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
      return portrait(context);
    } else {
      return landscape(context);
    }
  }

  Widget portrait(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        flex: 1,
        child: playerImageWidget(),
      ),
      Expanded(
        flex: 1,
        child: playerAvatarWidget(context),
      ),
      Expanded(
        flex: 1,
        child: playerGalleryWidget(),
      ),
      Expanded(
        flex: 1,
        child: playerCameraWidget(),
      ),
      Expanded(
        flex: 1,
        child: playerNameWidget(),
      ),
      Expanded(
        flex: 1,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Provider.of<BarPlayers>(context, listen: false)
                  .setSelectedPlayerName(myController.text);
              Navigator.pop(context);
            },
            child: Text("Finish"),
          ),
        ),
      ),
    ]);
  }

  Widget landscape(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Expanded(
        flex: 1,
        child: playerImageWidget(),
      ),
      Expanded(
        flex: 1,
        child: playerAvatarWidget(context),
      ),
      Expanded(
        flex: 1,
        child: playerGalleryWidget(),
      ),
      Expanded(
        flex: 1,
        child: playerCameraWidget(),
      ),
      Expanded(
        flex: 1,
        child: playerNameWidget(),
      ),
      Expanded(
        flex: 1,
        child: ElevatedButton(
          onPressed: () {
            Provider.of<BarPlayers>(context, listen: false)
                .setSelectedPlayerName(myController.text);
            Navigator.pop(context);
          },
          child: Text("Finish"),
        ),
      ),
    ]);
  }

  Widget playerImageWidget() {
    return SizedBox(
      width: 500.0,
      child: chosenImage,
    );
  }

  Widget playerNameWidget() {
    return SizedBox(
      width: 500.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 200.0,
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                    labelText: 'Enter player name'),
                controller: myController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  // void _handleURLButtonPress(BuildContext context, var type) {
  //   Navigator.push(context,
  //      MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
//  }

  Widget playerAvatarWidget(BuildContext context) {
    type = ImageSource.gallery;

    return Column(
      children: <Widget>[
        SizedBox(
          height: 52,
        ),
        ElevatedButton(
          onPressed: () async {
            await gotoChooseAvatarActivity(context);

            setState(() {
              Provider.of<BarPlayers>(context, listen: false)
                  .setSelectedPlayerImage(chosenImage);
            });
          },
          child: Text("Avatar"),
        ),
      ],
    );
  }

  Widget playerGalleryWidget() {
    type = ImageSource.gallery;
    var galImage;

    if (kIsWeb) {
      return Text("is web");
    } else {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 52,
          ),
          ElevatedButton(
            onPressed: () async {
              XFile image =
                  await imagePicker.pickImage(source: ImageSource.gallery);
              setState(() {
                galImage = File(image.path);

                chosenImage = Image.file(
                  galImage,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.fitHeight,
                );
                Provider.of<BarPlayers>(context, listen: false)
                    .setSelectedPlayerImage(chosenImage);
                //  thePlayer.playerAvatar = chosenImage;
              });
            },
            child: Text("Gallery"),
          ),
        ],
      );
    }
  }

  Widget playerCameraWidget() {
    type = ImageSource.camera;
    var camImage;
    if (kIsWeb) {
      return Text("is web");
    } else {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 52,
          ),
          ElevatedButton(
            onPressed: () async {
              XFile image = await imagePicker.pickImage(
                  source: ImageSource.camera,
                  preferredCameraDevice: CameraDevice.front);

              setState(() {
                camImage = File(image.path);

                chosenImage = Image.file(
                  camImage,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.fitHeight,
                );
                Provider.of<BarPlayers>(context, listen: false)
                    .setSelectedPlayerImage(chosenImage);
                //       thePlayer.playerAvatar = chosenImage;
              });
            },
            child: Text("Camera"),
          ),
        ],
      );
    }
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

  gotoChooseAvatarActivity(BuildContext context) async {
    imageNumReturn = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChooseAvatar()),
    );

    // update player list with data from result
    setState(() {
      if (imageNumReturn != 0) {
        chosenImage = Image.asset(Constants.avatarImages[imageNumReturn],
            fit: BoxFit.contain);
      }
    });
  }
}
