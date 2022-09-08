import 'package:equatable/equatable.dart';

class Avatar extends Equatable {
  final String url;
  final String uuid;

  const Avatar({
    required this.url,
    required this.uuid,
  });

  @override
  List<Object?> get props => [
        url,
        uuid,
      ];

  @override
  bool get stringify => true;
}
