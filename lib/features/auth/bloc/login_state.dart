part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginSuccessState extends LoginState {
  final String email;

  LoginSuccessState( {required this.email});
}
final class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({required this.error});
}
