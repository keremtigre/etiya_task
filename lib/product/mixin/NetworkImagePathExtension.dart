import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

mixin NetworkImagePathExtansion {
  Widget toNetworkImageWidget(
      {double? height,
      double? width,
      String? country_name,
      Widget? errorWidget}) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
            imageUrl: "https://img.icons8.com/color/512/${country_name}.png",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                errorWidget ?? const SizedBox(),
            errorWidget: (context, url, error) {
              return const Icon(Icons.error);
            }),
      ),
    );
  }
}
