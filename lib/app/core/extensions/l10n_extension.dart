import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/l10n/app_localizations.dart';

extension L10NExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}
