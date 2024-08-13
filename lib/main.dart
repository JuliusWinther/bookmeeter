// ignore_for_file: avoid_print

import 'package:bookmeeter/Themes.dart';
import 'package:bookmeeter/routes.dart';
import 'package:bookmeeter/routes/HomePage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(
        /*DevicePreview(
        enabled: true,
        builder: (context) => */
        BookMeeter(), // Wrap your app
      ));

  //runApp(BookMeeter());
}

class BookMeeter extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  BookMeeter();

  final Future<FirebaseApp> initialization = Firebase.initializeApp();

  @override
  _BookMeeterState createState() => _BookMeeterState();

  static _BookMeeterState? of(BuildContext context) =>
      context.findAncestorStateOfType<_BookMeeterState>();
}

class _BookMeeterState extends State<BookMeeter> {
  /// 1) our themeMode "state" field
  ///
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

    //for (int i = 0; i < 46; i++) precacheImage(Ass, context);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    /*for (int i = 1; i <= 46; i++) {
      Image img = Image.asset("images/slider/$i.jpg");
      precacheImage(img.image, context);
    }*/ //Load images in cache
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BookMeeter",
      debugShowCheckedModeBanner: false,
      /*useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,*/
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: _themeMode, // 2) ← ← ← use "state" field here //////////////
      home: FutureBuilder(
          future: widget.initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error while building");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return HomePage();
            }

            return const Center(
                child: SizedBox(
                    height: 85, width: 85, child: CircularProgressIndicator()));
          }),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

  /// 3) Call this to change theme from any context using "of" accessor
  /// e.g.:
  /// MyApp.of(context).changeTheme(ThemeMode.dark);
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  bool isLight() {
    if (_themeMode == ThemeMode.light) {
      return true;
    } else if (_themeMode == ThemeMode.dark) {
      return false;
    }
    return true;
  }
}








/*void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ));
}*/