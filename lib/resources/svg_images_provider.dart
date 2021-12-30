import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'assets_svg_generated.dart';


class SvgImagesProvider {
  static Widget getWidget(BuildContext context,
      {@required String assetName,
      BoxFit fit = BoxFit.none,
      Color color,
      double width,
      double height}) {
    final String filePath = AppSVGAssets.getImagePath(context, imageName: assetName);
    if (width != null && height != null) {

      // `kIsWeb` is a special Flutter variable that just exists
      // Returns true if we're on web, false for mobile
      if (kIsWeb) {
        return Image.network(
          filePath,
          width: width,
          height: height,
          fit: fit,
          color: color,
        );
      } else {
        return SvgPicture.asset(
          filePath,
          fit: fit,
          color: color,
          width: width,
          height: height,
        );
      }
    }

    if (kIsWeb) {
      return Image.network(
        filePath,
        fit: fit,
        color: color,
      );
    } else {
      return SvgPicture.asset(filePath, fit: fit, color: color);
    }
  }
}
