import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/room_model.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/room_screen.dart';

class GridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final roomItem = Provider.of<RoomData>(context);
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(RoomScreen.routeName,
      arguments: ScreenArgs(roomItem.roomName, roomItem.lightCount)),
      // splashColor: Colors.blue,
      child: Card(
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 25, 55, 3),
              height: 60,
              width: 60,
              child: SvgPicture.asset(roomItem.iconPath),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    roomItem.roomName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${roomItem.lightCount} Lights',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenArgs {
  final String roomName;
  final int lightCount;

  ScreenArgs(this.roomName, this.lightCount);
}