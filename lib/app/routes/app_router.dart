import 'package:auto_route/auto_route.dart';
import 'package:flutter_boilerplate/app/modules/home/home_view.dart';
import 'package:flutter_boilerplate/app/modules/home_base/home_base_view.dart';
import 'package:flutter_boilerplate/app/modules/home_base/sub_views/home_router_view.dart';
import 'package:flutter_boilerplate/app/modules/home_base/sub_views/search_router_view.dart';
import 'package:flutter_boilerplate/app/modules/search/search_view.dart';
import 'package:flutter_boilerplate/app/modules/splash/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //? splash
        AutoRoute(
          page: SplashRoute.page,
        ),
        //? home base
        AutoRoute(
          page: HomeBaseRoute.page,
          initial: true,
          children: [
            //? home
            AutoRoute(
              page: HomeRouterRoute.page,
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                ),
              ],
            ),
            //? search
            AutoRoute(
              page: SearchRouterRoute.page,
              children: [
                AutoRoute(
                  page: SearchRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}
