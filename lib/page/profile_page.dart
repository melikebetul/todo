import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/page/edit_profile_page.dart';
import 'package:todo/utils/user_preferences.dart';

import '../model/user.dart';
import '../widget/appbar_widget.dart';
import '../widget/button_widget.dart';
import '../widget/profile_widget.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage>{  
  final user= FirebaseAuth.instance.currentUser;
    Widget build(BuildContext context) {
      
      return Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath:  user!.photoURL.toString(),
              isEdit: false,
              onClicked: ()  {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> EditProfilePage()),
                );
              },
            ),
            const SizedBox(height: 24,),
            buildName(),
            const SizedBox(height: 24,),
            Center(child: buildUpgradeButton()),
          ],
        ),
      );
    }

  Widget buildName()=> Column(
    children: [
      Text(
        user!.displayName!,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4,),
      Text(
        user!.email!,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );
   Widget buildUpgradeButton()=> ButtonWidget(
     text: 'Upgrade To PRO',
     onClicked:(){},
   );
   //7.09 kaldı
}

