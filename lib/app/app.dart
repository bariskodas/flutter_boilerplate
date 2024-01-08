import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/l10n/app_localizations.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp(
        title: 'boilerplate',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
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
