import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favouritepage_controller.dart';

class FavouritepageView extends GetView<FavouritepageController> {
  const FavouritepageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourite',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B2B),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // الحاوية الأولى
                Container(
                  width: 158,
                  height: 217,
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 96.5,
                        height: 96.5,
                        margin: const EdgeInsets.only(top: 20, left: 30.75),
                        child: Image.asset(
                          'assets/images/image_1.png', // استبدل بمسار الصورة الصحيح
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Best Seller',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0D6EFD),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Programmer T-shirt',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2B2B2B),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16), // مسافة بين الحاويتين
                // الحاوية الثانية
                Container(
                  width: 158,
                  height: 217,
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white.withOpacity(1), // لجعل الخلفية شفافة
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 96.5,
                        height: 96.5,
                        margin: const EdgeInsets.only(top: 20, left: 30.75),
                        child: Image.asset(
                          'assets/images/image_1.png', // استبدل بمسار الصورة الصحيح
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Best Seller',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0D6EFD),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Programmer T-shirt',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2B2B2B),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16), // مسافة بين الصفين
            // صف الحاويات الثالثة والرابعة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // الحاوية الثالثة
                Container(
                  width: 158,
                  height: 217,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white.withOpacity(1), // لجعل الخلفية شفافة
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 96.5,
                        height: 96.5,
                        margin: const EdgeInsets.only(top: 20, left: 30.75),
                        child: Image.asset(
                          'assets/images/image_1.png', // استبدل بمسار الصورة الصحيح
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Best Seller',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0D6EFD),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Programmer T-shirt',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2B2B2B),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16), // مسافة بين الحاويتين
                // الحاوية الرابعة
                Container(
                  width: 158,
                  height: 217,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white.withOpacity(1), // لجعل الخلفية شفافة
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 96.5,
                        height: 96.5,
                        margin: const EdgeInsets.only(top: 20, left: 30.75),
                        child: Image.asset(
                          'assets/images/image_1.png', // استبدل بمسار الصورة الصحيح
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Best Seller',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Programmer T-shirt',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2B2B2B),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
