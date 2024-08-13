import 'package:flutter/material.dart';

class CustomColors {
  // static const primaryColor = Color(0xFF6A26ED);
  static const primaryColor1 = Colors.teal;
// const primaryColor = Color(0xff01963a);
  static var bgColor1 = const Color.fromARGB(255, 227, 253, 249);
  static var bgColor2 = Color.fromARGB(255, 216, 255, 243);
  static const bgColor3 = Color(0xFFF8F9FA);
  static const bgColor4 = Color(0xFFF8F8F8);
  static const blackColor = Colors.black;
  static const whiteColor = Colors.white;
  static const greyLess = Color(0xFFA09D9D);
  static const Color grey = Colors.grey;
  static const Color txtColor1 = Color(0xFF343A40);
  static const Color code1 = Color(0xFF1C3E6E);
  static const Color code2 = Color(0xFF6925EC);
  static const Color code3 = Color(0xFF6A26ED);
  static const Color code4 = Color(0xFF854BF5);
  static const Color code5 = Color(0xFFAD26ED);

  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  static const Color bgColor = Color(0xFFF8FAFC);
  static const Color primaryBorderColor = Color(0xFFC9CCEF);
  static const Color actionButtonBg = Color(0xFFFD9DCFD);
  static Color containerColor = Colors.white.withOpacity(0.5);
  static const Color primaryColor = Color.fromRGBO(31, 41, 156, 1);
  static const Color lightPrimaryColor = Color.fromRGBO(120, 126, 195, 1);
  static const Color lightBluePrimaryColor = Color.fromRGBO(235, 247, 255, 1);
  static const Color darkblack = Color.fromRGBO(16, 36, 61, 1);
  static const Color purpleSage = Color.fromRGBO(108, 115, 190, 1);
  static const Color grey10 = Color.fromRGBO(248, 250, 252, 1);
  static const Color grey20 = Color.fromRGBO(237, 241, 245, 1);
  static const Color grey30 = Color.fromRGBO(210, 221, 236, 1);
  static const Color grey40 = Color.fromRGBO(156, 176, 201, 1);
  static const Color grey50 = Color.fromRGBO(97, 118, 146, 1);
  static const Color lilyWhite = Color.fromRGBO(243, 244, 255, 1);
  static const Color clearBlue = Color.fromRGBO(32, 110, 243, 1);
  static const Color dodgerBlue = Color.fromRGBO(32, 110, 243, 1);
  static const Color deepSuccess = Color.fromRGBO(37, 131, 78, 1);
  static const Color deepError = Color.fromRGBO(203, 35, 32, 1);
  static const Color lightYellow = Color.fromRGBO(255, 243, 205, 1);
  static const Color darkBrown = Color.fromRGBO(124, 96, 11, 1);
  static const Color lightDeepSuccess = Color.fromRGBO(215, 254, 216, 1);
  static const Color lightDeepFailed = Color.fromRGBO(254, 231, 231, 1);
  static const Color lightBlue = Color.fromRGBO(13, 123, 197, 1);
  static const Color lightError = Color.fromRGBO(254, 231, 231, 1);
  static const Color lightInfo = Color.fromRGBO(223, 236, 255, 1);
  static const Color deepWarning = Color.fromRGBO(137, 109, 6, 1);
  static const Color lightWarning = Color.fromRGBO(250, 246, 207, 0.8);
  static const Color lightRed = Color.fromRGBO(254, 231, 231, 0.8);

  // Undefined
  static const Color background = Color(0xFFEDF2F7);
  static const Color headerBackground = Color(0xFFD2DDEC);
  static const Color landingBgOne = Color(0xFF342588);
  static const Color landingBgTwo = Color(0xFF2D2A7D);
  static const Color landingBgThree = Color(0xFF24326F);
  static const Color landingBgFour = Color(0xFF21356A);
  static const Color biruMuda = Color(0xFF319FFF);
  static const Color biruHijau = Color(0xFF15B7D1);

  // Base
  static const Color basePrimary = Color(0xFF1F299C);
  static const Color baseBackground = Color(0xFFF8FAFC);
  static const Color baseSurface = Color(0xFFFFFFFF);
  static const Color baseText = Color(0xFF10243D);

  // Surface
  static const Color surfaceDefault = Color(0xFFFFFFFF);
  static const Color surfaceSubdued = Color(0xFFFAFBFB);
  static const Color surfaceHovered = Color(0xFFEDF1F7);
  static const Color surfacePressed = Color(0xFFE3E9F2);
  static const Color surfacePrimaryDefault = Color(0xFFD9DCFD);
  static const Color surfacePrimarySubdued = Color(0xFFF3F4FF);
  static const Color surfacePrimaryHovered = Color(0xFFEAECFF);
  static const Color surfacePrimaryPressed = Color(0xFFE3E4FF);
  static const Color surfaceCriticalDefault = Color(0xFFFFE5E5);
  static const Color surfaceCriticalSubdued = Color(0xFFFEF6F6);
  static const Color surfaceCriticalHovered = Color(0xFFFEE7E7);
  static const Color surfaceCriticalPressed = Color(0xFFFDDDDD);
  static const Color surfaceWarningDefault = Color(0xFFFFF1BD);
  static const Color surfaceWarningSubdued = Color(0xFFFCF7DF);
  static const Color surfaceWarningHovered = Color(0xFFFDF3CE);
  static const Color surfaceWarningPressed = Color(0xFFFCEEBC);
  static const Color surfaceSuccessDefault = Color(0xFFC4EED6);
  static const Color surfaceSuccessSubdued = Color(0xFFEBF5EF);
  static const Color surfaceSuccessHovered = Color(0xFFDFF1E6);
  static const Color surfaceSuccessPressed = Color(0xFFCCEAD8);

  // Text
  static const Color textDefault = Color(0xFF10243D);
  static const Color textSubdued = Color(0xF6617692);
  static const Color textDisabled = Color(0xFF909FB3);
  static const Color textPrimary = Color(0xFF161D6F);
  static const Color textCritcal = Color(0xFFB9201D);
  static const Color textWarning = Color(0xFF846606);
  static const Color textSuccess = Color(0xFF185834);

  // Icon
  static const Color iconDefault = Color(0xFF617692);
  static const Color iconHovered = Color(0xFF10243D);
  static const Color iconPrimary = Color(0xFF1F299C);
  static const Color iconCritical = Color(0xFFCB2320);
  static const Color iconWarning = Color(0xFFAB8807);
  static const Color iconSuccess = Color(0xFF25834E);

  // Action
  static const Color actionPrimaryDefault = Color(0xFF1F299C);
  static const Color actionPrimaryHovered = Color(0xFF1C258C);
  static const Color actionPrimaryPressed = Color(0xFF19217D);
  static const Color actionPrimaryDisabled = Color(0xFFE4E8EE);
  static const Color actionCriticalDefault = Color(0xFFCB2320);
  static const Color actionCriticalHovered = Color(0xFFB7201D);
  static const Color actionCriticalPressed = Color(0xFFA21C1A);
  static const Color actionCriticalDisabled = Color(0xFFE4E8EE);
  static const Color actionSuccessDefault = Color(0xFF25834E);
  static const Color actionSuccessHovered = Color(0xFF217646);
  static const Color actionSuccessPressed = Color(0xFF1E693E);
  static const Color actionSuccessDisabled = Color(0xFFE4E8EE);

  // Border
  static const Color borderDefault = Color(0xFF9CB0C9);
  static const Color borderDefaultSub = Color(0xFFC9D6E8);
  static const Color borderPrimary = Color(0xFF4C54B0);
  static const Color borderPrimarySub = Color(0xFFC9CCEF);
  static const Color borderCritical = Color(0xFFE0504D);
  static const Color borderCrticalSub = Color(0xFFDFA7A6);
  static const Color borderWarning = Color(0xFFC29A08);
  static const Color borderWarningSub = Color(0xFFE3C96B);
  static const Color borderSuccess = Color(0xFF4AA170);
  static const Color borderSuccessSub = Color(0xFF9ECCB2);
}
