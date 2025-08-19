


import 'package:coffe_app/core/widgits/custom_bottom.dart';
import 'package:coffe_app/features/Screens/loginPage.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //circular image
  CircleAvatar(
       radius: 110,


  child:
  CircleAvatar
    (
            radius: 150,
            backgroundImage: AssetImage('assets/coffeeLogo.png'),
          ),
          ),
     SizedBox(height: 100,),
  CustomBottom(
    text: 'Get Started',
    onPressed: (){

      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => LoginPage())
      );
    },
  )
          ],
        ),
      ) 
    );
  }
}