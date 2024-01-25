import 'package:equatable/equatable.dart';
import 'package:fb_auth_bloc/models/custom_error.dart';
import 'package:fb_auth_bloc/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SigninState> {
  final AuthRepository authRepository;
  SignInCubit({required this.authRepository}) : super(SigninState.initial());

  Future<void> signin({required String email, required String password}) async {
    emit(state.copyWith(signinStatus: SigninStatus.submitting));

    try {
      await authRepository.singin(password: password, email: email);
      emit(state.copyWith(signinStatus: SigninStatus.success));
    } on CustomError catch (error) {
      emit(
          state.copyWith(signinStatus: SigninStatus.error, customError: error));
    }
  }
}
