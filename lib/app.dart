import 'package:cots_web_admin/api/model/User.dart';
import 'package:cots_web_admin/left-nav.dart';
import 'package:cots_web_admin/pages/login/Login.dart';
import 'package:cots_web_admin/pages/login/LoginProvider.dart';
import 'package:cots_web_admin/utils/local_storage_service.dart';
import 'package:cots_web_admin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDelegate extends StatelessWidget {
  const AppDelegate(this.app, {super.key});
  final App app;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: app,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: app.user == null ? ChangeNotifierProvider(
          create: (context) => LoginProvider(context),
          child: const Login(),
        ) : const LeftNav(),
        // home: Scaffold(
        //   body: ChangeNotifierProvider(
        //     create: (loginContext) => LoginProvider(loginContext),
        //     child: const Login(),
        //   ),
        // ),
      ),
    );
  }
}

class App with ChangeNotifier {
  final _service = LocalStorageService.shared;
  User? _user;

  User? get user => _user;

  set user(User? value) {
    _user = value;
    if(value != null) {
      _service.saveObject(key: LocalStorageKey.userKey, object: value);
    } else {
      _service.drop(key: LocalStorageKey.userKey);
    }
    notifyListeners();
  }

  Future<void> initApp() async {
    LocalStorageService.jwt = await _service.getValue(LocalStorageKey.jwtKey);
    user = await _service.getObject(key: LocalStorageKey.userKey, type: User.new);
    printDebug(label: 'Init app with user', user?.toJson());
  }
}
