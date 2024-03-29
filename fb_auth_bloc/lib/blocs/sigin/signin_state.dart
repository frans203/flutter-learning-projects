part of 'signin_cubit.dart';

enum SigninStatus { initial, submitting, success, error }

class SigninState extends Equatable {
  final SigninStatus signinStatus;
  final CustomError customError;
  SigninState({required this.signinStatus, required this.customError});

  factory SigninState.initial() {
    return SigninState(
      signinStatus: SigninStatus.initial,
      customError: CustomError(plugin: "", message: "", code: ""),
    );
  }

  @override
  String toString() {
    return 'SigninState{signinStatus: $signinStatus, customError: $customError}';
  }

  List<Object> get props => [signinStatus, customError];

  SigninState copyWith({SigninStatus? signinStatus, CustomError? customError}) {
    return SigninState(
        signinStatus: signinStatus ?? this.signinStatus,
        customError: customError ?? this.customError);
  }
}
