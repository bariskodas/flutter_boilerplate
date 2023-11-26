import 'package:flutter_boilerplate/init.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: 'assets/env/prod.env');
  print(dotenv.env['BASE_URL']);

  await initApp();
}
