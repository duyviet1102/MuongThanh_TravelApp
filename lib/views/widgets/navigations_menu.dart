import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
import 'package:htx_mh/views/pages/cart_page.dart';
import 'package:htx_mh/views/pages/news_page.dart';

import '../../resources/colors.dart';
import '../pages/account_page.dart';
import '../pages/home_page.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
            () => Container(
              margin: EdgeInsets.only(top: Dimentions.height10 ,bottom: Dimentions.font10/2),
              child: NavigationBar(
                height: Dimentions.height55,
                elevation: 0,
                animationDuration: const Duration(milliseconds: 500),
                indicatorColor: Colors.green,
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: (index) => controller.selectedIndex.value = index,
                destinations: [
                  NavigationDestination(icon: Icon(Icons.home_outlined, size: Dimentions.height25,), label: 'Trang chủ', selectedIcon: Icon(Icons.home,color: wColor, size: Dimentions.height25,)),
                  NavigationDestination(icon: Icon(Icons.newspaper_outlined, size: Dimentions.height25,), label: 'Tin tức',selectedIcon: Icon(Icons.newspaper, size: Dimentions.height25, color: wColor,)),
                  NavigationDestination(
                    icon: Badge(
                      smallSize: Dimentions.height10,
                        backgroundColor: redColor,
                        label: Text("+5", style: TextStyle(fontSize: Dimentions.font10),),
                        child: Icon(Icons.shopping_bag_outlined, size: Dimentions.height25)
                    ),
                    label: 'Giỏ hàng',
                    selectedIcon: Icon(Icons.shopping_bag,color: wColor,size: Dimentions.height25)
              ),
                  NavigationDestination(icon: Icon(Icons.person_outline_outlined, size: Dimentions.height25), label: 'Tài khoản',selectedIcon: Icon(Icons.person,color: wColor,size: Dimentions.height25
              )),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    const NewsPage(),
    Container(),
    const AccountPage()
  ];
}