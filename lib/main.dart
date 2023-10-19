
import 'package:cots_web_admin/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = App();
  await app.initApp();
  runApp(AppDelegate(app));
}
