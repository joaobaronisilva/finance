import 'package:get/get_navigation/src/routes/get_route.dart';

import '../bindings/core_bindings.dart';
import '../presentation/presentation.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      bindings: [CoreBinding()],
      children: [
        GetPage(
          name: Routes.details,
          page: () => StockDetailView(),
        ),
      ],
    ),
  ];
}
