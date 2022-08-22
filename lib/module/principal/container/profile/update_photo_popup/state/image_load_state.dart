abstract class ImageLoadState {}

class InitialImageLoadState extends ImageLoadState {
  final String image;

  InitialImageLoadState(this.image);
}

class SuccessImageLoadState extends ImageLoadState {
  final String image;

  SuccessImageLoadState(this.image);
}

class LoadingImageLoadState extends ImageLoadState {}

class ErrorImageLoadState extends ImageLoadState {
  final String message;
  ErrorImageLoadState(this.message);
}
