import 'dart:math';

import 'package:flutter/material.dart';

class MyDimens {
  //------------------------------------------------
  //-- Unit of Dimension
  //------------------------------------------------
  static double _fontSize = 8;
  static double _iconSize = 4;
  static double _padding = 4;
  static double _radiusSize = 4;
  static double _borderWidth = 1;

  //-- Extended Units
  static double get padding1 => _padding * 1;
  static double get padding2 => _padding * 2;
  static double get padding3 => _padding * 3;
  static double get padding4 => _padding * 4;
  static double get padding5 => _padding * 5;
  static double get padding6 => _padding * 6;
  static double get padding7 => _padding * 7;
  static double get padding8 => _padding * 8;
  static double get padding9 => _padding * 9;
  static double get padding10 => _padding * 10;

  static double get iconSize1 => _iconSize * 1;
  static double get iconSize2 => _iconSize * 2;
  static double get iconSize3 => _iconSize * 3;
  static double get iconSize4 => _iconSize * 4;
  static double get iconSize5 => _iconSize * 5;
  static double get iconSize6 => _iconSize * 6;
  static double get iconSize7 => _iconSize * 7;
  static double get iconSize8 => _iconSize * 8;
  static double get iconSize9 => _iconSize * 9;
  static double get iconSize10 => _iconSize * 10;

  static double get radiusSize1 => _radiusSize * 1;
  static double get radiusSize2 => _radiusSize * 2;
  static double get radiusSize3 => _radiusSize * 3;
  static double get radiusSize4 => _radiusSize * 4;
  static double get radiusSize5 => _radiusSize * 5;
  static double get radiusSize6 => _radiusSize * 6;
  static double get radiusSize7 => _radiusSize * 7;
  static double get radiusSize8 => _radiusSize * 8;
  static double get radiusSize9 => _radiusSize * 9;
  static double get radiusSize10 => _radiusSize * 10;

  static Radius get radius1 => Radius.circular(radiusSize1);
  static Radius get radius2 => Radius.circular(radiusSize2);
  static Radius get radius3 => Radius.circular(radiusSize3);
  static Radius get radius4 => Radius.circular(radiusSize4);
  static Radius get radius5 => Radius.circular(radiusSize5);
  static Radius get radius6 => Radius.circular(radiusSize6);
  static Radius get radius7 => Radius.circular(radiusSize7);
  static Radius get radius8 => Radius.circular(radiusSize8);
  static Radius get radius9 => Radius.circular(radiusSize9);
  static Radius get radius10 => Radius.circular(radiusSize10);

  static BorderRadius get borderRadius1 => BorderRadius.all(radius1);
  static BorderRadius get borderRadius2 => BorderRadius.all(radius2);
  static BorderRadius get borderRadius3 => BorderRadius.all(radius3);
  static BorderRadius get borderRadius4 => BorderRadius.all(radius4);
  static BorderRadius get borderRadius5 => BorderRadius.all(radius5);
  static BorderRadius get borderRadius6 => BorderRadius.all(radius6);
  static BorderRadius get borderRadius7 => BorderRadius.all(radius7);
  static BorderRadius get borderRadius8 => BorderRadius.all(radius8);
  static BorderRadius get borderRadius9 => BorderRadius.all(radius9);
  static BorderRadius get borderRadius10 => BorderRadius.all(radius10);

  static double get borderWidth1 => _borderWidth * 1;
  static double get borderWidth2 => _borderWidth * 2;
  static double get borderWidth3 => _borderWidth * 3;
  static double get borderWidth4 => _borderWidth * 4;
  static double get borderWidth5 => _borderWidth * 5;
  static double get borderWidth6 => _borderWidth * 6;
  static double get borderWidth7 => _borderWidth * 7;
  static double get borderWidth8 => _borderWidth * 8;
  static double get borderWidth9 => _borderWidth * 9;
  static double get borderWidth10 => _borderWidth * 10;

  static double get fontSizeLabelSmall     => _fontSize * 1.00;
  static double get fontSizeLabelMedium    => _fontSize * 1.15;
  static double get fontSizeLabelLarge     => _fontSize * 1.30;
  static double get fontSizeBodySmall      => _fontSize * 1.45;
  static double get fontSizeBodyMedium     => _fontSize * 1.60;
  static double get fontSizeBodyLarge      => _fontSize * 1.75;
  static double get fontSizeTitleSmall     => _fontSize * 1.90;
  static double get fontSizeTitleMedium    => _fontSize * 2.05;
  static double get fontSizeTitleLarge     => _fontSize * 2.20;
  static double get fontSizeHeadlineSmall  => _fontSize * 2.35;
  static double get fontSizeHeadlineMedium => _fontSize * 2.50;
  static double get fontSizeHeadlineLarge  => _fontSize * 2.65;
  static double get fontSizeDisplaySmall   => _fontSize * 2.80;
  static double get fontSizeDisplayMedium  => _fontSize * 2.95;
  static double get fontSizeDisplayLarge   => _fontSize * 3.10;

  //-------------------------------------------------
  //-- Initialize and Adjust according to Screen Size
  //-------------------------------------------------
  static bool _isInitialized = false;
  static EdgeInsets screenPadding = EdgeInsets.zero;
  static Size screenSize = const Size(320, 533);
  static double minAspect = 320;
  static double maxAspect = 533;
  static double get screenWidth => screenSize.width;
  static double get screenHeight => screenSize.height;

  static void init(BuildContext context) {
    if (_isInitialized == true) return;
    final media = MediaQuery.of(context);
    screenPadding = media.padding;
    screenSize = media.size;
    minAspect = min(screenSize.width, screenSize.height);
    maxAspect = max(screenSize.width, screenSize.height);
    final ratio = minAspect / maxAspect;

    final basis = ratio > 0.48
      ? maxAspect * 0.48
      : minAspect;

    //-- Assume minimum screen size is 320 x 533
    _fontSize = basis / 20;
    _iconSize = basis / 40;
    _padding = basis / 40;
    _radiusSize = basis / 40;
    _borderWidth = basis / 320;
    _isInitialized = true;
  }

}
