import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/app/modules/home/views/home_view.dart';

class ProductCard extends StatelessWidget {
  final int index;

  const ProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 1, 15, 50),
                  child: Icon(Icons.favorite, color: Colors.red),
                ),
                Image.asset(
                  index == 0
                      ? 'assets/images/image_1.png'
                      : 'assets/images/image_1.png',
                  height: 80,
                  width: 80,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'BEST SELLER',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              'programmer T-shirt',
              style: TextStyle(fontSize: 14.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    index == 0 ? '\$150.00' : '\$752.00',
                  ),
                  Icon(Icons.add)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
