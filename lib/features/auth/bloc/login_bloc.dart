import 'package:bloc/bloc.dart';
import 'package:coffe_app/core/validations/emailValidation.dart';
import 'package:coffe_app/core/validations/paswwordValidation.dart';

import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    // 1. Validate Email
    final emailError = emailValidation(event.email);
    if (emailError != null) {
      emit(LoginFailureState(error: emailError));
      return;
    }

    // 2. Validate Password
    final passwordError = passwordValidation(event.password);
    if (passwordError != null) {
      emit(LoginFailureState(error: passwordError));
      return;
    }

    // 3. Try Firebase login
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(LoginSuccessState(email: event.email));
    } catch (e) {
      emit(LoginFailureState(error: e.toString()));
    }
  }
}
