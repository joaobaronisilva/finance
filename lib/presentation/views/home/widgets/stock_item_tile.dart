import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../domain/domain.dart';
import '../../../../infrastructure/infrastructure.dart';
import '../../../../routes/routes.dart';

class StockItemTile extends StatelessWidget {
  const StockItemTile({super.key, required this.item});

  final StockItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.details, arguments: item),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.sm.width, vertical: Spacing.xxs.height),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Spacing.sm.width, vertical: Spacing.xxs.height),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: const [
            BoxShadow(
              offset: Offset(3, 3),
              spreadRadius: -3,
              blurRadius: 5,
              color: Colors.black54,
            )
          ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.longName),
              Text(item.symbol),
            ],
          ),
        ),
      ),
    );
  }
}
