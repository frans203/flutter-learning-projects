part of 'signup_cubit.dart';

enum SignupStatus {
  initial,
  submitting,
  success,
  error,
}

class SignupState extends Equatable {
  final SignupStatus signupStatus;
  final CustomError customError;
  SignupState({required this.signupStatus, required this.customError});

  factory SignupState.initial() {
    return SignupState(signupStatus: SignupStatus.initial, customError: CustomError(code: "", message: "", plugin: ""),);
  }

  @override
  String toString() {
    return 'SignupState{signupStatus: $signupStatus, customError: $customError}';
  }

  @override
  List<Object> get props => [signupStatus, customError];

  SignupState copyWith({SignupStatus? signupStatus, CustomError? customError}) {
    return SignupState(
        signupStatus: signupStatus ?? this.signupStatus,
        customError: customError ?? this.customError);
  }
}
