

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../utils.dart';
import '../widget/icon_widget.dart';

class AccountPage extends StatelessWidget{
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';
  

  @override
  Widget build(BuildContext context) =>SimpleSettingsTile(
        title: 'Acconut Settings',
        subtitle: 'Privacy, Security, Language',
        leading: IconWidget(icon: Icons.person, color: Colors.green),
        child: SettingsScreen(
          title: 'Account Settings',
          children: <Widget>[
            buildLanguage(),
            const SizedBox(height: 12,),
            buildLocation(),
            const SizedBox(height: 12,),
            buildPassword(),
            const SizedBox(height: 12,),
            buildPrivacy(context),
            const SizedBox(height: 12,),
            buildSecurity(context),
            const SizedBox(height: 12,),
            buildAccountInfo(context),
          ],
        )
     
    
  );

  Widget buildLanguage() => DropDownSettingsTile(
    settingKey: keyLanguage,
    title: 'Language',
    selected: 1,
    values: <int, String>{
      1: 'Turkish',
      2: 'English',
      3: 'German',
    },
    onChange: (language) {},
  );

  Widget buildLocation() => TextInputSettingsTile(
    settingKey: keyLocation,
    title: 'Location',
    initialValue: 'Turkey',
    onChange: (location) {},
  );

  Widget buildPassword() => TextInputSettingsTile(
    settingKey: keyPassword,
    title: 'Password',
    obscureText: true,
    validator: (password)=> password != null&& password.length >= 6 ? null: 'Enter 6 characters!',
  );

  Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
    title: 'Privacy',
    subtitle: '',
    leading: IconWidget(icon: Icons.lock, color: Colors.orange),
    onTap: () => Utils.showSnackBar(context, 'Clicked Privacy')
  );
  Widget buildSecurity(BuildContext context) => SimpleSettingsTile(
    title: 'Security',
    subtitle: '',
    leading: IconWidget(icon: Icons.security, color: Colors.blue),
    onTap: () => Utils.showSnackBar(context, 'Clicked Security')
  );
  Widget buildAccountInfo(BuildContext context) => SimpleSettingsTile(
    title: 'Account Info',
    subtitle: '',
    leading: IconWidget(icon: Icons.text_snippet, color: Colors.purple),
    onTap: () => Utils.showSnackBar(context, 'Clicked Account Info')
  );

}