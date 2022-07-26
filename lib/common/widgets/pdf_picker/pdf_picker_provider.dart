import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:freeland/common/widgets/pdf_picker/pdf_file.dart';
import 'package:freeland/core/bloc_status.dart';

class PdfPickerProvider extends ChangeNotifier {
  ///************* forms *******************

  PdfPickerProvider({this.pdfFile = const PdfFile()});

  PdfFile pdfFile;

  BlocStatus status = BlocStatus.initial();

  onDeleteImage() {
    pdfFile = const PdfFile();
    notifyListeners();
  }

  Future onPickCvFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false);

    if (result != null) {
      final file = result.files.single;
      if (file.size <= 2000000) {
        if (file.path!.endsWith("pdf")) {
          pdfFile = PdfFile(pdfFile: File(file.path!));
          status = BlocStatus.success();
        } else {
          BotToast.showText(text: "pick Pdf files  only");
        }
      } else {
        BotToast.showText(text: "File is too large");
      }
    }
    status = BlocStatus.fail(error: "Some Thing went wrong");
    notifyListeners();
  }
}
