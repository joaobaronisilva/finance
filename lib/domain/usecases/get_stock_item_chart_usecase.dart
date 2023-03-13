import 'package:dartz/dartz.dart';

import '../domain.dart';
import '../entities/entities.dart';
import '../failures/failure.dart';

abstract class IGetStockItemChartUsecase {
  Future<Either<Failure, List<StockItemChartData>>> call({required String symbol});
}

class GetStockItemChartUsecase implements IGetStockItemChartUsecase {
  final IStockRepository _repository;

  GetStockItemChartUsecase(this._repository);

  @override
  Future<Either<Failure, List<StockItemChartData>>> call({required String symbol}) async =>
      _repository.getStockItemChart(symbol: symbol);
}
