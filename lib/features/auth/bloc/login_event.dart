part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent { // user action
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
}
