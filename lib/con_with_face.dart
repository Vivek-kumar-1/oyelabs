import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class ConFacebook extends StatefulWidget {
  const ConFacebook({ Key? key }) : super(key: key);

  @override
  State<ConFacebook> createState() => _ConFacebookState();
}

class _ConFacebookState extends State<ConFacebook> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () async {
                  await signInWithFacebook();

                  setState(() {
                    
                  });
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),

              padding: EdgeInsets.all(14),
                width:300,
                height:54,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 38, 126, 197),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      // decoration: BoxDecoration(color: Colors.blue),
                        child:
                        Image.network(
                            'https://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19760.png',
                            fit:BoxFit.cover,
                            
                        )
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Continue with Facebook', style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),
            );
            
  }
  Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login(
    permissions: ["email", "public_profile", "user_birthday"]
  );

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  final userData = await FacebookAuth.instance.getUserData();
  var userEmail = userData["email"];
  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
}