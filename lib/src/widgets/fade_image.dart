import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arup_util/src/widgets/image.dart';

Widget fadeImage(
    final String source, {
      final Color? color,
      final double? width,
      final double? height,
      final BoxFit fit = BoxFit.contain,
      final Clip clipBehavior = Clip.hardEdge,
      final BorderRadius borderRadius = BorderRadius.zero,
      final EdgeInsets margin = EdgeInsets.zero,
      required final String? placeholder,
      final VoidCallback? onTap,
    }) {
  if (source.length <= 10) {
    if (placeholder == null) {
      return SizedBox(width: width, height: height);
    } else {
      return imageAsset(
        placeholder,
        width: width,
        height: height,
        borderRadius: borderRadius,
        color: color,
        margin: margin,
        onTap: onTap,
        fit: fit,
        clipBehavior: clipBehavior,
      );
    }
  } else {
    if (source.contains("http://") || source.contains("https://")) {
      return imageNetworkLocal(
        source,
        width: width,
        height: height,
        fit: fit,
        clipBehavior: clipBehavior,
        margin: margin,
        borderRadius: borderRadius,
        color: color,
        onTap: onTap,
        placeholder: placeholder,
      );
    } else {
      return imageAsset(
        source,
        width: width,
        height: height,
        fit: fit,
        clipBehavior: clipBehavior,
        margin: margin,
        borderRadius: borderRadius,
        color: color,
        onTap: onTap,
      );
    }
  }
}

Widget imageNetworkLocal(
    final String url, {
      final Color? color,
      final double? width,
      final double? height,
      final BoxFit fit = BoxFit.contain,
      final Clip clipBehavior = Clip.hardEdge,
      final BorderRadius borderRadius = BorderRadius.zero,
      final EdgeInsets margin = EdgeInsets.zero,
      final VoidCallback? onTap,
      required final String? placeholder,
    }) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: borderRadius),
        margin: margin,
        width: width,
        height: height,
        child: url.length <= 10
            ? placeholder == null
            ? const SizedBox()
            : imageAsset(
          placeholder,
          width: width,
          height: height,
          fit: fit,
          clipBehavior: clipBehavior,
        )
            : url.substring(url.length - 3) == "svg"
            ? SvgPicture.network(
          url,
          color: color,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: placeholder == null
              ? null
              : (final _) => imageAsset(
            placeholder,
            width: width,
            height: height,
            fit: fit,
            clipBehavior: clipBehavior,
          ),
        )
            : FadeInImage.assetNetwork(
          image: url,
          width: width,
          height: height,
          fit: fit,
          imageErrorBuilder: placeholder == null
              ? null
              : (final _, final __, final ___) => imageAsset(
            placeholder,
            color: color,
            width: width,
            height: height,
            fit: fit,
            clipBehavior: clipBehavior,
          ),
          placeholder: placeholder!,
        ),
      ),
    );
