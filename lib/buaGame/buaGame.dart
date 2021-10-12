import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'bua_game_in_progress.dart';

class Constants{
  static const String FirstItem = 'Load Player';
  static const String SecondItem = 'Load Round';

  static const String FirstDiceFace = 'assets/images/buagame/crab.png';
  static const String SecondDiceFace = 'assets/images/buagame/fish.png';
  static const String ThirdDiceFace = 'assets/images/buagame/prawn.png';
  static const String FourthDiceFace = 'assets/images/buagame/tiger.png';
  static const String FifthDiceFace = 'assets/images/buagame/rooster.png';
  static const String SixthDiceFace = 'assets/images/buagame/gourd.png';


  static const List<String> diceFaces = <String>[
    FirstDiceFace,
    SecondDiceFace,
    ThirdDiceFace,
    FourthDiceFace,
    FifthDiceFace,
    SixthDiceFace,
  ];


  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
  ];
}

const List<Item> _items = [
  Item(
    name: 'joy',
    score: 0,
    uid: '1',
    imageName: "assets/images/playeravatars/girl01.PNG",
 //   imageProvider: NetworkImage('https://flutter'
 //       '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg'),
  ),
  Item(
    name: 'jane',
    score: 0,
    uid: '2',
    imageName: "assets/images/playeravatars/girl02.PNG",
 //   imageProvider: NetworkImage('https://flutter'
 //       '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg'),
  ),
  Item(
    name: 'julie',
    score: 0,
    uid: '3',
    imageName: "assets/images/playeravatars/girl03.PNG",
  //  imageProvider: NetworkImage('https://flutter'
  //      '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
  ),
  Item(
    name: 'josie',
    score: 0,
    uid: '4',
    imageName: "assets/images/playeravatars/girl04.jpg",
    //  imageProvider: NetworkImage('https://flutter'
    //      '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
  ),
];

class buaGame extends StatefulWidget {
  @override
  _BuaGameState createState() => _BuaGameState();
}

class _BuaGameState extends State<buaGame> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  BuaGameInProgress theGame = new BuaGameInProgress();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
        appBar: AppBar(
        title: Text('Bar Games: Bua Game'
        ''),
        ),
      body: body(context),
    );

 //   return _BuaGameWidget();
  }

  RollDice() {
    theGame.rollDice();
  }

  int GetState() {
    return theGame.gameState;
  }

  int GetDiceValue(int whichDice) {
    return theGame.getDiceValue(whichDice);
  }



  Widget body(BuildContext context) {
    if(MediaQuery.of(context).orientation == Orientation.portrait)
    {
      return portrait();
    }
    else {
      return landscape();
    }
  }


  Widget portrait() {
    return
      Column(
          children: <Widget>[
            playerRow(),
            buaTiles(2),
            Row(
              children: <Widget>[
                diceWidget(1),
                diceWidget(2),
                diceWidget(3),
                Center(
                  child: ElevatedButton(
                    onPressed: ()
                    {

                      switch (getRoundState()) {
                        case 0:
                          {
                            setState((){
                              theGame.rollDice();
                              theGame.gameState = 1;
                            });
                          }
                          break;
                        case 1:
                          {
                            setState((){
                              theGame.resetState();
                            });
                          }
                          break;
                        default:
                          {}
                      }

                    }
                    ,
                    child: Text(getButtonText()),
                  ),
                ),
              ]
          ),
          ]
      );
  }


  Widget landscape() {
    return Row(
        children: <Widget>[
          playerCol(),
          buaTiles(3),
          Column(
              children: <Widget>[
                diceWidget(1),
                diceWidget(2),
                diceWidget(3),
                Center(
                  child: ElevatedButton(
                    onPressed: ()
                      {

                        switch (getRoundState()) {
                          case 0:
                            {
                            setState((){
                            theGame.rollDice();
                            theGame.gameState = 1;
                            });
                            }
                            break;
                          case 1:
                            {
                            setState((){
                            theGame.resetState();
                            });
                            }
                            break;
                          default:
                            {}
                        }

                    }
                    ,
                    child: Text(getButtonText()),
                  ),
                ),
              ]
          ),
        ]
    );

  }

  Widget buaTiles(int numColumns) {
    Color borderColor1= Colors.black;
    Color borderColor2= Colors.black;
    Color borderColor3= Colors.black;
    Color borderColor4= Colors.black;
    Color borderColor5= Colors.black;
    Color borderColor6= Colors.black;

    if (borderColor1 == null)
      borderColor1 = Colors.black;
    if (borderColor2 == null)
      borderColor2 = Colors.black;
    if (borderColor3 == null)
      borderColor3 = Colors.black;
    if (borderColor4 == null)
      borderColor4 = Colors.black;
    if (borderColor5 == null)
      borderColor5 = Colors.black;
    if (borderColor6 == null)
      borderColor6 = Colors.black;

    return Container(
      child:
          Expanded(
      child: GridView.count(
          crossAxisCount: numColumns,
          children: <Widget> [
            _buildBuaImageWithDropZone(0,'assets/images/buagame/crab.png'),
            _buildBuaImageWithDropZone(1,'assets/images/buagame/fish.png'),
            _buildBuaImageWithDropZone(2,'assets/images/buagame/prawn.png'),
            _buildBuaImageWithDropZone(3,'assets/images/buagame/tiger.png'),
            _buildBuaImageWithDropZone(4,'assets/images/buagame/rooster.png'),
            _buildBuaImageWithDropZone(5,'assets/images/buagame/gourd.png'),
          ]

      ),
          )
    );
  }

  /*
  Widget _buildBuaImageWithDropZone(Customer customer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
        ),
        child: DragTarget<Item>(
          builder: (context, candidateItems, rejectedItems) {
            return CustomerCart(
              hasItems: customer.items.isNotEmpty,
              highlighted: candidateItems.isNotEmpty,
              customer: customer,
            );
          },
          onAccept: (item) {
            _itemDroppedOnCustomerCart(
              item: item,
              customer: customer,
            );
          },
        ),
      ),
    );
  }

   */

  Widget _buildBuaImageWithDropZone(int id, String imageName) {
    int buaId = id;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
        ),
        child: DragTarget<Item>(
          builder: (context, candidateItems, rejectedItems) {
            return buaImage(
                imageName
            );
          },
          onAccept: (item) {
            theGame.setPlayerAnswer(buaId, int.parse(item.uid));
            print("bua id->"+ buaId.toString());
            print("item name->"+ item.name + ' item uid->' + item.uid);
          },
        ),
      ),
    );
  }

  Widget buaImage(String imageName) {

   return  FittedBox(
      child:  Image(image: AssetImage(imageName)),
      fit: BoxFit.fill,
    );
  }


  String getButtonText() {
    String tempText;

    if (getRoundState() == 0)
      tempText = 'Roll';
    else if (getRoundState() == 1)
      tempText = 'Next';
    else
      tempText = 'OOOPS!';

    return tempText;
  }

  int getRoundState() {
    // get state from parent

    return theGame.gameState;
  }

  int getDiceValue(int whichDice) {
    //get dice value from parent
    return theGame.getDiceValue(whichDice);
  }


  Widget diceWidget(int whichDice) {

    int diceValue = getDiceValue(whichDice);
    String tempString = Constants.diceFaces[diceValue];
    print("which dice: " + whichDice.toString());
    print("diceValue: " + diceValue.toString());
    print("image Asset: " + tempString);

    return Container(
      width: 100.0,
      //       height: 50.0,
      child:
      Image.asset(tempString, fit: BoxFit.contain),
    );
  }

  Widget playerRow() {

    return Container(
      //  width: 50.0,
        height: 100.0,
        child:
        Row(
          children: <Widget>[
            _buildPlayer(
              item: _items[0],
            ),
            _buildPlayer(
              item: _items[1],
            ),
            _buildPlayer(
              item: _items[2],
            ),
            _buildPlayer(
              item: _items[3],
            ),
          ],
        )
    );
  }

  Widget playerCol() {

    return
      Container(
        width: 100.0,
        //       height: 50.0,
        child:
          Column(
            children: <Widget>[
              _buildPlayer(
            item: _items[0],
          ),
              _buildPlayer(
                item: _items[1],
              ),
              _buildPlayer(
                item: _items[2],
              ),
              _buildPlayer(
                item: _items[3],
              ),
            ],
          )
      );
  }


}
final GlobalKey _draggableKey = GlobalKey();

Widget _buildPlayer({
  required Item item,
}) {
  return LongPressDraggable<Item>(
    data: item,
    dragAnchorStrategy: pointerDragAnchorStrategy,
    feedback: DraggingListItem(
      dragKey: _draggableKey,
      imageName: item.imageName,
    ),
    child: MenuListItem(
      name: item.name,
      score: item.score,
      imageName: item.imageName,
    ),
  );
}


class MenuListItem extends StatelessWidget {
  const MenuListItem({
    Key? key,
    this.name = '',
    this.score = 0,
    required this.imageName,
    this.isDepressed = false,
  }) : super(key: key);

  final String name;
  final int score;
  final String imageName;
  final bool isDepressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12.0,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    height: isDepressed ? 95 : 100,
                    width: isDepressed ? 95 : 100,
                    child:  Image.asset(imageName, fit: BoxFit.contain),

                  ),
                ),
              ),
            ),

         //   const SizedBox(width: 30.0),
      /*
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    score.toString(),
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}


class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    Key? key,
    required this.dragKey,
    required this.imageName,
  }) : super(key: key);

  final GlobalKey dragKey;
  final String imageName;

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
            child: Image.asset(imageName, fit: BoxFit.contain),
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