import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(String text, { Key? key, required this.phone }) : super(key: key);
  final String phone;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Center(
                      child: Text(
                        
                        'verify +1-${widget.phone}'
                        , style: TextStyle( fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),

                      ),
                      
                    ),
                    TextField(
                      controller: otpCodeController,
                    )
                    ] 
                  ),
                ),

              ],
            ),
          )
           
        
      ),
    );
  }
  
}