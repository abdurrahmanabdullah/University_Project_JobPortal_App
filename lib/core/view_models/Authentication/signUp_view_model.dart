import 'package:ecommerce/core/enums/view_state.dart';
import 'package:ecommerce/core/services/Authentication/sign_Up.dart';
import 'package:ecommerce/locator.dart';
import 'package:flutter/widgets.dart';

import '../base_view_model.dart';

class SignUpViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey();
  final SignUp _SignIn = locator<SignUp>();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  Future<bool>? signUpAPI() async {
    setViewState(ViewState.busy);

    int? returnedStatusCode = await _SignIn.signUnSendRequest(
      nameController.text,
      passwordController.text,
      emailController.text,
    );

    setViewState(ViewState.idle);
    print('Return StatusCode is : $returnedStatusCode');
    return returnedStatusCode == 200 ? true : false;
  }

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void changeIsPasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  String? mobileNumberValidator(String value) {
    String pattern = r'(^(01)[0-9]{9}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'need mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'give correct mobile number';
    }
    return null;
  }

  String? passwordValidator(String value) {
    print(value);
    String pattern = r"(^[a-zA-Z\d@%+'!#$^?:.~\-_.]{6,256}$)";
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Need Password';
    } else if (value.length < 6) {
      return 'Need minimum  6 words';
    } else if (!regExp.hasMatch(value)) {
      return 'wrong Password';
    }

    return null;
  }
}
