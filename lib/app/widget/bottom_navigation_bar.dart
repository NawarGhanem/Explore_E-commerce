import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project1/app/widget/svg_image_positioned.dart';

import '../../core/constants/app_images.dart';
import '../../core/constants/app_main_size.dart';
import '../../core/paint/home_navigation_bar_design.dart';

class CustomBottomNavigatorBar extends StatefulWidget {
  const CustomBottomNavigatorBar({
    super.key,
    required this.width,
    required this.height,
    required this.pageController,
    this.onTap,
  });

  final double width;
  final double height;
  final PageController pageController;
  final void Function()? onTap;
  @override
  State<CustomBottomNavigatorBar> createState() =>
      _CustomBottomNavigatorBarState();
}

int currentIndex = 0;

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double heightResponsive = height / figmaHieght;
    double widthResponsive = width / figmaWidth;
    return Stack(
      children: [
        Positioned(
          bottom: heightResponsive * -20,
          left: widthResponsive * 0,
          right: widthResponsive * 0,
          child: CustomPaint(
            size: Size(widget.width, widget.height),
            painter: HomeNavigationBarDesign(),
          ),
        ),
        SvgImagePositioned(
          onTap: () {
            setState(() {
              currentIndex = 0;
            });
            widget.pageController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 300), // Animation duration
              curve: Curves.easeInOut, // Animation curve
            );
          },
          mainColor: const Color(0xff707B81),
          color: currentIndex == 0
              ? const Color(0xff34C759)
              : const Color(0xff707B81),
          bottom: heightResponsive * 30,
          left: widthResponsive * 31,
          svgIcon: "assets/svg/add.svg",
        ),
        SvgImagePositioned(
          onTap: () {
            setState(() {
              currentIndex = 1;
            });
            widget.pageController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          mainColor: const Color(0xff707B81),
          color: currentIndex == 1
              ? const Color(0xff34C759)
              : const Color(0xff707B81),
          bottom: heightResponsive * 30,
          left: widthResponsive * 94,
          svgIcon: "assets/svg/add.svg",
        ),
        SvgImagePositioned(
          onTap: () {
            setState(() {
              currentIndex = 2;
            });
            widget.pageController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          mainColor: const Color(0xff707B81),
          color: currentIndex == 2
              ? const Color(0xff34C759)
              : const Color(0xff707B81),
          bottom: heightResponsive * 30,
          right: widthResponsive * 99,
          svgIcon: "assets/svg/add.svg",
        ),
        SvgImagePositioned(
          onTap: () {
            setState(() {
              currentIndex = 3;
            });
            widget.pageController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          mainColor: const Color(0xff707B81),
          color: currentIndex == 3
              ? const Color(0xff34C759)
              : const Color(0xff707B81),
          bottom: heightResponsive * 30,
          right: widthResponsive * 31,
          svgIcon: "assets/svg/add.svg",
        ),
        Positioned(
            left: widthResponsive * 160,
            right: widthResponsive * 160,
            bottom: heightResponsive * 44,
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                padding: const EdgeInsets.all(15),
                width: widthResponsive * 56,
                height: heightResponsive * 56,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 24,
                      color: Color(0xff5B9EE199).withOpacity(0.60),
                      offset: Offset(0, 8))
                ], shape: BoxShape.circle, color: Color(0xff34C759)),
                child: SvgPicture.asset(
                  "assets/svg/add.svg",
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}
