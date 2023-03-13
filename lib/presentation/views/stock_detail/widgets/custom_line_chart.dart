import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../infrastructure/infrastructure.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({super.key, this.titlesData, this.lineBarsData, this.lineTouchData});

  /// Customize titles data.
  final FlTitlesData? titlesData;

  /// Handles touch behaviors and responses.
  final LineTouchData? lineTouchData;

  /// [LineChart] draws some lines in various shapes and overlaps them.
  final List<LineChartBarData>? lineBarsData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.responsiveHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-5, -3),
            spreadRadius: -20,
            blurRadius: 5,
            color: Colors.black54,
          )
        ],
      ),
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.white,
          titlesData: titlesData,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xFFF0F1F1),
                strokeWidth: 1,
              );
            },
          ),
          lineTouchData: lineTouchData,
          lineBarsData: lineBarsData,
        ),
        swapAnimationDuration: const Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear, // Optional
      ),
    );
  }
}
