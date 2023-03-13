import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'infrastructure/infrastructure.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig.init().config(constraints, orientation);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            enableLog: true,
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
          );
        },
      );
    });
  }
}
