import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/features/auth/cubits/auth_state.dart';
//import 'package:yumquick/features/auth/data/models/user_model.dart';
import 'package:yumquick/features/auth/data/repo/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final result = await authRepo.login(email: email, password: password);
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signUpUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final result = await authRepo.signUp(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
