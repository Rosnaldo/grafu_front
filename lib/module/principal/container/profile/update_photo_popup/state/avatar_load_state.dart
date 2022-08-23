abstract class AvatarUploadState {}

class InitialAvatarUploadState extends AvatarUploadState {
  InitialAvatarUploadState();
}

class SuccessAvatarUploadState extends AvatarUploadState {
  final String avatar;
  SuccessAvatarUploadState(this.avatar);
}

class LoadingAvatarUploadState extends AvatarUploadState {}

class ErrorAvatarUploadState extends AvatarUploadState {
  final String message;
  ErrorAvatarUploadState(this.message);
}
