import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:net_play/onboarding_screen/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Splash Screen',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 28, 5, 5),
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.deepPurple,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      home: const Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash/Netplay.png', height: 150,),
            const SizedBox(height: 30,),
            if(defaultTargetPlatform == TargetPlatform.iOS)
              CupertinoActivityIndicator(
                color: isDark ? Colors.white : Colors.black,
                radius: 20,
              )
            else
              CircularProgressIndicator(
                color: isDark ? Colors.white : Colors.black,
              )
          ],
        ),
      ),
    );
  }
}


