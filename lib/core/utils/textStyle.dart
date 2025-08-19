import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle heading(BuildContext context) {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontFamily: 'Arial'
    );
  }

  static TextStyle bodyText(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle descText(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      color: Theme.of(context).textTheme.bodySmall?.color ??
          Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle buttonText(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }
}
