import 'package:flutter/foundation.dart';

class LightModel with ChangeNotifier {
  String name;
  String iconPath;

  LightModel({
    @required this.name,
    @required this.iconPath,
  });
}

class LightProvider with ChangeNotifier{
  List<LightModel> _lightItems = [
    LightModel(
        name: 'Main Light', iconPath: 'assets/images/lighting_bulb_clr.svg'),
    LightModel(
        name: 'Desk Lights', iconPath: 'assets/images/desk.svg'),
    LightModel(
      name: 'Bed Light', iconPath: 'assets/images/bedclr.svg'),
  ];

  List<LightModel> get lightItems{
    return[..._lightItems];
  }
}

