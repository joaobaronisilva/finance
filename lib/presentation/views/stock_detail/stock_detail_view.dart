import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';
import '../../controllers/stock_detail/stock_detail_controller.dart';
import 'widgets/custom_line_chart.dart';

class StockDetailView extends GetView<StockDetailController> {
  StockDetailView({super.key});

  final StockItem stockItem = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: Color(0xFF2B5BFC),
                  expandedHeight: 120.responsiveHeight + kToolbarHeight,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.only(top: kToolbarHeight, left: Spacing.md.width),
                    child: Text(
                      stockItem.longName,
                      style: TextStyle(
                        fontSize: 30.fontSize,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Spacing.md.width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70.responsiveHeight),
                  const Text('Last 30 trading sessions: '),
                  SizedBox(height: 20.responsiveHeight),
                  controller.obx(
                    (state) {
                      return CustomLineChart(
                        lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Colors.black87,
                            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                              return touchedBarSpots.map((barSpot) {
                                final flSpot = barSpot;

                                TextAlign textAlign;
                                switch (flSpot.x.toInt()) {
                                  case 1:
                                    textAlign = TextAlign.left;
                                    break;
                                  case 5:
                                    textAlign = TextAlign.right;
                                    break;
                                  default:
                                    textAlign = TextAlign.center;
                                }

                                return LineTooltipItem(
                                  'Open ',
                                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, height: 1.5),
                                  children: [
                                    TextSpan(
                                      text: ' ${flSpot.y.toStringAsPrecision(5)} ',
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                  textAlign: textAlign,
                                );
                              }).toList();
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) => Text(state![value.toInt()].date.dayMonth,
                                  style: TextStyle(color: Colors.black54, fontSize: 10.fontSize, height: 2)),
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              // interval: 1.5,
                              getTitlesWidget: (value, meta) => Text(value.toStringAsPrecision(2),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 10.fontSize,
                                  )),
                            ),
                          ),
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            color: Color(0xFF2B5BFC),
                            isCurved: true,
                            belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  begin: FractionalOffset(0.95, 0.1),
                                  end: FractionalOffset.bottomRight,
                                  colors: [
                                    Color(0xFF2B5BFC),
                                    Color(0xFFEEF2FF),
                                    Colors.white,
                                  ].map((color) => color.withOpacity(0.3)).toList(),
                                )),
                            dotData: FlDotData(
                              show: true,
                              getDotPainter: (spot, percent, barData, index) {
                                return FlDotCirclePainter(
                                  radius: 1,
                                  color: Colors.white,
                                  strokeWidth: 1,
                                  strokeColor: Colors.amberAccent,
                                );
                              },
                              checkToShowDot: (spot, barData) {
                                return false;
                              },
                            ),
                            spots: state!.asMap().entries.map((item) {
                              return FlSpot(item.key.toDouble(), item.value.open);
                            }).toList(),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20.responsiveHeight),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Average Analyst Rating: ${stockItem.averageAnalystRating}'),
                      Text('Fifty Day Average: ${stockItem.fiftyDayAverage}'),
                      Text('Regular Market Day Range: ${stockItem.regularMarketDayRange}'),
                      Text('Regular Market Previous Close: ${stockItem.regularMarketPreviousClose}'),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
