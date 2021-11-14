import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'home/HomeScreen.dart';
import 'home/hadeth/hadeethDetailsScreen.dart';
import 'home/quran/SuraDetailsScreen.dart';
import 'providers/AppConfig.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown
]);
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: const MyApp()));
}

class MyThemeData {
  static const Color primaryColor = Color.fromARGB(255, 183, 147, 95);
  static const Color DarkPrimaryColor = Color.fromARGB(255, 20, 26, 46);
  static const Color darkAccentColor = Color.fromARGB(255, 250, 204, 29);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        color: Colors.transparent,
        elevation: 0),
    primaryColor: MyThemeData.primaryColor,
  );


  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.yellow,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
        color: Colors.transparent,
        elevation: 0),
    primaryColor: MyThemeData.DarkPrimaryColor,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'islami',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        SuraDetailsScreen.routeName: (buildContext) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (buildContext) => HadethDetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
