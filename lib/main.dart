import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:net_play/features/app/splash_screen/splash_screen.dart';
import 'package:net_play/features/user_auth/presentation/pages/home_page.dart';
import 'package:net_play/features/user_auth/presentation/pages/login_page.dart';
import 'package:net_play/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:net_play/onboarding_screen/onboarding_screen.dart';

import 'package:net_play/reservation/reservation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDxWN6WHGN8JqY5YaHBCFeypwRUH7kSVxg",
      appId: "1:701782117616:android:99fa8150dbb0f574df0635",
      messagingSenderId: "701782117616",
      projectId: "netplay-f5fb5",
    ),
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => SplashScreen(
          child: OnboardingPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/onboarding': (context) => OnboardingPage(),
        '/reservation': (context) => BadmintonReservation(),
      },
    );
  }
}
