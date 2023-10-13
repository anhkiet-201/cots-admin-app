import 'package:cots_web_admin/left-nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDelegate extends StatelessWidget {
  const AppDelegate( {super.key});
  // final App app;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: App(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: const LeftNav(),
      ),
    );
  }
}

class App with ChangeNotifier {

}
