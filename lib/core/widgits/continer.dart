
import 'package:flutter/material.dart';


  class ProfileContainer extends StatelessWidget {
  final String title;

  const ProfileContainer({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    return Container(
      
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                               Icon(Icons.arrow_forward)
                              ],
                            ),
                          );
  }}