import 'package:flutter/material.dart';
import 'package:infinite_scroll/binding/global_binding.dart';
import 'package:infinite_scroll/scroll_application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GlobalBindings().dependencies();
  runApp(const ScrollApplication());
}
