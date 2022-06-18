import 'package:flutter/material.dart';
import 'package:learn_for_business_app/View/Style/color.dart';

Widget loadingIndicator(
    BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
  // ignore: unnecessary_null_comparison
  if (loadingProgress == null) {
    return child;
  } else {
    return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.cumulativeBytesLoaded.toDouble() /
                loadingProgress.expectedTotalBytes.toDouble(),
            color: AppColor.greenDark,
          ),
        );
  }
}