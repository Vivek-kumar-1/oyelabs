import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'otp_screen.dart';

class LoginText extends StatefulWidget {
  const LoginText({ Key? key }) : super(key: key);

  @override
  State<LoginText> createState() => _LoginTextState();
}

class _LoginTextState extends State<LoginText> {

     GlobalKey<FormState> _formKey = GlobalKey();
     final TextEditingController phController = TextEditingController();
     final TextEditingController otpCodeController = TextEditingController();
     bool otpCodeVisible = false;
     FirebaseAuth auth = FirebaseAuth.instance;
     String verificationID = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children :[

        Center(
        child: Container(
          width: 320,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Card(
                        color: Colors.white70,
    
            child: Form(
              key: _formKey,
              child: IntlPhoneField(
                controller: phController,
                        cursorColor: Colors.grey,
                      keyboardType: TextInputType.phone,
                      
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
      ),
      SizedBox(height: 20,),
            //loginbutton
            Center(
              child: Container(  
                //margin: EdgeInsets.all(25),  
                height: 60, width: 320,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.black
                ),
                child: FlatButton(  
                  child: Text( otpCodeVisible ? "LogIn" : "Verify",
                  style: TextStyle(fontSize: 20.0),),  
                  //color: Colors.black,  
                  textColor: Colors.white,  
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: ((context) => OtpScreen(
                    //   phController.text, phone: '',)
                    //   ),
                    //   ),
                    //   );
                    // verifyNumber();
                    if(otpCodeVisible){
                        verifyCode();
                    }
                    else{
                      verifyNumber();
                    }
                  },  
                ),  
              ),
            ), 
            SizedBox(height: 20,),
            Visibility(
              visible:  otpCodeVisible,
              child: TextField(
                controller: otpCodeController,
                decoration: InputDecoration(
                  labelText: 'Code',
                ),
              )
            ),
      ] 
    );
          
  }
  void verifyNumber(){
            auth.verifyPhoneNumber(
              phoneNumber: phController.text,
               verificationCompleted: (PhoneAuthCredential credential) async{
                 await auth.signInWithCredential(credential).then((value) => {
                   print("You are logged in successfully")
                 });
               },
                verificationFailed: (FirebaseAuthException exception){
                  print(exception.message);
                },
                 codeSent: (String verficationID, int? resendToken){
                  verificationID = verficationID;
                  otpCodeVisible = true;
                  setState(() {
                    
                  });
                 }, 
                 codeAutoRetrievalTimeout: (String verificationID){},
                 );
          }
          void verifyCode() async{
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationID,
               smsCode: otpCodeController.text,
               );

               await auth.signInWithCredential(credential).then((value){
                 print("Your are logged in .");
               });
          }
}