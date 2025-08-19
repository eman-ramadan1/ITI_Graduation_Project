

import 'package:flutter/material.dart';

class Catagoryitems extends StatelessWidget {
  const Catagoryitems({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      
  width: 100, 
    margin: EdgeInsets.only(right: 10),
  decoration: BoxDecoration(
    //  color: const Color.fromARGB(255, 243, 235, 235),
    borderRadius: BorderRadius.circular(100),
    boxShadow: [
      // BoxShadow(
      //   color: Colors.grey.withOpacity(0.2),
      //   blurRadius: 5,
      //   offset: Offset(0, 2),
      // ),
    ],
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ClipOval(
        child: Container(
          // color: const Color.fromARGB(255, 190, 188, 188),
          child: Image.asset(
            image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(height: 10),
      Text(
        title,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  ),
);

  }
}
