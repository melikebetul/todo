
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todos.dart';
import 'package:todo/widget/todo_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/todo.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {/*=> Scaffold(
    body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
      builder: ((context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
        }else if(snapshot.hasData){
          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 1
            ),
          );
        }else {
          return Center(child: Text('No Todo\'s', style: TextStyle(fontSize: 20),));
        }
      }),
    ),
  );*/
    

   final provider = Provider.of<TodosProvider>(context);
   final todos = provider.todos;

    return todos.isEmpty
      ? Center(
        child: Text(
          'No todos',
          style: TextStyle(fontSize: 20),
        ),
      ):
      ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        separatorBuilder: (context,index)=> Container(height: 8,),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];

          return TodoWidget(todo: todo);
          
        
        },
      );
    
  }
}
