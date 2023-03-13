import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class IGetTrendingStocksUsecase {
  Future<Either<Failure, List<StockItem>>> call();
}

class GetTrendingStocksUsecase implements IGetTrendingStocksUsecase {
  final IStockRepository _repository;

  GetTrendingStocksUsecase(this._repository);

  @override
  Future<Either<Failure, List<StockItem>>> call() async => _repository.getTrendingStocks();
}
