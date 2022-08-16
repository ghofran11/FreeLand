import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/common/utils/image.dart';
import 'package:freeland/common/widgets/custom_network_image.dart';
import 'package:freeland/common/widgets/image_holder/image_holder_provider.dart';
import 'package:provider/provider.dart';

import 'image_file.dart';

typedef OnImageChanged = void Function(ImageFile image);

class ImageHolder extends StatelessWidget {
  final OnImageChanged onUpdateImage;
  final VoidCallback onDeleteImage;

  const ImageHolder(
      {Key? key, required this.onUpdateImage, required this.onDeleteImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageHolderProvider>(
        create: (context) => ImageHolderProvider(),
        child: Selector<ImageHolderProvider, ImageFile>(
          selector: (context, provider) => provider.image,
          builder: (context, value, child) {
            final ImageHolderProvider provider =
                context.read<ImageHolderProvider>();

            if (value.isEmpty) {
              return IconButton(
                  onPressed: () {
                    provider.onPickImage();
                  },
                  icon: const Icon(Icons.add_a_photo_outlined));
            } else {
              return Column(
                children: [
                  SizedBox.square(
                    dimension: 125.r,
                    child: ClipOval(
                        child: !(value.isUrl)
                            ? Image.file(
                                File(value.image!.path),
                                fit: BoxFit.cover,
                              )
                            : CustomNetworkImage(
                                viewFullImageWhenClick: true,
                                url: buildDocPath(value.imageUrl!),
                                fit: BoxFit.cover,
                              )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (!(value.isUrl))
                        IconButton(
                            onPressed: () => onUpdateImage(provider.image),
                            icon: const Icon(Icons.done)),
                      IconButton(
                          onPressed: () {
                            provider.onPickImage();
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                        onPressed: () {
                          provider.onDeleteImage();
                          onDeleteImage();
                        },
                        icon: Icon(
                          value.isUrl ? Icons.delete_outline : Icons.close,
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
          },
        ));
  }
}
