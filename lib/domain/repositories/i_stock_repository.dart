import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../failures/failure.dart';

abstract class IStockRepository {
  Future<Either<Failure, List<StockItemChartData>>> getStockItemChart({required String symbol});
  Future<Either<Failure, List<StockItem>>> getTrendingStocks();
}
