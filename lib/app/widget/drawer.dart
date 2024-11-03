import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff282828),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/svg/profile.svg",
                  ),
                  title: Text(
                    "Profile",
                  ),
                  trailing: SvgPicture.asset(
                    "assets/svg/Arrow.svg",
                  ),
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const ProfileScreen(),
                    //   ),
                    // );
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/svg/profile.svg",
                    color: Colors.white,
                  ),
                  title: Text(
                    "My Cart",
                  ),
                  trailing: SvgPicture.asset(
                    "assets/images/profile.png",
                  ),
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const MyCartScreen(),
                    // ));
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/profile.png",
                    width: 24,
                    height: 22,
                  ),
                  title: Text(
                    "Favorite",
                  ),
                  trailing: SvgPicture.asset(
                    "assets/images/profile.png",
                  ),
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const FavoriteScreen(),
                    // ));
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/profile.png",
                  ),
                  title: Text(
                    "Orders",
                  ),
                  trailing: SvgPicture.asset(
                    "assets/images/profile.png",
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/profile.png",
                  ),
                  title: Text(
                    "Notifications",
                  ),
                  trailing: SvgPicture.asset(
                    "assets/images/profile.png",
                  ),
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const NotificationScreen(),
                    // ));
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/profile.png",
                  ),
                  title: Text(
                    "Settings",
                  ),
                  trailing: SvgPicture.asset(
                    "assets/images/profile.png",
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 13,
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                  indent: 18,
                  endIndent: 18,
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/profile.png",
                  ),
                  title: Text(
                    "Sign Out",
                  ),
                  trailing: SvgPicture.asset(
                    "assets/images/profile.png",
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
