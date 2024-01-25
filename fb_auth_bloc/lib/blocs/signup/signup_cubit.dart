import 'package:equatable/equatable.dart';
import 'package:fb_auth_bloc/models/custom_error.dart';
import 'package:fb_auth_bloc/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "signup_state.dart";

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepository;
  SignupCubit({required this.authRepository}) : super(SignupState.initial());

  Future<void> signup(
      {required String password,
      required String email,
      required String name}) async {
    emit(state.copyWith(signupStatus: SignupStatus.submitting));

    try {
      await authRepository.signup(name: name, email: email, password: password);
      emit(state.copyWith(signupStatus: SignupStatus.success));
    } on CustomError catch (error) {
      emit(state.copyWith(signupStatus: SignupStatus.error, customError: error));
    }
  }
}
