import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_pages.dart';
import '../constants/local_storage_keys.dart';
import '../data/local_source/local_storage.dart';

class OnboardingMiddlewares extends GetMiddleware {
  @override
  int? get priority => 1;

  LocalStorage localStorage = LocalStorage();
  @override
  RouteSettings? redirect(String? route) {
    bool? isOnBoarding = localStorage.readValue(LocalStorageKeys.onBoarding);
    if (isOnBoarding == false || isOnBoarding == null) {
      return const RouteSettings(name: Routes.ONBOARD1);
    } else {
      return null;
    }
  }
}
