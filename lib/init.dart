import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/app/core/config/config_di.dart';

Future<void> initApp() async {
  //* di
  configDI();

  runApp(const MyApp());
}
