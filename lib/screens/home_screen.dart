
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naser/controllers/home_controller.dart';

import 'widgets/asset_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller){
          if(controller.loading){
            return Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () async{
              await controller.getAssets();
            },
            child: ListView.builder(
              itemCount: controller.assets.length,
              itemBuilder: (c, i) => AssetItem(controller.assets[i]),
            ),
          );
        },
      ),
    );
  }
}
