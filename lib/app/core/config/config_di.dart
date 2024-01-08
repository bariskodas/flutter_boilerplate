import 'package:flutter_boilerplate/app/core/config/config_di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configDI() => getIt.init();