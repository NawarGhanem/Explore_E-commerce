import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/app/data/models/product_model.dart';
import 'package:project1/app/modules/home/views/home_view.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: MediaQuery.of(context).size.width / 2,
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
                  'assets/images/image_1.png',
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
              '${product.name}',
              style: TextStyle(fontSize: 14.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$150.00',
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
