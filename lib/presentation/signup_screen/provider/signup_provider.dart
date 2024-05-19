import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/signup_model.dart';

/// A provider class for the SignupScreen.
///
/// This provider manages the state of the SignupScreen, including the
/// current signupModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignupProvider extends ChangeNotifier {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  SignupModel signupModelObj = SignupModel();

  bool isShowPassword = true;

  bool isShowPassword1 = true;

  bool iAgreeWithTermsSection = false;

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void changePasswordVisibility1() {
    isShowPassword1 = !isShowPassword1;
    notifyListeners();
  }

  void changeCheckBox(bool value) {
    iAgreeWithTermsSection = value;
    notifyListeners();
  }
}
