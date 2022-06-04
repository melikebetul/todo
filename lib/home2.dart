import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/page/homepage.dart';
import 'package:todo/widget/login_widget.dart';
import 'package:todo/widget/sign_up_widget.dart';

class Home2Page extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
        }else if(snapshot.hasData){
          return homePage();
        }else if(snapshot.hasError){
          return Center(child: Text('Something Went Wrong!'));
        }else{
          return LoginWigdet();
        }
      }),
    ),
  );

}