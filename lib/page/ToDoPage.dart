import 'package:flutter/material.dart';

import '../widget/Todo_list_widget.dart';
import '../widget/add_tofo_dialog_widget.dart';
import '../widget/completed_list_widget.dart';

class ToDoPage extends StatefulWidget{
  _ToDoPageState createState()=> _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage>{
  int selectedIndex=0;
  
  Widget build(BuildContext context){
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
        backgroundColor: Colors.pink[900],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[700],
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index)=> setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.pink[900],
        onPressed: ()=> showDialog(
          builder: (context) => AddTodoDialogWidget(), context: context,
          barrierDismissible: false
        ),
        child: Icon(Icons.add),
      ),
    );
  }

}
