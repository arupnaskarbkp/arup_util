import 'dart:io';
import 'package:flutter/material.dart';

Widget imageFile(
    final File file, {
      final Color? color,
      final double? width,
      final double? height,
      final BoxFit fit = BoxFit.contain,
      final Clip clipBehavior = Clip.hardEdge,
      final double borderRadius = 1,
      final EdgeInsets margin = EdgeInsets.zero,
      final VoidCallback? onTap,
    }) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        margin: margin,
        width: width,
        height: height,
        child: Image.file(file, color: color, width: width, height: height, fit: fit),
      ),
    );