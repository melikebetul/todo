import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
/*
class SignUpmailWidget extends StatefulWidget{
  final Function() onClickedSignIn;

  const SignUpmailWidget({
    Key? key,
    required this.onClickedSignIn,}):super(key: key);
    
  @override
  _SignUpmailWidgetState createState() _SignUpmailWidgetState();
  
}

class _SignUpmailWidgetState extends State<SignUpmailWidget>{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40,),
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
          ),
          onPressed: signIn,
          icon: Icon(Icons.arrow_forward, size: 32,), 
          label: Text(
            'Sign Up',
            style: TextStyle(fontSize: 24),
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Already have an account?',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClicledSignUp,
                text: 'Log In!',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.secondary
                
                ),
              ),
              
            ],
          ),
        ),
      ],
    ),
  );
  Future signIn()  async{
    showDialog(
      context: context, 
      builder: (context) => Center(child: CircularProgressIndicator(),),
      barrierDismissible: false,
    );
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e){
      print(e);
    }

    navigatorKey.currentState!.popUntil((route)=>rout)
  }

}*/