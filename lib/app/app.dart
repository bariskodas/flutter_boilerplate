import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/core/theme/app_theme_datas.dart';
import 'package:flutter_boilerplate/app/core/widgets/base/keyboard_focus_tracker.dart';
import 'package:flutter_boilerplate/app/l10n/app_localizations.dart';
import 'package:flutter_boilerplate/app/routes/app_router.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: KeyboardFocusTracker(
        child: MaterialApp.router(
          title: 'boilerplate',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: AppThemeDatas.lightTheme(context),
          darkTheme: AppThemeDatas.darkTheme(context),
          routerConfig: appRouter.config(),
          scrollBehavior: const MaterialScrollBehavior()
              .copyWith(physics: const ClampingScrollPhysics()),
        ),
      ),
    );
  }
}
