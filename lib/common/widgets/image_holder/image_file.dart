import 'dart:io';

import 'package:equatable/equatable.dart';

class ImageFile extends Equatable {
  final String? imageUrl;
  final File? image;

  const ImageFile({
    this.image,
    this.imageUrl,
  });

  bool get isUrl {
    return imageUrl != null;
  }

  bool get isEmpty {
    return (imageUrl?.isEmpty ?? true) && image == null;
  }

  bool get isNotEmpty {
    return !isEmpty;
  }

  @override
  List<Object?> get props => [imageUrl, image];

  ImageFile copyWith({
    String? imageUrl,
    File? image,
  }) {
    return ImageFile(
      imageUrl: imageUrl ?? this.imageUrl,
      image: image ?? this.image,
    );
  }
}
