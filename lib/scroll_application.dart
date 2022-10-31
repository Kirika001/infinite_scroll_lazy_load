import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll/ui/splash/splash_screen.dart';


class ScrollApplication extends StatelessWidget {
  const ScrollApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'infinite scroll - lazy load',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}