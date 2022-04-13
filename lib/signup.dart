// import 'dart:html';
// import 'dart:html';
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'log_in.dart';
// import 'package:splashscreen/splashscreen.dart';

// class Splash2 extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// 	return SplashScreen(
// 	seconds: 6,
// 	navigateAfterSeconds: new SignUpScreen(),
// 	title: new Text('GeeksForGeeks',textScaleFactor: 2,),
// 	image: new Image.network('https://www.geeksforgeeks.org/wp-content/uploads/gfg_200X200.png'),
// 	loadingText: Text("Loading"),
// 	photoSize: 100.0,
// 	loaderColor: Colors.blue,
// 	);
// }
// }


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   // double bannerHeight = 150;
     GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controller = TextEditingController();  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
         decoration: new BoxDecoration(color: Colors.white),
        child: Stack(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            
                 Container(
                width: double.infinity,
                //color: Colors.white,
                // child: AssetImage(
                //   'assets/images/',
                //   height: bannerHeight,
                //   alignment: Alignment.topCenter, 
                //   fit: BoxFit.fitWidth,
                // ),
                decoration: BoxDecoration(
                 // color: Colors.white,
                image: DecorationImage(
                
                  image: AssetImage('assets/images/signupscreen.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter, 
              ),
              ),
              ),
              // SizedBox(
              //   // height: MediaQuery.of(context).size.height*65,
              //   height: 500,
              //   ),
                
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Text("Your Home Services Expert",
                   style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),
                   ),
                ),
              ),
                 
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 144, left: 30, right: 30),
                  child: Text("Continue with phone number",
                   style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
                   ),
                ),
              ),
    
          Padding(
            padding: const EdgeInsets.only(top: 496, left: 20, right: 20),
            child: Card(
                          color: Colors.white70,

              child: Form(
                key: _formKey,
                child: IntlPhoneField(
                  controller: _controller,
                          cursorColor: Colors.grey,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            
                                      fillColor: Colors.white10,
                                      filled: true,
                                border: InputBorder.none,
                            hintText: "Enter Mobile Number",
                             hintStyle: TextStyle(fontSize: 18, ),
                            //labelText: 'Phone Number',
                            // border: const OutlineInputBorder(
                              
                            //   borderSide: BorderSide(
                                
                            //   ),
                            // ),
                          ),
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                          onCountryChanged: (country) {
                            print('Country changed to: ' + country.name);
                          },
                        ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 590, left: 20, right: 20),
            child: Container(  
              //margin: EdgeInsets.all(25),  
              height: 60, width: 320,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black
              ),
              child: FlatButton(  
                child: Text('SIGN UP', style: TextStyle(fontSize: 20.0),),  
                //color: Colors.black,  
                textColor: Colors.white,  
                onPressed: () {},  
              ),  
            ), 
            ),
          //
          Center(
            child: Padding(
                  padding: const EdgeInsets.only(top: 550, left: 30, right: 30),
                  
                  child: Text("View Other Option",
                  textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 17, color: Colors.lightBlueAccent,),
                   ),
                ),
          ),
          //
          Padding(
                padding: const EdgeInsets.only(top: 690, left: 20, right: 20),
                child: Row(
                  children: [
                    Text("Already have an account?",
                 style: TextStyle(fontSize: 20, color: Colors.grey,),
                 ),
                 SizedBox(width: 14,),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: ((context) => LogIn())));
                   },
                   child: Text("LOG IN",
                   style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
                   ),
                 ),
                  ],
                )
              ),
          ],
        ),
      ),
    );
  }
}

