import 'package:get/get.dart';

import '../../../domain/domain.dart';

class StockDetailController extends GetxController with StateMixin<List<StockItemChartData>> {
  StockDetailController(this._iGetStockItemChartUsecase);

  final IGetStockItemChartUsecase _iGetStockItemChartUsecase;

  @override
  void onInit() {
    super.onInit();
    final symbol = Get.arguments.symbol;
    _iGetStockItemChartUsecase(symbol: symbol).then(
      (value) => value.fold(
        (l) => change(null, status: RxStatus.error()),
        (r) => change(r, status: RxStatus.success()),
      ),
    );
  }
}
