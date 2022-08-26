import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class ImageUtils {
  ImageUtils._();

  static Image load(
      String url, double? width, double? height, int? cacheWidth, int? cacheHeight) {
    return Image.network(
      url,
      width: width,
      height: height,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Image.asset(Assets.imagesLoadingImg);
      },
      errorBuilder: (context,error,stack){
        return Image.asset(Assets.imagesDefeat);
      },
    );
  }
}
