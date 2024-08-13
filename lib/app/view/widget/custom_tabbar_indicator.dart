import 'package:flutter/material.dart';
import 'package:mvvm_provider_shoppingapp/app/constant/color.dart';

class CustomBottomNavTabbarIndicator extends BoxDecoration {
  final BoxPainter _painter;

  CustomBottomNavTabbarIndicator() : _painter = TabIndicatorPainter();

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class TabIndicatorPainter extends BoxPainter {
  final Paint _paint;

  TabIndicatorPainter()
      : _paint = Paint()
          ..color = CustomColors.primaryColor
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final double _xPos = offset.dx + cfg.size!.width / 2;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(_xPos - 35, 0, _xPos + 35, 3),
        bottomLeft: const Radius.circular(5.0),
        bottomRight: const Radius.circular(5.0),
      ),
      _paint,
    );
  }
}

class CustomTabbarIndicator extends BoxDecoration {
  final BoxPainter _painter;

  CustomTabbarIndicator() : _painter = _TabIndicatorPainter();

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _TabIndicatorPainter extends BoxPainter {
  final Paint _paint;

  _TabIndicatorPainter()
      : _paint = Paint()
          ..color = CustomColors.primaryColor
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final double _xPos = offset.dx + cfg.size!.width / 2;
    final double yPos = cfg.size!.height;
    final double indicatorWidth = cfg.size!.width * 1;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(_xPos - (indicatorWidth / 2), yPos - 3,
            _xPos + (indicatorWidth / 2), yPos),
        topLeft: const Radius.circular(5.0),
        topRight: const Radius.circular(5.0),
      ),
      _paint,
    );
  }
}
