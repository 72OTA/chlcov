import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chlcov/ui/constant/constant.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushNamed(mainPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [darkSalmon, seaGreen,midnightBlue, steelBlue, slateGray],
            begin: Alignment(-1.0, -1.0),
            end: Alignment(1.0, 1.0),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'CHL',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'COV',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: txtPink,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              Text(
                'Chile\nSantiago\nCOVID-19',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5.copyWith(
                  color: white,
                  height: 1.5,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
