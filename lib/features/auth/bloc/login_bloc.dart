import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:coffe_app/core/validations/emailValidation.dart';
import 'package:coffe_app/core/validations/paswwordValidation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    // 1️ Validate Email
    final emailError = emailValidation(event.email);
    if (emailError != null) {
      emit(LoginFailureState(error: emailError));
      return;
    }

    // 2️ Validate Password
    final passwordError = passwordValidation(event.password);
    if (passwordError != null) {
      emit(LoginFailureState(error: passwordError));
      return;
    }

    emit(LoginLoadingState());

    try {
      // 3️ Firebase login
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.email, password: event.password);

      final user = credential.user; // Get the user from the credential if exit or not
      if (user == null) {
        emit(LoginFailureState(error: "User not found"));
        return;
      }

      // 4️ Check Firestore for user data
      final snapshot =//all data in collection 
          await FirebaseFirestore.instance.collection("users").doc(user.uid).get();

      if (!snapshot.exists) {
        emit(LoginFailureState(error: "User data not found"));
        return;
      }

      emit(LoginSuccessState(email: event.email)); // Emit success state with email
    } on FirebaseAuthException catch (e) {
      emit(LoginFailureState(error: e.message ?? "Login failed"));
    } catch (e) {
      emit(LoginFailureState(error: "Something went wrong"));
    }
  }
}
