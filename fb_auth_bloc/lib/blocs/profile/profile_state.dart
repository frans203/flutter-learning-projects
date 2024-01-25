part of 'profile_cubit.dart';

enum ProfileStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProfileState extends Equatable {
  final ProfileStatus profileStatus;
  final User user;
  final CustomError customError;
  ProfileState(
      {required this.profileStatus,
      required this.user,
      required this.customError});

  factory ProfileState.initial() {
    return ProfileState(
      profileStatus: ProfileStatus.initial,
      user: User.initialUser(),
      customError: CustomError.initial(),
    );
  }

  @override
  List<Object> get props => [profileStatus, user, customError];

  @override
  String toString() {
    return 'ProfileState{profileStatus: $profileStatus, user: $user, customError: $customError}';
  }

  ProfileState copyWith(
      {ProfileStatus? profileStatus, User? user, CustomError? customError}) {
    return ProfileState(
        profileStatus: profileStatus ?? this.profileStatus,
        user: user ?? this.user,
        customError: customError ?? this.customError);
  }
}
