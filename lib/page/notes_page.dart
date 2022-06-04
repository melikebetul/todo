import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/page/note_editor.dart';
import 'package:todo/page/note_reader.dart';
import 'package:todo/widget/note_card.dart';

import '../style/app_style.dart';

class notesWidget extends StatefulWidget {
  const notesWidget({Key? key}) : super(key: key);

  @override
  _notesWidgetState createState() => _notesWidgetState();
}

class _notesWidgetState extends State<notesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        backgroundColor: Colors.pink[900],
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('notes').snapshots(),
                builder: (context, AsyncSnapshot snapshot){
                  //if(snapshot.connectionState == ConnectionState.waiting){
                   // return Center(child: CircularProgressIndicator());
                 // }else if(snapshot.hasData){
                    if(!snapshot.hasData){ return const Text('Loading...');}
                    else{
                      return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                int color_id = doc['color_id'];
                return Slidable(
    actionPane: SlidableDrawerActionPane(),
    key: Key(doc['color_id'].toString()),
    actions: [
      IconSlideAction(
        color: Colors.green,
        onTap: ()=> Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => NoteEditorScreen(),
                            ),),
        caption: 'Edit',
        icon: Icons.edit,
      )
    ],
   
                  child: InkWell(
                    onTap: () => Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => NoteReaderScreen(doc),
                            ),),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: AppStyle.cardsColor[doc['color_id']],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doc['note_title'] ?? "default data",
                            style: AppStyle.mainTitle,
                          ),
                          SizedBox(height: 8,),
                          Text(
                            doc['creation_date'] ?? "default data",
                            style: AppStyle.dateTitle,
                          ),
                          SizedBox(height: 18,),
                          Text(
                            doc['note_content'] ?? "default data",
                            style: AppStyle.mainContemt,
                            overflow: TextOverflow.ellipsis,
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                );
      
    
          },);/*
                       return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,),
                      children: snapshot.data!.docs.map((e) => noteCard((){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => NoteReaderScreen(e),
                          ),
                        );
                      }, e)).toList(),
                    );*/
                    }
                   

                 // }
                  //return Text('No Notes', style: GoogleFonts.nunito(color: Colors.pink[900]),);
                },
            
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteEditorScreen()));
        },
        label: Text("Add Note"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.pink[900],
      ),
      
    );
  }
  
}