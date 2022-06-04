import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils{
  static void showSnackBar(BuildContext context, String text) =>
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));

  static String toDateTime(DateTime dateTime){
    final date = DateFormat.yMMMEd().format(dateTime);
    final time = DateFormat.Hm().format(dateTime);
    return '$date $time';
  }

  static String toDate(DateTime dateTime){
    final date = DateFormat.yMMMEd().format(dateTime);
    return '$date';
  }

  static String toTime(DateTime dateTime){
    final time = DateFormat.Hm().format(dateTime);
    return '$time';
  }

  static DateTime removeTime(DateTime dateTime)=> 
    DateTime(dateTime.year, dateTime.month,dateTime.day);
}

