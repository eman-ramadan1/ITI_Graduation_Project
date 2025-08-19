part of 'user_data_bloc.dart';

@immutable
abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object?> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final String name;
  final String email;

  const UserProfileLoaded({required this.name, required this.email});

  @override
  List<Object?> get props => [name, email];
}

class UserProfileFailure extends UserProfileState {
  final String error;
  const UserProfileFailure(this.error);

  @override
  List<Object?> get props => [error];
}

