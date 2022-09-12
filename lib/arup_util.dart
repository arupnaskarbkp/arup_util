library arup_util;


import 'package:flutter/material.dart';

//package
export 'package:get/get.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:flutter/material.dart';
export 'package:flutter_svg/flutter_svg.dart';


export 'src/widgets/image.dart';
export 'src/widgets/plus_minus.dart';
export 'src/extensions/align_extension.dart';


void initUtilities() async {
  WidgetsFlutterBinding.ensureInitialized();
}