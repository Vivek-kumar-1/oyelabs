// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oyelabs/con_with_face.dart';
import 'package:oyelabs/con_with_google.dart';

import 'login_textfield.dart';
import 'otp_screen.dart';
import 'signup.dart';

// import com.facebook.FacebookSdk;
// import com.facebook.appevents.AppEventsLogger;

// https://flutter-auth-practice-b35b4.firebaseapp.com/__/auth/handler

// @Override
// public void onCreate() {
//     super.onCreate();
//     FacebookSdk.sdkInitialize(getApplicationContext());
//     AppEventsLogger.activateApp(this);
// }
class LogIn extends StatefulWidget {
  const LogIn({ Key? key }) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  
  String userEmail = "";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: IconButton(onPressed: (){
                Navigator.pop(context, MaterialPageRoute(builder: ((context) => SignUpScreen())));
              }, icon: Icon(Icons.arrow_back, size: 40,)),
            ),
            SizedBox(height: 40,),
            Center(child: Text("Welcome Back!",  style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold , fontSize: 30),),
              ),
              SizedBox(height: 40,),
              
              ConFacebook(),
            //facebook
            SizedBox(height: 22,),
              ConGoogle(),
              SizedBox(height: 70,),
              Center(
                child: Text("Or Continue with phone number",
                 style: TextStyle(fontSize: 18, color: Colors.grey),
                 ),
              ),
            SizedBox(height: 20,),
            LoginText(),
            
            //forget password
            SizedBox(height: 14,),
            Center(
            child: Text("Forget Password?",
            textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
             ),
          ),
            //
            SizedBox(height: 58,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                 style: TextStyle(fontSize: 20, color: Colors.grey,),
                 ),
                 SizedBox(width: 10,),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: ((context) => SignUpScreen())));
                   },
                   child: Text("SIGN UP",
                   style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
                   ),
                 ),
                  ],
                )
          ],
        ),
        
      ),
    );
  }

}



