import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project1/app/modules/favouritepage/views/favouritepage_view.dart';
import 'package:project1/app/modules/login/bindings/login_binding.dart';
import 'package:project1/app/modules/login/views/login_view.dart';
import 'package:project1/core/data/local_source/local_storage.dart';
import 'package:project1/core/data/remot_source/base_api_client.dart';
import 'package:project1/core/utils/dialogs/error_dialog.dart';
import 'package:project1/core/utils/dialogs/loading_dialog.dart';

import '../../core/constants/api_const.dart';
import '../modules/profile/views/profile_view.dart';

class DrawerElements extends StatelessWidget {
  const DrawerElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 35.0),
          child: Column(
            children: [
              Container(
                width: 96.w,
                height: 96.w,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/profile.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Programmer X",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Column(
          children: [
            ListTile(
              leading: SvgPicture.asset(
                "assets/svg/profile.svg",
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              trailing: SvgPicture.asset(
                "assets/svg/Arrow.svg",
                color: Colors.white,
              ),
              onTap: () {
                Get.to(() => ProfileView());
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/svg/bag2.svg",
                color: Colors.white,
              ),
              title: Text(
                "MyCart",
                style: TextStyle(color: Colors.white),
              ),
              trailing: SvgPicture.asset(
                "assets/svg/Arrow.svg",
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/svg/heart.svg",
                color: Colors.white,
              ),
              title: Text(
                "Favorite",
                style: TextStyle(color: Colors.white),
              ),
              trailing: SvgPicture.asset(
                "assets/svg/Arrow.svg",
                color: Colors.white,
              ),
              onTap: () {
                Get.to(FavouritepageView());
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/svg/orders.svg",
              ),
              title: Text(
                "Orders",
                style: TextStyle(color: Colors.white),
              ),
              trailing: SvgPicture.asset(
                "assets/svg/Arrow.svg",
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/svg/notification.svg",
                color: Colors.white,
              ),
              title: Text(
                "Notification",
                style: TextStyle(color: Colors.white),
              ),
              trailing: SvgPicture.asset(
                "assets/svg/Arrow.svg",
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/svg/settings.svg",
              ),
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
              trailing: SvgPicture.asset(
                "assets/svg/Arrow.svg",
                color: Colors.white,
              ),
              onTap: () {},
            ),
            const SizedBox(
              height: 13,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
          ],
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/svg/logout.svg",
          ),
          title: Text(
            "Log out",
            style: TextStyle(color: Colors.white),
          ),
          trailing: SvgPicture.asset(
            "assets/svg/Arrow.svg",
            color: Colors.white,
          ),
          onTap: () async {
            LoadingDialog().show();
            var response = await BaseApiClient.post(
                url: ApiConst.logout,
                converter: (e) {
                  return (e);
                });
            response.fold((l) {
              showErrorDialog(l);
            }, (r) {
              Get.offAll(() => LoginView(), binding: LoginBinding());
              LocalStorage().clearToken();
            });
          },
        ),
      ],
    );
  }
}
