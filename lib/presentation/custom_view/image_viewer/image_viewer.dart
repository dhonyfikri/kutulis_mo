import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutulis_mo/app/resources/app_images.dart';

class ImageViewer extends StatelessWidget {
  final String? source;
  final File? file;
  final Uint8List? bytes;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final double radius;

  const ImageViewer({
    super.key,
    this.source,
    this.file,
    this.bytes,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.cover,
    this.radius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: source?.contains("http") ?? false
          ? _getNetworkImage()
          : source != null && source != ""
              ? _getAssetImage()
              : file != null
                  ? _getFileImage()
                  : bytes != null
                      ? _getMemoryImage()
                      : SizedBox(width: width, height: height),
    );
  }

  Image _getNetworkImage() {
    return Image.network(
      source ?? "",
      width: width,
      height: height,
      color: color,
      fit: fit,
      loadingBuilder: _loadingHandler,
      errorBuilder: _errorHandler,
    );
  }

  Image _getAssetImage() {
    return Image.asset(
      source ?? "",
      width: width,
      height: height,
      color: color,
      fit: fit,
      errorBuilder: _errorHandler,
    );
  }

  Image _getFileImage() {
    try {
      return Image.file(
        file ?? File(""),
        width: width,
        height: height,
        color: color,
        fit: fit,
        errorBuilder: _errorHandler,
      );
    } catch (e) {
      e.printError();
      return _getAssetImage();
    }
  }

  Image _getMemoryImage() {
    return Image.memory(
      bytes ?? Uint8List.fromList([0]),
      width: width,
      height: height,
      color: color,
      fit: fit,
      errorBuilder: _errorHandler,
    );
  }

  Widget _loadingHandler(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    return loadingProgress == null
        ? child
        : Image.asset(
            AppImages.loadingImage,
            width: width,
            height: height,
            fit: fit,
          );
  }

  Widget _errorHandler(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    return Image.asset(
      AppImages.imagePlaceholder,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
