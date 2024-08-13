import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomPageRoute<T> extends MaterialWithModalsPageRoute<T> {
  final Duration customTransitionDuration;
  final bool fullscreenDialog;

  CustomPageRoute({
    required super.builder,
    required this.customTransitionDuration,
    this.fullscreenDialog = false,
  }) : super(fullscreenDialog: fullscreenDialog);

  @override
  Duration get transitionDuration => customTransitionDuration;
}
