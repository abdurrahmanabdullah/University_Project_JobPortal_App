import 'package:get_it/get_it.dart';

import 'core/services/Authentication/sign_Up.dart';
import 'core/services/Authentication/sign_in.dart';
import 'core/services/product.dart';
import 'core/services/profile.dart';
import 'core/services/registration.dart';
import 'core/view_models/Authentication/signIn_view_model.dart';
import 'core/view_models/Authentication/signUp_view_model.dart';
import 'core/view_models/base_view_model.dart';
import 'core/view_models/profile_view_model.dart';
import 'core/view_models/registration_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => BaseViewModel());
  locator.registerFactory(() => RegisterViewModel());
  locator.registerFactory(() => GetProfileViewModel());
  locator.registerLazySingleton(() => Registration());
  locator.registerLazySingleton(() => GetAPI());
  locator.registerLazySingleton(() => Profile());

  ///sign up
  locator.registerFactory(() => SignUpViewModel());
  locator.registerLazySingleton(() => SignUp());

  ///sign in
  locator.registerFactory(() => SignInViewModel());
  locator.registerLazySingleton(() => SignIn());
}
