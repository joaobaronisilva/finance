import '../../domain/domain.dart';

abstract class StockItemChartDataMapper {
  static StockItemChartData fromJson(Map<String, dynamic> json, {required int index}) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(json['timestamp'][index] * 1000);
    final double close = json['indicators']['quote'][0]['close'][index];
    final double open = json['indicators']['quote'][0]['open'][index];
    final double high = json['indicators']['quote'][0]['high'][index];
    final double low = json['indicators']['quote'][0]['low'][index];
    final int volume = json['indicators']['quote'][0]['volume'][index];
    return StockItemChartData(date: date, close: close, open: open, high: high, low: low, volume: volume);
  }
}
