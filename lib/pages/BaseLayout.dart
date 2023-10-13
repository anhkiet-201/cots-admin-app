import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, required this.title, required this.child, this.useBackButton = false, this.actions = const []});
  final String title;
  final Widget child;
  final List<Widget> actions;
  final bool useBackButton;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 72,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      if(useBackButton)
                        GestureDetector(
                          child: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.arrow_back_rounded),
                          ),
                          onTap: () {
                            Navigator.maybeOf(context)?.pop();
                          },
                        ),
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      ...actions
                    ],
                  ),
                ),
              ),
              Expanded(
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
