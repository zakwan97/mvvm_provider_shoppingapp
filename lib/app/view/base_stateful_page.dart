import 'package:flutter/material.dart';
import 'package:mvvm_provider_shoppingapp/app/constant/color.dart';
import 'package:mvvm_provider_shoppingapp/app/model/network/my_response.dart';

abstract class BaseStatefulPage extends StatefulWidget {
  const BaseStatefulPage({super.key});
}

abstract class BaseStatefulState<Page extends StatefulWidget>
    extends State<Page> {
  PreferredSizeWidget? appbar() => null;
  Widget body();
  Widget? floatingActionButton();
  bool topSafeAreaEnabled() => true;
  bool bottomSafeAreaEnabled() => true;
  Color backgroundColor() => CustomColors.bgColor;

  bool isLoading(ResponseStatus status) => status == ResponseStatus.LOADING;

  Widget buildLoadingMoreIndicator() => Padding(
        padding: const EdgeInsets.all(5),
        child: Transform.scale(
          scale: 0.5,
          child: buildLoadingIndicator(),
        ),
      );

  Widget buildLoadingIndicator() => const Center(
        child: CircularProgressIndicator(color: CustomColors.primaryColor),
      );

  void showSnackBarMessage(String message) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: CustomColors.textDefault,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Each Page are meant to be build with a [Scaffold] structure
  /// include with [AppBar], [Body], [FloatingActionButton]
  /// Additional handling for [urgentError] is included here,
  /// so that all inheriting classes would not needed to handle it repeatedly.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: appbar(),
        body: SafeArea(
          top: topSafeAreaEnabled(),
          bottom: bottomSafeAreaEnabled(),
          child: body(),
        ),
        backgroundColor: backgroundColor(),
        floatingActionButton: floatingActionButton(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
