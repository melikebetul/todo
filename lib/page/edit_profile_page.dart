import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/page/profile_page.dart';
import 'package:todo/utils/user_preferences.dart';
import 'package:todo/widget/appbar_widget.dart';
import 'package:todo/widget/profile_widget.dart';

import '../model/user.dart';
import '../widget/button_widget.dart';
import '../widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget{
  
  @override
  _EditProfileState createState() => _EditProfileState();

}

class _EditProfileState extends State<EditProfilePage>{
  final _formkey = GlobalKey<FormState>();
  
  final user= FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 32),
      physics: BouncingScrollPhysics(),
      children: [
        ProfileWidget(
          imagePath: user!.photoURL.toString(),
          isEdit: true,
          onClicked: () async {}
        ),
        const SizedBox(height: 24,),
        TextFieldWidget(
          label: 'Full Name',
          text: user!.displayName!,
          onChanged: (name){}
        ),
        const SizedBox(height: 24,),
        TextFieldWidget(
          label: 'Email',
          text: user!.email!,
          onChanged: (email){}
        ),
        const SizedBox(height: 24,),
          Center(child: buildSave()),
      ],
    ),
  );

  /*Future saveForm() async{
    final isValid = _formkey.currentState!.validate();

    if(isValid){
      final user = User(
        imagePath: '',
        name: name,
        email: email,
      );
      final isEditing = widget.user!=null;
      final provider = Provider.of<EventProvider>(context, listen: false);
      
      if(isEditing){
        provider.editEvent(event,widget.event!);
      }else{
        provider.addEvent(event);
     
      }
      Navigator.of(context).pop();
      
    }
  }*/
  Widget buildSave()=> ButtonWidget(
     text: 'Save',
     onClicked:(){
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=> ProfilePage()),
        );
      },
   );

}