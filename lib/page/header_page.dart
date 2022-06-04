

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:todo/widget/icon_widget.dart';

class HeaderPage extends StatelessWidget{
  static const keyDarkMode = 'key-dark-mode';

  @override
  Widget build(BuildContext context) =>Column(
    children: [
      //buildHeader(),
      const SizedBox(height: 32,),
      //buildUser(context),
      buildDarkMode(),
    ],
  );

  Widget buildDarkMode() => SwitchSettingsTile(
    settingKey: keyDarkMode,
    leading: IconWidget(
      icon: Icons.dark_mode,
      color: Color.fromARGB(224, 34, 17, 71)),
    title: 'Dark Mode',
    onChange: (_){},
  );

  Widget buildHeader() => Center(
    child: Text(
      'Settings',
      style: TextStyle(fontSize: 32, color: Colors.white),
    ),
  );
  
}