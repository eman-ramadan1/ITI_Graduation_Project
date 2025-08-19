import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/core/widgits/continer.dart';
import 'package:coffe_app/features/auth/cubit/theme_switch_cubit.dart';
import 'package:coffe_app/features/auth/userProfileData/bloc/user_data_bloc.dart';
import 'package:coffe_app/features/auth/userProfileData/bloc/user_data_event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final theme = Theme.of(context);
    return BlocProvider(
      create: (_) => UserProfileBloc(
        auth: FirebaseAuth.instance,
        firestore: FirebaseFirestore.instance,
      )..add(LoadUserProfile()),
      child: Scaffold(
        body: Padding(

          padding: const EdgeInsets.symmetric(vertical:150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AppBarWidget(),
              Expanded(
                child: BlocBuilder<UserProfileBloc, UserProfileState>(
                  builder: (context, state) {
                    if (state is UserProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is UserProfileLoaded) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.brown.shade200,
                              child: const CircleAvatar(
                                radius: 55,
                                backgroundImage:
                                    AssetImage('assets/coffeeLogo.png'),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Name: ${state.name}",
                              style: const TextStyle(fontSize: 20,fontFamily: 'Borel'),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Email: ${state.email}",
                              style: const TextStyle(fontSize: 20,fontFamily: 'Borel'),
                            ),
                            const SizedBox(height: 20),
          
                            /// Dark mode switch
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
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
                                    "Dark Mode",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  BlocBuilder<ThemeCubit, ThemeMode>(
                                    builder: (context, themeMode) {
                                      return Switch(
                                        value: themeMode == ThemeMode.dark,
                                        onChanged: (value) {
                                          context
                                              .read<ThemeCubit>()
                                              .toggleTheme(value);
                                        },
                                      );
                                    },
                                  ),
                                   
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ProfileContainer(
          
                              title: 'Settings',
                            ),
                            const SizedBox(height: 10),
                            ProfileContainer(
                              title: 'Log Out',
                            ),
                            
          
                          ],
                        ),
                      );
                    } else if (state is UserProfileFailure) {
                      return Center(child: Text(state.error));
                    } else {
                      return const Center(child: Text("Press to load profile"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
