
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


  if (player.answerChosen == 0) {

    answerImage = player.playerAvatar;
  } else {

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
