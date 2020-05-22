
import 'package:flutter/material.dart';
import '../utilities.dart';

class SceneModel with ChangeNotifier {
  SceneModel({
    @required this.sceneName,
    @required this.color1,
    @required this.color2,
  });

  String sceneName;
  Color color1;
  Color color2;

  
}
class SceneProvider with ChangeNotifier{

  List<SceneModel> _sceneItems =[
        SceneModel(
          sceneName: 'Birthday',
          color1: MyColors.lightColorRed,
          color2: MyColors.lightColorRed.withOpacity(0.6),
        ),
        SceneModel(
          sceneName: 'Party',
          color1: MyColors.lightColorPurple,
          color2: MyColors.lightColorPurple.withOpacity(0.6),
        ),
        SceneModel(
          sceneName: 'Relax',
          color1: MyColors.lightColorBlue,
          color2: MyColors.lightColorBlue.withOpacity(0.6),
        ),
        SceneModel(
          sceneName: 'Fun',
          color1: MyColors.lightColorGreen,
          color2: MyColors.lightColorGreen.withOpacity(0.6),
        ),
      ];

      List<SceneModel> get sceneItems{
        return [..._sceneItems];
      }
}
