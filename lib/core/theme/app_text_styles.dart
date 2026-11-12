import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';

/// Text styles taken from the Figma file (Noto Kufi Arabic + Public Sans).
abstract final class AppTextStyles {
  static TextStyle _kufi(
    double size,
    FontWeight weight,
    Color color, {
    double lineHeight = 16,
    double letterSpacing = 0,
  }) {
    return GoogleFonts.notoKufiArabic(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: lineHeight / size,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle get sectionTitle => _kufi(
        18,
        FontWeight.w600,
        AppColors.black,
        lineHeight: 23.6,
        letterSpacing: -0.3,
      );
  static TextStyle get viewAll => _kufi(
        16,
        FontWeight.w400,
        AppColors.gray,
        lineHeight: 23.6,
        letterSpacing: -0.3,
      );
  static TextStyle get filterTab => _kufi(
        14,
        FontWeight.w400,
        AppColors.black,
        lineHeight: 23.6,
        letterSpacing: -0.3,
      );
  static TextStyle get citySelector => _kufi(
        18,
        FontWeight.w400,
        AppColors.black,
        lineHeight: 23.6,
        letterSpacing: -0.3,
      );
  static TextStyle get searchHint => _kufi(
        16,
        FontWeight.w400,
        AppColors.searchHint,
        lineHeight: 22,
        letterSpacing: -0.408,
      );

  static TextStyle get bannerTitle =>
      _kufi(14, FontWeight.w600, AppColors.white);
  static TextStyle get bannerSubtitle =>
      _kufi(12, FontWeight.w500, const Color(0xCCFFFFFF));
  static TextStyle get bannerButton =>
      _kufi(12, FontWeight.w500, AppColors.white);

  static TextStyle get cardPrice => _kufi(14, FontWeight.w700, AppColors.black);
  static TextStyle get cardPriceSuffix =>
      _kufi(10, FontWeight.w400, AppColors.black);
  static TextStyle get cardTitle => _kufi(12, FontWeight.w500, AppColors.gray);
  static TextStyle get cardMeta => _kufi(10, FontWeight.w600, AppColors.gray);
  static TextStyle get cardDetail => GoogleFonts.publicSans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        height: 16 / 12,
        letterSpacing: 0.2,
      );
  static TextStyle get listingBadge =>
      _kufi(12, FontWeight.w500, AppColors.primary);
  static TextStyle get featuredBadge =>
      _kufi(10, FontWeight.w500, AppColors.black, letterSpacing: -0.3);
  static TextStyle get projectBadge =>
      _kufi(10, FontWeight.w500, AppColors.white, letterSpacing: -0.3);
  static TextStyle get publisherLabel =>
      _kufi(10, FontWeight.w400, AppColors.black);

  static TextStyle get cityName => _kufi(16, FontWeight.w700, AppColors.white);
  static TextStyle get cityStat => _kufi(12, FontWeight.w500, AppColors.white);

  static TextStyle get newsTitle => _kufi(14, FontWeight.w700, AppColors.black);
  static TextStyle get newsBody => _kufi(12, FontWeight.w400, AppColors.gray);

  static TextStyle get navLabel =>
      _kufi(12, FontWeight.w400, AppColors.navLabel);
  static TextStyle get countBadge => _kufi(
        8,
        FontWeight.w600,
        AppColors.white,
        lineHeight: 8,
        letterSpacing: -0.3,
      );
}
