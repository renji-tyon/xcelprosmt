import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/room_grid.dart';

class ControlPanelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        color: Colors.blue.shade900,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue.shade900,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 260,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            _designCircles(),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 40, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Control \n Panel',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        height: 1.3,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child: Image.asset(
                                      'assets/images/user.png',
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.97),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                          child: Text('All Rooms',
                              style: TextStyle(
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Container(
                          width: double.infinity,
                          child: RoomGrid(),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_designCircles() => Container(
      height: 200,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 70,
            left: -50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.04)),
            ),
          ),
          Positioned(
            bottom: -170,
            left: 0,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.04)),
            ),
          ),
          Positioned(
            bottom: -90,
            right: -100,
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
    );
