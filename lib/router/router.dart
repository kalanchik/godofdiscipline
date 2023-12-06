import 'package:auto_route/auto_route.dart';
import 'package:godofdiscipline/screens/create_activity_screen/view/screen.dart';
import 'package:godofdiscipline/screens/main_screen/view/screen.dart';
import 'package:godofdiscipline/screens/profile_screen/view/screen.dart';
import 'package:godofdiscipline/screens/reg_screen/view/screen.dart';
import 'package:godofdiscipline/screens/search_screen/view/screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: RegisterRoute.page, path: '/'),
        AutoRoute(page: MainRoute.page, path: '/main'),
        AutoRoute(page: SearchRoute.page, path: '/search'),
        AutoRoute(page: CreateActivityRoute.page, path: '/create'),
        AutoRoute(page: ProfileRoute.page, path: '/profile'),
      ];
}
