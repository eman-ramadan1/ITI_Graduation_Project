import 'package:coffe_app/core/utils/appColor.dart';
import 'package:coffe_app/core/utils/textStyle.dart';
import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.text, required this.onPressed,});
  final String text;
   
  final VoidCallback onPressed;  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        ),
        
          onPressed: onPressed, // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginpage()));
        

        child: Text(text, style: AppStyles.buttonText),
      ),
    );
  }
}
