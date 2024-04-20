import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:net_play/score/screens/home_screen.dart';
import 'package:page_transition/src/enum.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Bad Pairs',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.black,
      ),
      home: const MyHomePage(title: 'Welcome To Bad Pairs !'),
    );
  }
}
