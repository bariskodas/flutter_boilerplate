import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/init.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() async {
  await dotenv.load(fileName: 'assets/env/dev.env');
  print(dotenv.env['BASE_URL']);

  FlavorConfig(
    color: Colors.green,
    name: 'DEV',
    location: BannerLocation.topEnd,
  );

  await initApp();
}
