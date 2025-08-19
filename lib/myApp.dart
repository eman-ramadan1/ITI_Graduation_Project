


import 'package:coffe_app/Screens/getStarted.dart';
import 'package:coffe_app/Screens/userProfile.dart';
import 'package:coffe_app/core/utils/appThemes.dart';
import 'package:coffe_app/features/auth/cubit/theme_switch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeMode,
          home: GetStarted(), // Change this to MainLayout() if you want to start with the main layout
        );
      },
    );
  }
}

