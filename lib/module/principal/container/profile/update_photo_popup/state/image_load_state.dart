abstract class ImageUploadState {}

class InitialImageUploadState extends ImageUploadState {
  InitialImageUploadState();
}

class SuccessImageUploadState extends ImageUploadState {
  SuccessImageUploadState();
}

class LoadingImageUploadState extends ImageUploadState {}

class ErrorImageUploadState extends ImageUploadState {
  final String message;
  ErrorImageUploadState(this.message);
}
