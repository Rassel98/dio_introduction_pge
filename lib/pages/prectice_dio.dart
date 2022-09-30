import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/getx_controller/home_controller.dart';
import 'package:introduction_screen/pages/onboarding_page.dart';
import 'package:introduction_screen/pages/pge1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pge2.dart';

class NewHomepage extends StatelessWidget {
  const NewHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
    HomeController controller = Get.put(HomeController());
    List<Widget>pge=[Pge1(),Pge2()];
    controller.getApiData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                pref.setBool('home', false);
                Get.offAll(const OnBoardingPage());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(() => pge[controller.index.value]),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          key: bottomNavigationKey,
          index: controller.index.value,
          height: 60.0,
          items: const [
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            // Icon(Icons.compare_arrows, size: 30),
            // Icon(Icons.call_split, size: 30),
            // Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white70,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          onTap: (index) {
            controller.setIndex(index);
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
