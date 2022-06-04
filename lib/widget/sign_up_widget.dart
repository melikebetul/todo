import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/home2.dart';
import 'package:todo/page/homepage.dart';
import 'package:todo/provider/google_sign_in.dart';
bool google=true;
class SignUpWidget extends StatelessWidget{
  //late final VoidCallback onClickedSignUp;
  

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.all(32),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40,),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Hey There, \nWelcome Back',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8,),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Login to your account to continue',
            style: TextStyle(fontSize: 16),
          ),
        ),
        
        LoginWidget(context),
        
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
            minimumSize: Size(double.infinity, 50)
          ),
          icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
          label: Text('Sign Up with Google'),
          onPressed: (){
            google=true;
            final provider = 
              Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
              
          },
        ),
        SizedBox(height: 40,),
        /*
        RichText(
          text: TextSpan(
            text: 'Already have an account?',
            children: [
              TextSpan(
                text: 'Log in',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                
                ),
              ),
              
            ],
          ),
        )*/
      ],
    ),
  );

  Widget LoginWidget(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(16),
    
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        TextField(
          controller: emailController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 4,),
        TextField(
          controller: passwordController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20,),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
            primary: Colors.white,
          ),
          onPressed: signIn,
          icon: Icon(Icons.lock_open, size: 24,color: Colors.black,), 
          label: Text(
            'Sign In',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        SizedBox(height: 20,),
      ],
    ),
  );
  Future signIn()  async{
    
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e){
      print(e);
    }
  }


  Widget SignUp(BuildContext context) => SingleChildScrollView(
   
  );

}