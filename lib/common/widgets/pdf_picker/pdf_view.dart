import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class PdfViewScreen extends StatefulWidget {
  const PdfViewScreen.network({
    Key? key,
    required this.url,
  })  : local = false,
        super(key: key);

  const PdfViewScreen.file({
    Key? key,
    required this.url,
  })  : local = true,
        super(key: key);

  final String url;
  final bool local;

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  late final PdfController _pdfController;
  bool _loading = true;
  double _percentage = 0;

  @override
  void initState() {
    _pdfController = PdfController(
      document: widget.local
          ? PdfDocument.openFile(widget.url).whenComplete(() {
              _onLoaded();
            })
          : PdfDocument.openData(InternetFile.get(
              widget.url,
              process: (percentage) {
                if (mounted) {
                  setState(() {
                    _percentage = percentage;
                  });
                }
              },
            ).whenComplete(() {
              _onLoaded();
            })),
    );
    super.initState();
  }

  void _onLoaded() {
    if (mounted) {
      _loading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                value: widget.local ? null : _percentage / 100,
              ),
            )
          : PdfView(
              controller: _pdfController,
            ),
    );
  }
}
