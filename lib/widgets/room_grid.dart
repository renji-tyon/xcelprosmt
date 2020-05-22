import 'package:flutter/material.dart';
import '../provider/room_model.dart';
import 'package:provider/provider.dart';
import './grid_item.dart';

class RoomGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final roomDatas = Provider.of<RommProvider>(context).roomItems;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
      child: GridView.builder(
        itemCount: roomDatas.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: roomDatas[i],
          child: GridItem(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
