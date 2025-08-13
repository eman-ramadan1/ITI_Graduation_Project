import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sin_up_event.dart';
part 'sin_up_state.dart';


class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmittedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());

    if (event.password != event.confirmPassword) {
      emit(SignUpFailure("Passwords do not match"));
      return;
    }

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(SignUpSuccess(event.email));
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailure(e.message ?? "Unknown error"));
    } catch (e) {
      emit(SignUpFailure("Something went wrong"));
    }
  }
}
