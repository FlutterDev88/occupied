import 'package:flutter/material.dart';
import 'package:occupied/common/my_colors.dart';
import 'package:occupied/common/my_dimens.dart';

class MyTheme {

  //-------------------------------------------------
  //-- ThemeData
  //-------------------------------------------------
  static ThemeData? _theme;
  static TextTheme? _textTheme;

  static ThemeData get theme => _theme!;
  static TextTheme get textTheme => _textTheme!;

  //-------------------------------------------------
  //-- TextTheme
  //-------------------------------------------------
  static TextStyle _textStyle(double fontSize) => TextStyle(
    fontSize: fontSize,
    height: 1.4,
    color: MyColors.text,
  );

  static void init() {
    _textTheme = TextTheme(
      labelSmall    : _textStyle(MyDimens.fontSizeLabelSmall),
      labelMedium   : _textStyle(MyDimens.fontSizeLabelMedium),
      labelLarge    : _textStyle(MyDimens.fontSizeLabelLarge),
      bodySmall     : _textStyle(MyDimens.fontSizeBodySmall),
      bodyMedium    : _textStyle(MyDimens.fontSizeBodyMedium),
      bodyLarge     : _textStyle(MyDimens.fontSizeBodyLarge),
      titleSmall    : _textStyle(MyDimens.fontSizeTitleSmall),
      titleMedium   : _textStyle(MyDimens.fontSizeTitleMedium),
      titleLarge    : _textStyle(MyDimens.fontSizeTitleLarge),
      headlineSmall : _textStyle(MyDimens.fontSizeHeadlineSmall),
      headlineMedium: _textStyle(MyDimens.fontSizeHeadlineMedium),
      headlineLarge : _textStyle(MyDimens.fontSizeHeadlineLarge),
      displaySmall  : _textStyle(MyDimens.fontSizeDisplaySmall),
      displayMedium : _textStyle(MyDimens.fontSizeDisplayMedium),
      displayLarge  : _textStyle(MyDimens.fontSizeDisplayLarge),
    );

    _theme = ThemeData(
      primaryColor: Colors.black,
      primarySwatch: MyColors.primarySwatch,
      focusColor: MyColors.focus,
      brightness: Brightness.light,
      scaffoldBackgroundColor: MyColors.bgScaffold,

      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),

      cardTheme: CardTheme(
        elevation: 1.0,
        color: Colors.white,
        margin: EdgeInsets.all(MyDimens.padding2),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        constraints: BoxConstraints(),
      ),

      textTheme: _textTheme,
    );
  }

}
