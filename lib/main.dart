import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zen_file_transfer/methods/share_intent.dart';
import 'package:zen_file_transfer/views/handle_intent_ui.dart';
import 'package:zen_file_transfer/views/history.dart';
import 'package:zen_file_transfer/views/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zen_file_transfer/controllers/controllers.dart';
import 'app.dart';
import 'views/receive_page.dart';
import 'views/share_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init((await getApplicationDocumentsDirectory()).path);
  await Hive.openBox('history');
  GetIt getIt = GetIt.instance;
  SharedPreferences prefInst = await SharedPreferences.getInstance();
  prefInst.get('isIntroRead') ?? prefInst.setBool('isIntroRead', false);
  getIt.registerSingleton<PercentageController>(PercentageController());
  bool externalIntent = false;
  if (Platform.isAndroid) {
    externalIntent = await handleSharingIntent();
  }

  // DeviceOrientation.portraitUp
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
          scheme: FlexScheme.hippieBlue,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 20,
          appBarOpacity: 0.95,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            blendOnColors: false,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          //fontFamily: 'ytf'
        ),
      darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.hippieBlue,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 15,
          appBarStyle: FlexAppBarStyle.background,
          appBarOpacity: 0.90,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 30,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          //fontFamily: 'ytf'
        ),
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => AnimatedSplashScreen(
              splash: 'assets/images/splash.png',

              nextScreen: prefInst.getBool('isIntroRead') == true
                  ? (externalIntent ? const HandleIntentUI() : const App())
                  : const IntroPage(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: Colors.white,
            ),
        '/home': (context) => const App(),
        '/sharepage': (context) => const SharePage(),
        '/receivepage': (context) => const ReceivePage(),
        '/history': (context) => const HistoryPage()
      },
    ),
  );
}
