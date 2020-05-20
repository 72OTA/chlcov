import 'package:flutter/material.dart';
import 'package:chlcov/config/chlcovapp.dart';
import 'package:chlcov/ui/constant/injector.dart' as di;

void main() {
  di.init();
  runApp(ChlcovApp());
}