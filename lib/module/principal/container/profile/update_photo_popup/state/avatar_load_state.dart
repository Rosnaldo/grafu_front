abstract class AvatarUploadState {}

class InitialAvatarUploadState extends AvatarUploadState {
  InitialAvatarUploadState();
}

class SuccessAvatarUploadState extends AvatarUploadState {
  SuccessAvatarUploadState();
}

class LoadingAvatarUploadState extends AvatarUploadState {}

class ErrorAvatarUploadState extends AvatarUploadState {
  final String message;
  ErrorAvatarUploadState(this.message);
}
