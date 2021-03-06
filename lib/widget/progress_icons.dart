import 'package:flutter/material.dart';

class ProgressIcons extends StatelessWidget{

  final int total;
  final int done;

  const ProgressIcons({required this.total, required this.done});

  Widget build(BuildContext context){
    final iconSize=50.0;

    final doneIcon = Icon(
      Icons.beenhere,
      color: Colors.white,
      size: iconSize,
    );

    final notDoneIcon = Icon(
      Icons.beenhere_outlined,
      color: Colors.white,
      size: iconSize,
    );

    List<Icon> icons = [];

    for(int i=0; i<total; i++){
      if(i<done){
        icons.add(doneIcon);
      }else{
        icons.add(notDoneIcon);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: icons,
      ),
    );

  }
}