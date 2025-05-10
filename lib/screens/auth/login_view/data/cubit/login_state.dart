part of 'login_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitialState extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {}

final class SignInErrorState extends SignInState {
  final String error;
  SignInErrorState({required this.error});
}
