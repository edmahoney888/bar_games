


import 'package:bar_games/player/player_in_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bar_constants.dart';


final GlobalKey _draggableKey = GlobalKey();

Widget playerWidget({
  required BuildContext context,
  required int playerNum,
  required List tileFaces,
}) {
  PlayerInGame player = Provider.of<BarPlayers>(context, listen: true).playerList[playerNum];
  return Expanded(
    flex: 1,
    child: Draggable<PlayerInGame>(
      data: player,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingListItem(
        dragKey: _draggableKey,
        playerImage: player.playerAvatar,
      ),
      child: playerAvatar(player: player, tileFaces: tileFaces),
    ),
  );
}

Widget playerAvatar({
  required PlayerInGame player,
  required List tileFaces,
}) {
  Image answerImage;
  //   double opacitySetting = 0.5;

  if (player.answerChosen == 0) {
//      opacitySetting = 0.0;
    answerImage = player.playerAvatar;
  } else {
    //     opacitySetting = 0.5;
    answerImage =
        Image(image: AssetImage(tileFaces[player.answerChosen]));
  }

  return Material(
    elevation: 12.0,
    borderRadius: BorderRadius.circular(20),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: SizedBox(
        width: 100,
        height: 96,
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              answerImage,
              Text(player.playerName),
              Text('Rd: ' + player.playerRndScore.toString()),
              Text('Tot: ' + player.playerTotScore.toString()),
            ]
        ),
      ),
    ),
  );
}



/*
class PlayerAvatar extends StatelessWidget {
  PlayerAvatar({
    Key? key,
    this.name = '',
    this.score = 0,
    required this.imageName,
    this.answer = 0,
    this.isDepressed = false,
  }) : super(key: key);

  final String name;
  final int score;
  final int answer;
  final String imageName;
  final bool isDepressed;
  String answerImage = "";
  double opacitySetting = 0.5;

  @override
  Widget build(BuildContext context) {
    if (answer == 0) {
      opacitySetting = 0.0;
      answerImage = imageName;
//      print("player original: " + answerImage);
    } else {
      opacitySetting = 0.5;
      answerImage = Constants.buaDiceFaces[answer];
      //     print("player changed: " + answerImage);
    }

    return Material(
      elevation: 12.0,
      borderRadius: BorderRadius.circular(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          width: 100,
          height: 96,
          child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
            Image.asset(answerImage, fit: BoxFit.contain),
            Text(name + ": " + score.toString()),
          ]),
        ),
      ),
    );
  }
}

 */

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    Key? key,
    required this.dragKey,
    required this.playerImage,
  }) : super(key: key);

  final GlobalKey dragKey;
  final Image playerImage;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Opacity(
            opacity: 0.85,
            child: playerImage,
          ),
        ),
      ),
    );
  }
}

@immutable
class Item {
  const Item({
    required this.score,
    required this.name,
    required this.uid,
    required this.imageName,
  });
  final int score;
  final String name;
  final String uid;
  final String imageName;
}
