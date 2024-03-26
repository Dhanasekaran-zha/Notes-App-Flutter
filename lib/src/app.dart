import 'package:flutter/material.dart';
import 'package:local_notes_app/src/res/strings.dart';
import 'package:local_notes_app/src/views/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.APP_NAME,
      theme: ThemeData(
        useMaterial3: true
      ),
      home: Home(),
    );
  }
}
