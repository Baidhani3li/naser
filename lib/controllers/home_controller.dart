import 'dart:convert';

import 'package:get/get.dart';
import 'package:naser/controllers/auth_controller.dart';
import 'package:naser/models/asset_model.dart';
import 'package:naser/models/user_model.dart';
import 'package:naser/services/remote_service.dart';

class HomeController extends GetxController {

  List<AssetModel> assets = [];
  bool loading = false;

  String get _token => Get.find<AuthController>().token;

  Future<void> getAssets() async {
    print(_token);
    loading = true;
    update();
    try{
      final response = await RemoteService.assets(token: _token);
      print(response.body);
      if(response.statusCode == 200){
        final jsonData = json.decode(response.body);
        assets = (jsonData['data'] as List).map((e) => AssetModel.fromJson(e)).toList();
      }
    }catch(e){
      print(e.toString());
    }
    loading = false;
    update();
  }

  @override
  void onInit() {
    getAssets();
    super.onInit();
  }
}
