import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/home_page.dart';
import 'package:todo/page/account_page.dart';
import 'package:todo/page/header_page.dart';
import 'package:todo/provider/google_sign_in.dart';
import 'package:todo/utils.dart';
import 'package:todo/widget/icon_widget.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';




class SettingsPage extends StatefulWidget{
  @override
  _SettingsPage createState() =>_SettingsPage();

}

class _SettingsPage extends State<SettingsPage>{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: new AppBar(
        title: new Text("Settings"),
        backgroundColor: Colors.pink[900],
      ),
    body: SafeArea(
      child: ListView(
        padding: EdgeInsets.all(24),
        children: [
          HeaderPage(),
          SettingsGroup(
            title: 'General',
            children: <Widget>[
              AccountPage(),
              const SizedBox(height: 12,),
              //NotificationPage(),
              //buildLogout(),
              const SizedBox(height: 12,),
              buildDeleteAccount(),
            ],
          ),
          const SizedBox(height: 32,),
          SettingsGroup(
            title: 'Feedback',
            children: <Widget>[
              buildReportBug(),
              buildSendFeedback(),
            ],
          ),
        ],
      ),
    ),
  );

  /*Widget buildLogout() => SimpleSettingsTile(
    title: 'Logout',
    subtitle: '',
    leading: IconWidget(icon: Icons.logout, color: Colors.blue),
    onTap: () {
      final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
      provider.logout();
      Navigator.pop(context);
      HomePage();
    } 
  );*/
  Widget buildDeleteAccount() => SimpleSettingsTile(
    title: 'Delete Account',
    subtitle: '',
    leading: IconWidget(icon: Icons.delete, color: Colors.red),
    onTap: () => Utils.showSnackBar(context, 'Clicked Delete Account')
  );

  Widget buildReportBug() => SimpleSettingsTile(
    title: 'Report a Bug',
    subtitle: '',
    leading: IconWidget(icon: Icons.bug_report, color: Colors.teal),
    onTap: () => Utils.showSnackBar(context, 'Clicked Report A Bug')
  );

   Widget buildSendFeedback() => SimpleSettingsTile(
    title: 'Send Feedback',
    subtitle: '',
    leading: IconWidget(icon: Icons.thumb_up, color: Colors.purple),
    onTap: () => Utils.showSnackBar(context, 'Clicked Send Feedback')
  );

  
}