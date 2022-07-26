import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/pdf_picker/pdf_file.dart';
import 'package:freeland/common/widgets/pdf_picker/pdf_picker_provider.dart';
import 'package:freeland/common/widgets/pdf_picker/pdf_view.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:provider/provider.dart';

import '../../config/theme/src/colors.dart';

typedef OnFileChanged = void Function(PdfFile file);

class PdfHolder extends StatelessWidget {
  final OnFileChanged? onUpdateFile;
  final VoidCallback? onDeleteFle;

  const PdfHolder({Key? key, this.onUpdateFile, this.onDeleteFle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PdfPickerProvider provider = context.read<PdfPickerProvider>();
    return Selector<PdfPickerProvider, PdfFile>(
        selector: (context, provider) => provider.pdfFile,
        builder: (context, value, child) {
          return InkWell(
            borderRadius: borderRadiusCircular,
            onTap: () {
              final cvFile = provider.pdfFile;
              if (cvFile.isEmpty) {
                provider.onPickCvFile();
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PdfViewScreen.file(url: cvFile.pdfFile!.path)),
                );
              }
            },
            child: Selector<PdfPickerProvider, PdfFile?>(
              selector: (context, provider) => provider.pdfFile,
              builder: (context, value, child) {
                return Column(
                  children: [
                    SizedBox(height: 16.0.h),
                    FaIcon(FontAwesomeIcons.file,
                        color: AppColors.borderColor, size: 100.0.r),
                    SizedBox(height: 8.0.h),
                    const CustomText.bodyMedium("Your Cv File"),
                    SizedBox(height: 8.0.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (value?.isNotEmpty ?? false)
                          Center(
                            child: IconButton(
                              onPressed: () {
                                provider.onDeleteImage();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                        Center(
                          child: IconButton(
                            onPressed: () {
                              provider.onPickCvFile();
                            },
                            icon: const Icon(
                              Icons.upload_file,
                              color: AppColors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        });
  }
}
