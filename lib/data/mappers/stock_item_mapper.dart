import '../../domain/domain.dart';

abstract class StockItemMapper {
  static StockItem fromJson(Map<String, dynamic> json) {
    return StockItem(
      symbol: json['symbol'],
      longName: json['longName'],
      averageAnalystRating: json['averageAnalystRating'],
      fiftyDayAverage: json['fiftyDayAverage'],
      regularMarketDayRange: json['regularMarketDayRange'],
      regularMarketPreviousClose: json['regularMarketPreviousClose'],
    );
  }
}
