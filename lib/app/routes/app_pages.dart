import 'package:get/get.dart';
import 'package:project1/core/middlewares/auth_middlewares.dart';
import 'package:project1/core/middlewares/onboarding_middlewares.dart';

import '../modules/favouritepage/bindings/favouritepage_binding.dart';
import '../modules/favouritepage/views/favouritepage_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboard1/bindings/onboard1_binding.dart';
import '../modules/onboard1/views/onboard1_view.dart';
import '../modules/onboard2/bindings/onboard2_binding.dart';
import '../modules/onboard2/views/onboard2_view.dart';
import '../modules/onboard3/bindings/onboard3_binding.dart';
import '../modules/onboard3/views/onboard3_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/registeraccount/bindings/registeraccount_binding.dart';
import '../modules/registeraccount/views/registeraccount_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        middlewares: [OnboardingMiddlewares(), AuthMiddlewares()]),
    GetPage(
      name: _Paths.FAVOURITEPAGE,
      page: () => const FavouritepageView(),
      binding: FavouritepageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD1,
      page: () => const Onboard1View(),
      binding: Onboard1Binding(),
    ),
    GetPage(
      name: _Paths.ONBOARD2,
      page: () => const Onboard2View(),
      binding: Onboard2Binding(),
    ),
    GetPage(
      name: _Paths.ONBOARD3,
      page: () => const Onboard3View(),
      binding: Onboard3Binding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTERACCOUNT,
      page: () => const RegisteraccountView(),
      binding: RegisteraccountBinding(),
    ),
  ];
}
