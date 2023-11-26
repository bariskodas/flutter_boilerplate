import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp(
        title: 'boilerplate',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.black,
          body: const Center(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
