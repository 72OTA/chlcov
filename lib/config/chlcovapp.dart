import 'package:flutter/material.dart';
import 'package:chlcov/config/routes/routes.dart';
import 'package:chlcov/ui/constant/constant.dart';

class ChlcovApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      initialRoute: splashPage,
      onGenerateRoute: Routes().onGenerateRoute,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Poppins',
        primaryColor: Colors.indigo,
      ),
    );
  }
}