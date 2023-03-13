import 'package:dartz/dartz.dart';

import '../../domain/domain.dart';
import '../data.dart';

class StockRepository implements IStockRepository {
  final IStockDatasource _datasource;

  StockRepository(this._datasource);

  @override
  Future<Either<Failure, List<StockItemChartData>>> getStockItemChart({required String symbol}) async {
    try {
      final result = await _datasource.getStockItemChart(symbol: symbol);
      return Right(result);
    } catch (_) {
      return const Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<StockItem>>> getTrendingStocks() async {
    try {
      final result = await _datasource.getTrendingStocks();
      return Right(result);
    } catch (_) {
      return const Left(Failure());
    }
  }
}
