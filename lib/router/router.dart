import 'package:auto_route/auto_route.dart';
import 'package:godofdiscipline/screens/reg_screen/view/screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: RegisterRoute.page, path: '/'),
      ];
}
