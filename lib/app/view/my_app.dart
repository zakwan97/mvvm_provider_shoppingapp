import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mvvm_provider_shoppingapp/app/view/main_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  StreamSubscription<dynamic>? _sub;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Uri? incomingUri;
  // Locale locale = Locale.fromSubtags(
  //   languageCode: SharedPreferenceHandler.getPreferredLanguage(),
  // );

  // void setLocale(Locale value) {
  //   setState(() {
  //     locale = value;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _sub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Widget getHomePage() {
      return const MainPage();
      // if (!isLoggedIn) {
      //   return const LandingPage();
      // } else {
      //   return isBiometricEnabled
      //       ? const UnlockPage()
      //       : const MainPage(isReload: true);
      // }
    }

    return GestureDetector(
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // localizationsDelegates: const [
        //   S.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // locale: locale,
        // supportedLocales: S.delegate.supportedLocales,
        home: getHomePage(),
        builder: EasyLoading.init(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
