import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:project1/app/data/models/categories_model.dart';
import 'package:project1/app/modules/favouritepage/views/favouritepage_view.dart';
import 'package:project1/app/widget/animated_container_item.dart';
import 'package:project1/app/widget/productcard.dart';
import '../../../widget/bottom_navigation_bar.dart';
import '../../../widget/drawer_element.dart';
import '../../../widget/home_page_button.dart';
import '../controllers/buttonController.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final ButtonController buttonController = Get.put(ButtonController());

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CustomBottomNavigatorBar(
      //   height: 50,
      //   width: double.infinity,
      //   pageController: PageController(),
      //   onTap: null,
      // ),
      drawer: Drawer(
          backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
          child: DrawerElements()),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Icon(
            Icons.shopping_bag_outlined,
          ),
          SizedBox(
            width: 10,
          ),
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
                itemCount: controller.categories.length,
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
                        categories: controller.categories[index],
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
                height: 200.h,
                width: MediaQuery.of(context).size.width,
                child: Obx(() {
                  if (controller.products.isEmpty) {
                    CircularProgressIndicator(
                      color: Colors.red,
                    );
                  }

                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: controller.products[index]);
                      });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
