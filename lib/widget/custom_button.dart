import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final Function() onTap;
  final String text;

  // ignore: use_key_in_widget_constructors
  const CustomButton({required this.onTap,required this.text});

  Widget build(BuildContext context){
    return ButtonTheme(
      minWidth: 200,
      child: RaisedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}