import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/core/theme/app_theme_datas.dart';
import 'package:flutter_boilerplate/app/core/widgets/base/keyboard_focus_tracker.dart';
import 'package:flutter_boilerplate/app/l10n/app_localizations.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: KeyboardFocusTracker(
        child: MaterialApp(
          title: 'boilerplate',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: AppThemeDatas.lightTheme(context),
          darkTheme: AppThemeDatas.darkTheme(context),
          home: Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Hello World'),
            ),
          ),
        ),
      ),
    );
  }
}
