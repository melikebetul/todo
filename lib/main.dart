import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';
import 'package:todo/page/header_page.dart';
import 'package:todo/page/homepage.dart';
import 'package:todo/provider/event_provider.dart';
import 'package:todo/provider/google_sign_in.dart';
import 'package:todo/provider/todos.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>  ChangeNotifierProvider (
    create: (context)=>GoogleSignInProvider(),
    
    child: ChangeNotifierProvider (
    create: (context)=>TodosProvider(),
    
    child:  ChangeNotifierProvider(
      create: (context) => EventProvider(),
        child :ValueChangeObserver<bool>(
        cacheKey: HeaderPage.keyDarkMode,
        defaultValue: false,
        builder: (_, isDarkMode, __) =>  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Plan Yourself',
            theme: isDarkMode ?
              ThemeData.dark().copyWith(
                primaryColor: Colors.teal,
                accentColor: Colors.white,
                scaffoldBackgroundColor: Color(0xFF170635),
                canvasColor: Color(0xFF170635),
              ): ThemeData.light().copyWith(
                primaryColor: Colors.pink[900],
                accentColor: Colors.black, 
                scaffoldBackgroundColor: Color.fromARGB(255, 245, 221, 233),
                canvasColor: Color.fromARGB(255, 245, 221, 233 ),
              ),
            home: HomePage(),
            
          
          ),
        ),
    ),
  ),
  );

  /*Widget buildbar(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Plan Yourself"),
      ), //AppBar
      drawer: new Drawer(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Acoount Name"),
              currentAccountPicture:
                new CircleAvatar(child: new
                  Icon(Icons.account_circle)),
                  accountEmail: new Text(
                    "Account_email@gmail.com")), 
                      //UserAccountsDrawerHeader
                    new FlatButton.icon(
                      onPressed: () {},
                      icon: new Icon(Icons.account_circle),
                      label: new Text("Profile")),
                      new FlatButton.icon(
                        onPressed: () {},
                        icon: new Icon(Icons.list),
                        label: new Text("To Do List")),
                      new FlatButton.icon(
                        onPressed: () {},
                        icon: new Icon(Icons.hourglass_bottom_rounded),
                        label: new Text("Pomodoro")),
                      new FlatButton.icon(
                        onPressed: () {},
                        icon: new Icon(Icons.calendar_month_outlined),
                        label: new Text("Calendar")),
                      new FlatButton.icon(
                        onPressed: () {},
                        icon: new Icon(Icons.note_add_outlined),
                        label: new Text("Notes")),
                      new FlatButton.icon(
                        onPressed: () {},
                        icon: new Icon(Icons.settings),
                        label: new Text("Settings")),
         ],
        ), //Column
      ), //Drawer
    ); //Scaffold
  }*/
}
