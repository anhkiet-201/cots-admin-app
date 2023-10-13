
import 'package:cots_web_admin/app.dart';
import 'package:cots_web_admin/utils/local_storage_service.dart';
import 'package:flutter/material.dart';

void main() async {
  await LocalStorageService.initJwt();
  runApp(const AppDelegate());
}
