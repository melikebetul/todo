import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget{
  const UserPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: new Text("Settings"),
      backgroundColor: Colors.pink[900],
    ),
    //body:,
  );
  
}