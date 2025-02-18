// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

abstract final class AppColors {

  static const blue1 = Color(0xFF0500FF);
  static const blue2 = Color(0xFFEDEFFB);
  static const black1 = Color(0xFF1C1C1C);
  static const white1 = Color(0xFFFFFFFF);
  static const grey1 = Color(0xFF9E9E9E);
  static const grey2 = Color(0xFFDFDFDF);
  static const grey3 = Color(0xFFF5F5F5);
  static const grey4 = Color(0xFFF0F0F0);
  static const whiteTransparent = Color(
    0x4DFFFFFF,
  ); // Figma rgba(255, 255, 255, 0.3)
  static const blackTransparent = Color(0x4D000000);
  static const red1 = Color(0xFFE74C3C);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.blue1,
    onPrimary: AppColors.white1,
    secondary: AppColors.blue2,
    onSecondary: AppColors.white1,
    surface: AppColors.white1,
    onSurface: AppColors.black1,
    error: AppColors.white1,
    onError: AppColors.red1,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.blue1,
    onPrimary: AppColors.black1,
    secondary: AppColors.blue2,
    onSecondary: AppColors.black1,
    surface: AppColors.black1,
    onSurface: AppColors.white1,
    error: AppColors.black1,
    onError: AppColors.red1,
  );
}