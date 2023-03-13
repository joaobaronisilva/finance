import 'package:equatable/equatable.dart';

class StockItemChartData extends Equatable {
  final DateTime date;
  final double open;
  final double high;
  final double low;
  final double close;
  final int volume;

  const StockItemChartData({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  @override
  List<Object?> get props => [date, open, high, low, close, volume];
}
