import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),(){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget.child!), (route) => false);
    }
    );
    super.initState();
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

