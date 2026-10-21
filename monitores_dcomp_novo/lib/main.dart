
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'Views/splash_screen.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monitores DCOMP',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
        },
      ),
      home: const SplashScreen(),
    );
  }
}
