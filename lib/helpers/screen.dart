import 'package:flutter/cupertino.dart';

class Screen {
  static MediaQueryData _mediaQueryData;
  static double width;
  static double height;
  static double xBlock;
  static double yBlock;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    xBlock = width / 100;
    yBlock = height / 100;
  }

  static double size() {
    return height * width;
  }

  static double thumbX() {
    if (isMobile())
      return 30;
    else if (isLandScape())
      return 35;
    else if (isTablet())
      return 40;
    else if (isDesktop())
      return 45;
    else
      return 50;
  }
  
  static double thumbY() {
    if (isMobile())
      return 20;
    else if (isLandScape())
      return 25;
    else if (isTablet())
      return 25;
    else if (isDesktop())
      return 30;
    else
      return 30;
  }
  
  static double bigButtonFont() {
    if (isMobile())
      return 20;
    else if (isLandScape())
      return 22;
    else if (isTablet())
      return 25;
    else if (isDesktop())
      return 30;
    else
      return 35;
  }



  static double smCol() {
    if (isMobile())
      return xBlock * 18;
    else if (isLandScape())
      return xBlock * 18;
    else if (isTablet())
      return xBlock * 15;
    else if (isDesktop())
      return xBlock * 10;
    else
      return xBlock * 10;
  }

  static double lgCol() {
    if (isMobile())
      return xBlock * 30;
    else if (isLandScape())
      return xBlock * 26;
    else if (isTablet())
      return xBlock * 22;
    else if (isDesktop())
      return xBlock * 20;
    else
      return xBlock * 20;
  }

  static double headFont() {
    if (isMobile())
      return 15;
    else if (isLandScape())
      return 15;
    else if (isTablet())
      return 20;
    else if (isDesktop())
      return 20;
    else
      return 22;
  }

  static double tableRowFont() {
    if (isMobile())
      return 15;
    else if (isLandScape())
      return 15;
    else if (isTablet())
      return 20;
    else if (isDesktop())
      return 20;
    else
      return 22;
  }

  static double inputWidth() {
    if (isMobile())
      return xBlock * 80;
    else if (isLandScape())
      return xBlock * 75;
    else if (isTablet())
      return xBlock * 75;
    else if (isDesktop())
      return xBlock * 50;
    else
      return xBlock * 50;
  }

  static double iconSize() {
    if (isMobile())
      return 15.0;
    else if (isLandScape())
      return 30.0;
    else if (isTablet())
      return 30.0;
    else if (isDesktop())
      return 35.0;
    else
      return 40.0;
  }

  static double rowFont() {
    if (isMobile())
      return 15.0;
    else if (isLandScape())
      return 15.0;
    else if (isTablet())
      return 20.0;
    else if (isDesktop() || isPlazma())
      return 22.0;
    else
      return 24.0;
  }

  static double rowFontWidth() {
    if (isMobile() || isLandScape() || isTablet())
      return xBlock * 60;
    else if (isDesktop() || isPlazma())
      return xBlock * 10;
    else
      return xBlock * 10;
  }

  static double h2() {
    if (isMobile())
      return 25.0;
    else if (isLandScape())
      return 30.0;
    else if (isTablet())
      return 30.0;
    else if (isDesktop())
      return 35.0;
    else
      return 40.0;
  }

  static double h3() {
    if (isMobile())
      return 18.0;
    else if (isLandScape())
      return 20.0;
    else if (isTablet())
      return 25.0;
    else if (isDesktop())
      return 30.0;
    else
      return 40.0;
  }

  static double h4() {
    if (isMobile())
      return 20.0;
    else if (isLandScape())
      return 30.0;
    else if (isTablet())
      return 30.0;
    else if (isDesktop())
      return 35.0;
    else
      return 40.0;
  }

  static double h6() {
    if (isMobile())
      return 15.0;
    else if (isLandScape())
      return 20.0;
    else if (isTablet())
      return 20.0;
    else if (isDesktop())
      return 25.0;
    else
      return 30.0;
  }

  static double borderBoxWidth() {
    if (isMobile())
      return xBlock * 80;
    else if (isLandScape())
      return xBlock * 65;
    else if (isTablet())
      return xBlock * 65;
    else if (isDesktop())
      return xBlock * 40;
    else
      return xBlock * 40;
  }

  static double imageBoxWidth() {
    if (isMobile())
      return xBlock * 40;
    else if (isLandScape())
      return xBlock * 40;
    else if (isTablet())
      return xBlock * 30;
    else if (isDesktop())
      return xBlock * 15;
    else
      return xBlock * 15;
  }

  static double navFont() {
    if (isMobile())
      return 15.0;
    else if (isLandScape())
      return 30.0;
    else if (isTablet())
      return 30.0;
    else if (isDesktop())
      return 15.0;
    else
      return 40.0;
  }

  static double navTitle() {
    if (isMobile())
      return 25.0;
    else if (isLandScape())
      return 30.0;
    else if (isTablet())
      return 30.0;
    else if (isDesktop())
      return 35.0;
    else
      return 40.0;
  }

  static double modalInput() {
    return xBlock * 50;
  }

  static double modalPaddingX() {
    return xBlock * 5;
  }

  static double modalPaddingY() {
    return yBlock * 20;
  }

  static double editPaddingX() {
    return xBlock * 5;
  }

  static double editPaddingY() {
    return yBlock * 5;
  }

  static bool isMobile() {
    if (width < 576)
      return true;
    else
      return false;
  }

  static bool isLandScape() {
    if (width >= 576 && width < 768)
      return true;
    else
      return false;
  }

  static bool isTablet() {
    if (width >= 768 && width < 992)
      return true;
    else
      return false;
  }

  static bool isDesktop() {
    if (width >= 992 && width < 1200)
      return true;
    else
      return false;
  }

  static bool isPlazma() {
    if (width >= 1200)
      return true;
    else
      return false;
  }
}
