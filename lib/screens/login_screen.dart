import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naser/controllers/auth_controller.dart';
import 'package:naser/utils/shared_widgets/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authCtrl = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  void _login() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    _authCtrl.login(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FlutterLogo(
                  size: 250,
                ),
                CustomFormField(
                  value: 'naser@test.com',
                  label: 'email',
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    email = val!;
                  },
                ),
                CustomFormField(
                  value: 'password',
                  label: 'password',
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    password = val!;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child:
                      ElevatedButton(onPressed: _login, child: Text('Login')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
