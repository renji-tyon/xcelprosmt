import 'package:flutter/material.dart';
import 'package:xcelprosmt/provider/lightmodel.dart';
import './provider/scene_model.dart';
import './screens/control_panel_screen.dart';
import 'package:provider/provider.dart';
import './provider/room_model.dart';
import './screens/room_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => RommProvider()),
        ChangeNotifierProvider(create: (ctx) => LightProvider()),
        ChangeNotifierProvider(create: (ctx) => SceneProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.greenAccent,
        ),
        // home: ControlPanelScreen(),
        routes: {
          '/': (ctx) => ControlPanelScreen(),
          RoomScreen.routeName: (ctx) => RoomScreen(),
        },
      ),
    );
  }
}
