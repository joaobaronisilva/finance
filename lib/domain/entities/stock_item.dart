import 'package:equatable/equatable.dart';

class StockItem extends Equatable {
  final String symbol;
  final String longName;
  final String averageAnalystRating;
  final double fiftyDayAverage;
  final String regularMarketDayRange;
  final double regularMarketPreviousClose;

  const StockItem({
    required this.symbol,
    required this.longName,
    required this.averageAnalystRating,
    required this.fiftyDayAverage,
    required this.regularMarketDayRange,
    required this.regularMarketPreviousClose,
  });

  @override
  List<Object?> get props => [symbol, longName];
}
