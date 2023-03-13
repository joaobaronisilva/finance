import 'package:get/get.dart';

import '../../../domain/domain.dart';

class HomeController extends GetxController with StateMixin<List<StockItem>> {
  HomeController(this._iGetTrendingStocksUsecase);

  /// inject repo abstraction dependency
  final IGetTrendingStocksUsecase _iGetTrendingStocksUsecase;

  /// When the controller is initialized, make the http request
  @override
  void onInit() {
    super.onInit();
    _iGetTrendingStocksUsecase().then(
      (value) => value.fold(
        (l) => change(null, status: RxStatus.error()),
        (r) => change(r, status: RxStatus.success()),
      ),
    );
  }
}
