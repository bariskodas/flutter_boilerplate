import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/app/core/config/config_di.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initApp() async {
  //* di
  configDI();

  //* cache directory
  String cacheDir = (await getApplicationCacheDirectory()).path;
  GetIt.I.registerFactory<String>(() => cacheDir, instanceName: 'cacheDir');

  runApp(const App());
}
