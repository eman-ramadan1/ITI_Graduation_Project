import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sin_up_event.dart';
part 'sin_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  SignUpBloc({required this.auth, required this.firestore}) : super(SignUpInitial()) {
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
      // 1️⃣ إنشاء يوزر جديد
      final credential = await auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      final user = credential.user;
      if (user != null) {
        // 2️⃣ تخزين بياناته في Firestore
        await firestore.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "name": event.name, // لازم يكون عندك name في الحدث
          "email": event.email,
          "createdAt": FieldValue.serverTimestamp(),
        });

        emit(SignUpSuccess(event.email));
      } else {
        emit(SignUpFailure("User is null"));
      }
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailure(e.message ?? "Unknown error"));
    } catch (e) {
      emit(SignUpFailure("Something went wrong"));
    }
  }
}
