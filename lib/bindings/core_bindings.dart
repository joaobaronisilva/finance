import 'package:get/get.dart';

import '../data/data.dart';
import '../domain/domain.dart';
import '../infrastructure/infrastructure.dart';
import '../presentation/controllers/home/home_controller.dart';
import '../presentation/controllers/stock_detail/stock_detail_controller.dart';

///TODO: Separar bindings
class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHttpClient>(() => HttpClient(baseUrl: 'https://query2.finance.yahoo.com/'));
    Get.lazyPut<IStockDatasource>(() => StockDatasource(client: Get.find<IHttpClient>()));
    Get.lazyPut<IStockRepository>(() => StockRepository(Get.find<IStockDatasource>()));
    Get.lazyPut<IGetStockItemChartUsecase>(() => GetStockItemChartUsecase(Get.find<IStockRepository>()), fenix: true);
    Get.lazyPut<IGetTrendingStocksUsecase>(() => GetTrendingStocksUsecase(Get.find<IStockRepository>()), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(Get.find<IGetTrendingStocksUsecase>()));
    Get.lazyPut<StockDetailController>(() => StockDetailController(Get.find<IGetStockItemChartUsecase>()), fenix: true);
  }
}
