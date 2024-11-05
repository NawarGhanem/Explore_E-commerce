import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project1/app/modules/favouritepage/views/favouritepage_view.dart';
import 'package:project1/app/modules/profile/views/profile_view.dart';
import 'package:project1/app/widget/animated_container_item.dart';
import 'package:project1/app/widget/drawer.dart';
import 'package:project1/app/widget/productcard.dart';
import '../../../widget/bottom_navigation_bar.dart';
import '../../../widget/home_page_button.dart';
import '../controllers/buttonController.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final ButtonController buttonController = Get.put(ButtonController());

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 35.0),
              child: Column(
                children: [
                  Container(
                    width: 96,
                    height: 96,
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
                    Get.to(ProfileView());
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
                  onTap: () {},
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
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        actions: [
          Icon(
            Icons.shopping_bag_outlined,
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                Get.to(CustomDrawer());
              },
              child: Icon(Icons.abc))
        ],
        title: const Text(
          'Explore',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: SvgPicture.asset("assets/svg/search.svg")),
                          hintText: "   Looking for ......",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefix: Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                          isDense: true,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: FloatingActionButton(
                      shape: CircleBorder(),
                      onPressed: () {
                        Get.to(FavouritepageView());
                      },
                      backgroundColor: Colors.green.shade400,
                      child: Center(
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.width > 500 ? 5 : 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2.5,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Obx(
                    () => InkWell(
                      onTap: () {
                        buttonController.selectedIndex(index);
                      },
                      child: AnimatedContainerItem(
                        color: buttonController.selectedIndex.value == index
                            ? const Color.fromRGBO(166, 215, 241, 0.6)
                            : Colors.white,
                        text: getButtonText(index),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular T-shirt",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: 400,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(2, (index) {
                    return Center(
                      child: ProductCard(index: index),
                    );
                  }),
                ),
              )
              // GridView.builder(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 8.0,
              //     mainAxisSpacing: 8.0,
              //     childAspectRatio: 2.5,
              //   ),
              //   itemCount: 2,
              //   itemBuilder: (context, index) {
              //     return Card(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Image.asset(
              //             "assets/images/profile.png",
              //             height: 140,
              //             width: 140,
              //           ),
              //           Text("ssssssssssss"),
              //           Row(
              //             children: [
              //               SizedBox(
              //                 width: 15.w,
              //               ),
              //               Text(
              //                 "  Price: ",
              //                 style: const TextStyle(color: Colors.blue),
              //               ),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               SizedBox(
              //                 width: 30.w,
              //               ),
              //               InkWell(
              //                 onTap: () {
              //                   // controller.increment(index);
              //                 },
              //                 child: Container(
              //                   decoration: BoxDecoration(
              //                       color: Colors.grey.shade400,
              //                       borderRadius: BorderRadius.circular(12.r)),
              //                   child: const Icon(Icons.add),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 15.w,
              //               ),
              //               Text("asadw"),
              //               SizedBox(
              //                 width: 15.w,
              //               ),
              //               InkWell(
              //                 onTap: () {},
              //                 child: Container(
              //                   decoration: BoxDecoration(
              //                       color: Colors.grey.shade400,
              //                       borderRadius: BorderRadius.circular(12.r)),
              //                   child: const Icon(Icons.remove),
              //                 ),
              //               ),
              //             ],
              //           )
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
