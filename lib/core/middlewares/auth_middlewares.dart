import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../app/routes/app_pages.dart';
import '../data/local_source/local_storage.dart';

class AuthMiddlewares extends GetMiddleware {
  @override
  int? get priority => 2;
  LocalStorage localStorage = LocalStorage();

  @override
  RouteSettings? redirect(String? route) {
    bool? isLogged = localStorage.getToken != null;
    if (!isLogged) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}
