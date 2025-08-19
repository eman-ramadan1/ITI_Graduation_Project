import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/features/auth/userProfileData/bloc/user_data_event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'user_data_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  UserProfileBloc({required this.auth, required this.firestore}) : super(UserProfileInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
  }

  Future<void> _onLoadUserProfile(
    LoadUserProfile event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(UserProfileLoading());
    ///check if user is logged in
    try {
      final uid = auth.currentUser?.uid;
      if (uid == null) {
        emit(UserProfileFailure("No user logged in"));
        return;
      }

      /// Get user data from Firestore coll 'users'
      final snapshot = await firestore.collection("users").doc(uid).get();

      if (!snapshot.exists) {
        emit(UserProfileFailure("User data not found"));
        return;
      }
//
      /// Emit loaded state with user data
      final data = snapshot.data()!;
      emit(UserProfileLoaded(
        name: data['name'] ?? '',
        email: data['email'] ?? '',
      ));
    } catch (e) {
      emit(UserProfileFailure("Failed to load user data"));
    }
  }
}