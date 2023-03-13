import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controllers/home/home_controller.dart';
import 'widgets/stock_item_tile.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                const SliverAppBar(
                  backgroundColor: Color(0xFF2B5BFC),
                  title: Text('Trending Stocks'),
                  floating: true,
                  snap: true,
                )
              ],
          body: controller.obx((state) {
            if (state == null || state.isEmpty) {
              return const Center(
                child: Text('There\'s no trending stocks'),
              );
            }

            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final stockItem = state[index];
                return StockItemTile(item: stockItem);
              },
            );
          })),
    );
  }
}
