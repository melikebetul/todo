import 'package:todo/main.dart';
import 'package:todo/page/event_editing_page.dart';
import 'package:todo/provider/event_provider.dart';
import 'package:todo/widget/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/*
class calendarPage extends StatefulWidget{
  _CalendarPage createState()=> _CalendarPage();
}

class _CalendarPage extends State<calendarPage>{
  // This widget is the root of your application.
 
  

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => EventProvider(),
    // TODO: implement build
    
    child: Scaffold(
    appBar: AppBar(
      title: Text('Calendar'),
      centerTitle: true,
    ),
    body: CalendarWidget(),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white,),
      backgroundColor: Colors.pink,
      onPressed: ()=> Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=> EventEditingPage()),
      ),
    ),
  ),);
  
}
*/
class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Calendar'),
      backgroundColor: Colors.pink[900],
      centerTitle: true,
    ),
    body: CalendarWidget(),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white,),
      backgroundColor: Colors.pink,
      onPressed: ()=> Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=> EventEditingPage()),
      ),
    ),
  );
 
}
