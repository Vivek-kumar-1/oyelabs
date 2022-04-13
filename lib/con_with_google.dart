import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ConGoogle extends StatefulWidget {
  const ConGoogle({ Key? key }) : super(key: key);

  @override
  State<ConGoogle> createState() => _ConGoogleState();
}

class _ConGoogleState extends State<ConGoogle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () async {
                  await signInWithGoogle();

                  setState(() {
                    
                  });
              },
              child: Container(
                padding: EdgeInsets.only(left: 30),
                  width:300,
                  height:60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        // decoration: BoxDecoration(color: Colors.blue),
                          child:
                          Image.network(
                              'http://pngimg.com/uploads/google/google_PNG19635.png',
                              fit:BoxFit.cover,
                              
                          )
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('Continue with google', style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
            );
            
 
  }
  //google
  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

var userEmail = googleUser!.email;
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
//facebook
}