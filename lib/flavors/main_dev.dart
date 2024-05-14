import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/init.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() async {
  FlavorConfig(
    color: Colors.green,
    name: 'DEV',
    location: BannerLocation.topEnd,
  );

  await initApp();
}
