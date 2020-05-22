import 'package:flutter/foundation.dart';

class RoomData with ChangeNotifier {
  String roomName;
  String iconPath;
  int lightCount;

  RoomData({
    @required this.roomName,
    @required this.iconPath,
    this.lightCount = 0,
  });
}

class RommProvider with ChangeNotifier {
  List<RoomData> _roomItems = [
    RoomData(
      roomName: 'Bed room',
      iconPath: 'assets/images/bed.svg',
      lightCount: 4,
    ),
    RoomData(
      roomName: 'Living room',
      iconPath: 'assets/images/room.svg',
      lightCount: 2,
    ),
    RoomData(
      roomName: 'Kitchen',
      iconPath: 'assets/images/kitchen.svg',
      lightCount: 5,
    ),
    RoomData(
      roomName: 'Bathroom',
      iconPath: 'assets/images/bathtube.svg',
      lightCount: 1,
    ),
    RoomData(
      roomName: 'Outdoor',
      iconPath: 'assets/images/house.svg',
      lightCount: 5,
    ),
    RoomData(
      roomName: 'Balcony',
      iconPath: 'assets/images/balcony.svg',
      lightCount: 2,
    ),
  ];

  List<RoomData> get roomItems {
    return[..._roomItems];
  }
}
