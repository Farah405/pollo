import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/auth_service.dart';
import 'auth_states.dart';

class AuthCubit
    extends Cubit<AuthStates> {

  AuthCubit()
      : super(AuthInitialState());

  static AuthCubit get(context) =>
      BlocProvider.of(context);

  final AuthService authService =
  AuthService();

  Future login({

    required String email,

    required String password,
  }) async {

    emit(LoginLoadingState());

    try {
      if (authService.isDemoMode) {
        await Future.delayed(const Duration(milliseconds: 600));
        emit(LoginSuccessState());
        return;
      }

      await authService.login(
        email: email,
        password: password,
      );

      emit(LoginSuccessState());
    } catch (e) {

      emit(
        LoginErrorState(e.toString()),
      );
    }
  }
}