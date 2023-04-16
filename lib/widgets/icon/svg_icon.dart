import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/utils/string_utils.dart';
import '../progress/shimmer_progress.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.icon, {
    this.size = 15,
    this.color,
    this.alignment = Alignment.center,
    this.fit = BoxFit.fill,
    super.key,
  });

  final String? icon;

  final double size;

  final BoxFit fit;

  final Color? color;

  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    if (icon?.isEmpty ?? true) {
      return DownloadProgress(size: size);
    }

    if (StringUtils.isURL(icon!)) {
      return SvgPicture.network(
        icon!,
        width: size,
        height: size,
        alignment: alignment,
        fit: fit,
      );
    }

    return SvgPicture.asset(
      icon!,
      width: size,
      height: size,
      alignment: alignment,
      fit: fit,
    );
  }

  static Widget button(
    String icon, {
    required VoidCallback? onPressed,
    Color? color,
    double size = 15,
    BoxFit fit = BoxFit.cover,
    AlignmentGeometry alignment = Alignment.center,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
  }) {
    return IconButton(
      padding: padding,
      constraints: BoxConstraints.tight(Size.square(size)),
      onPressed: onPressed,
      icon: SvgIcon(
        icon,
        size: size,
        alignment: alignment,
        fit: fit,
        color: color,
      ),
    );
  }
}
