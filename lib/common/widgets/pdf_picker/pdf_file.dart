import 'dart:io';

import 'package:equatable/equatable.dart';

class PdfFile extends Equatable {
  final File? pdfFile;

  const PdfFile({
    this.pdfFile,
  });

  bool get isEmpty {
    return pdfFile == null;
  }

  bool get isNotEmpty {
    return pdfFile != null;
  }

  @override
  List<Object?> get props => [pdfFile];
}
