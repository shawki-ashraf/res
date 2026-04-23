import 'package:yumquick/features/auth/data/models/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final userModel userResponse;
  AuthSuccess(this.userResponse);
}

class AuthFailure extends AuthState {
  final String errMessage;
  AuthFailure(this.errMessage);
}
