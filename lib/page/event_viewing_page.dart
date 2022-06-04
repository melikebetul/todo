
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/event.dart';
import '../provider/event_provider.dart';
import '../utils.dart';
import 'event_editing_page.dart';

class EventViewingPage extends StatelessWidget{
  final Event event;

  const EventViewingPage({ Key? key, required this.event, }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: CloseButton(),
      actions: buildViewActions(context, event),
    ),
    body: ListView(
      padding: EdgeInsets.all(32),
      children: <Widget>[
        //buildDateTime(event),
        SizedBox(height: 32,),
        Text(
          event.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24,),
        Text(
          event.description,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    ),
  );

  
  List<Widget> buildViewActions(BuildContext context, Event event)=>[
    IconButton(
      icon: Icon(Icons.edit),
      onPressed: ()=> Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>EventEditingPage(event: event),
        ),
      ),
    ),
    IconButton(
      icon: Icon(Icons.delete),
      onPressed: (){
        final provider = Provider.of<EventProvider>(context,listen: false);
        provider.deleteEvent(event);
        Navigator.of(context).pop();
      },
    ),
  ];
  
 
  
}