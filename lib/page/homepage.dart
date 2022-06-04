import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/page/ToDoPage.dart';
import 'package:todo/page/calendar.dart';

import 'package:todo/page/notes_page.dart';
import 'package:todo/page/pomodoro.dart';
import 'package:todo/page/pomodoro.dart';
import 'package:todo/page/profile_page.dart';
import 'package:todo/page/settings_page.dart';
import 'package:todo/page/userPage.dart';
import 'package:todo/widget/sign_up_widget.dart';

import '../home_icon_button.dart';
import '../home_page.dart';
import '../provider/google_sign_in.dart';


class homePage extends StatefulWidget{
  @override
  _homePageState createState()=> _homePageState();
}

class _homePageState extends State<homePage>{
  final user = FirebaseAuth.instance.currentUser!;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Plan Yourself"),
        
        backgroundColor: Colors.pink[900],
      ), //AppBar
      drawer:  NavigationDrawer(),
      
      body: Column(
        children: [
          /*Transform.rotate(
            origin: Offset(30,-60),
            angle: 2.4,
            child: Container(
              margin: EdgeInsets.only(
                left: 75,
                top: 40,
              ),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [Color.fromARGB(64, 36, 185, 235), Color.fromARGB(64, 18, 134, 172)],
                ), 
              ),
            ),
          ),*/
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children:[ 
                Text(
                  ' ',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ]
            )
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children:[ 
                Text(
                  'NO PAIN NO GAIN!',
                  style: TextStyle(color: Colors.pink[900], fontSize: 24, fontStyle: FontStyle.italic),
                ),
              ]
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                       children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            
                              GestureDetector(
                                child: Container(
                                  height: 177,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(159, 233, 30, 98),
                                  ),
                                  child: Column(
                                    children: [
                                       SizedBox(
                                        height: 30,
                                      ),
                                      Icon(Icons.checklist, size: 50, color: Colors.white,),
                                      
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'To Do\'s',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 249, 249, 249),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ToDoPage()),
                                ),
                              ), 
                              SizedBox(width: 20,),
                              
                              GestureDetector(
                                child: Container(
                                  height: 177,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(159, 233, 30, 98),
                                  ),
                                  child: Column(
                                    children: [
                                       SizedBox(
                                        height: 30,
                                      ),
                                      Icon(Icons.hourglass_bottom_sharp, size: 50, color: Colors.white,),
                                      
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Pomodoro',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 249, 249, 249),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => pomodoro()),
                                ),
                              ), 
                            ],
                          ),
                          SizedBox(height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              
                               GestureDetector(
                                child: Container(
                                  height: 177,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(159, 233, 30, 98),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Icon(Icons.calendar_month_outlined, size: 50, color: Colors.white,),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Calendar',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 249, 249, 249),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Calendar()),
                                ),
                              ),
                              SizedBox(width: 20,),
                              
                              GestureDetector(
                                child: Container(
                                  height: 177,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(159, 233, 30, 98),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Icon(Icons.note_alt_sharp, size: 50, color: Colors.white,),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Notes',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 249, 249, 249),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>const notesWidget()),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
final user = FirebaseAuth.instance.currentUser!;
class NavigationDrawer extends StatelessWidget{
   final path = user.photoURL == null ?  'https://images.unsplash.com/photo-1547721064-da6cfb341d50': user.photoURL! ;
   NavigationDrawer({Key? key}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
   
    return Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
           buildHeader(context),
           buildMenuItems(context),
        ],
      ),
    ),
  );/*
  
  return Scaffold(
    appBar: AppBar(
      title: Text('Logged In'),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: (){},
          child: Text('Logout'),
        ),
      ],
    ),
    body: Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    ),
    
  );*/
  }


  Widget buildHeader(BuildContext context) => Material(
    color: Colors.pink[900],
    child: InkWell(
      onTap: (){
        
         Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfilePage()));
        
      },
      child: Container(
        
        padding: EdgeInsets.only(
          top: 24+MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children:  [
            CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage(path),
              
            ),
            SizedBox( height: 12,),
            Text(
              user.displayName! == null ? 'Anonim': user.displayName! ,
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Text(
              user.email!  == null ? 'anonim@gmail.com': user.email! ,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );


  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: ()=> Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => homePage(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: const Text('To Do\'s'),
          onTap: ()=> Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ToDoPage(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.hourglass_bottom),
          title: const Text('Pomodoro'),
          onTap: ()=> Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => pomodoro(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.calendar_month_outlined),
          title: const Text('Calendar'),
          onTap: ()=> Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Calendar(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.note_alt_sharp),
          title: const Text('Notes'),
          onTap: ()=> Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const notesWidget(),
            ),
          ),
        ),
        const Divider(color: Colors.black54,),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SettingsPage(),
            ),
          ),
        ),
        const Divider(color: Colors.black54,),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
          final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            
            if(google == true){
              FirebaseAuth.instance.signOut();
            }else{
              provider.logout();
            }
            Navigator.pop(context);
            HomePage();
          } ,
          ),
        
  
      ],
    ),
  );
}

