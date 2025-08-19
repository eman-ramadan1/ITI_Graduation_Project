import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/core/fireStore/BestSelling/BestSellingSeeds.dart';
import 'package:coffe_app/core/fireStore/Breads/BreadsSeed.dart';
import 'package:coffe_app/core/fireStore/Coffees/CoffeeSeed.dart';
import 'package:coffe_app/features/auth/cubit/theme_switch_cubit.dart';
import 'package:coffe_app/firebase_options.dart';
import 'package:coffe_app/myApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
BlocProvider(
  create: (_) => ThemeCubit(),
  child: MyApp(),
   
)


    );
    FirebaseFirestore firestore = FirebaseFirestore.instance;
  await  CoffeeSeed (firestore);
   await  BreadsSeed(firestore);
   await  BestSellingSeed(firestore);

}