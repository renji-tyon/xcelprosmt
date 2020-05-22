import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xcelprosmt/provider/scene_model.dart';
import 'package:xcelprosmt/utilities.dart';
import 'package:xcelprosmt/widgets/bottom_nav_bar.dart';
import '../provider/lightmodel.dart';
import '../widgets/grid_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class RoomScreen extends StatefulWidget {
  static const routeName = '/light_manager';

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final List<Color> _colors = [
    MyColors.lightColorRed,
    MyColors.lightColorGreen,
    MyColors.lightColorBlue,
    MyColors.lightColorPurple,
    MyColors.lightColorViolet,
    MyColors.lightColorYellow,
    MyColors.white,
  ];

  int selectedLight = 1;

  double _intensity = 0.1;

  var _selectedColor;

  @override
  void initState() {
    _selectedColor = _colors[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArgs args = ModalRoute.of(context).settings.arguments;
    final _scene = Provider.of<SceneProvider>(context).sceneItems;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Column(
        children: <Widget>[
          Container(
            height: 260,
            width: double.infinity,
            color: Colors.blue.shade900,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                  ),
                ),
                designCircles(context),
                Positioned(
                  top: 0,
                  right: -30,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: TopLamp(
                      selectedColor: _selectedColor,
                      intensity: _intensity,
                    ),
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 10,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: 20,
                              child: GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: SvgPicture.asset(
                                      'assets/images/back_arrow.svg')),
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 7),
                                child: Text(
                                  args.roomName.replaceAll(' ', '\n'),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          '${args.lightCount} Lights',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  height: 50,
                  width: 400,
                  left: 30,
                  top: 190,
                  child: LightCategory(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.blue.shade900,
              child: Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.97),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 30),
                          child: Text(
                            'Intensity',
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset('assets/images/light_off.svg'),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: CupertinoSlider(
                                        activeColor: MyColors.yellow,
                                        max: 25,
                                        min: 0,
                                        onChanged: (double value) {
                                          setState(() {
                                            _intensity = value;
                                          });
                                        },
                                        value: _intensity),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: Iterable.generate(6)
                                            .map((i) => Container(
                                                  height: 5,
                                                  width: 1,
                                                  color: Colors.grey,
                                                ))
                                            .toList()),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            SvgPicture.asset('assets/images/bright_bulb.svg'),
                            SizedBox(width: 10),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Colors',
                            style: MyTextStyles.subtitleStyle,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _colors.length,
                            itemBuilder: (context, i) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = _colors[i];
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 12),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _colors[i],
                                ),
                                child: i == _colors.length - 1
                                    ? Icon(
                                        Icons.add,
                                        color: MyColors.blue,
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Scenes',
                            style: MyTextStyles.subtitleStyle,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 190,
                          child: GridView.builder(
                            itemCount: _scene.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 2.5,
                            ),
                            itemBuilder: (ctx, i) =>
                                ChangeNotifierProvider.value(
                              value: _scene[i],
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(colors: [
                                      _scene[i].color1,
                                      _scene[i].color2,
                                    ])),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(width: 30),
                                    SvgPicture.asset(
                                      'assets/images/scene_bulb.svg',
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 30),
                                    Text(
                                      _scene[i].sceneName,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget designCircles(BuildContext context) => FractionallySizedBox(
      heightFactor: 0.99,
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 50,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.04)),
              ),
            ),
            Positioned(
              bottom: -100,
              left: (MediaQuery.of(context).size.width / 2) - 100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.04)),
              ),
            ),
            Positioned(
              top: -30,
              right: -70,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.04)),
              ),
            ),
          ],
        ),
      ),
    );

class TopLamp extends StatelessWidget {
  final Color selectedColor;
  final double intensity;

  TopLamp({
    @required this.selectedColor,
    @required this.intensity,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.fromLTRB(3, 0, 58, 55),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: intensity != 0
                    ? selectedColor
                    : selectedColor.withOpacity(0.1),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: intensity != 0
                          ? selectedColor
                          : selectedColor.withOpacity(0.1),
                      blurRadius: intensity)
                ]),
          ),
        ),
        SizedBox(
          height: 130,
          child: SvgPicture.asset('assets/images/lightLamb.svg'),
        ),
      ],
    );
  }
}

class LightCategory extends StatefulWidget {
  var isSelectedLight = 1;

  @override
  _LightCategoryState createState() => _LightCategoryState();
}

class _LightCategoryState extends State<LightCategory> {
  @override
  Widget build(BuildContext context) {
    final lights = Provider.of<LightProvider>(context).lightItems;
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: lights.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: lights[i],
                child: Container(
                  height: 140,
                  margin: EdgeInsets.only(right: 30),
                  child: LightItem(
                    isSelected: widget.isSelectedLight == i,
                    onSelected: () {
                      setState(() {
                        widget.isSelectedLight = i;
                      });
                    },
                  ),
                ),
              )),
    );
  }
}

class LightItem extends StatelessWidget {
  final bool isSelected;
  final Function onSelected;

  LightItem({
    @required this.isSelected,
    @required this.onSelected,
  });
  @override
  Widget build(BuildContext context) {
    final light = Provider.of<LightModel>(context);
    return GestureDetector(
      onTap: () => onSelected(),
      child: Container(
        height: 40,
        margin: EdgeInsets.only(right: 2),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade900 : Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 16),
            SvgPicture.asset(
              light.iconPath,
              color: isSelected ? Colors.white : Colors.blue.shade900,
            ),
            SizedBox(width: 10),
            Text(
              light.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.blue.shade900),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
