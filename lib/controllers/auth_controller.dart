import 'dart:convert';

import 'package:get/get.dart';
import 'package:naser/models/user_model.dart';
import 'package:naser/screens/home_screen.dart';
import 'package:naser/services/remote_service.dart';

class AuthController extends GetxController {

  UserModel? user;
  String token = '';

  void _showLoading(){
    Get.defaultDialog(
      title: ''
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try{
      final response = await RemoteService.login(email: email, password: password);
      print(response.body);
      if(response.statusCode == 200){
        final responseJson = json.decode(response.body);
        user = UserModel.fromJson(responseJson['data']);
        token = responseJson['token'];
        Get.offAll(() => HomeScreen());
      }
    }catch(e){
      print(e.toString());
    }

  }
}
