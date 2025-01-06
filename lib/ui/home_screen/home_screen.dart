import 'package:evently_c13_online/core/assets/app_assets.dart';
import 'package:evently_c13_online/core/theme/app_colors.dart';
import 'package:evently_c13_online/ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:evently_c13_online/ui/home_screen/tabs/love_tab/love_tab.dart';
import 'package:evently_c13_online/ui/home_screen/tabs/map_tab/map_tab.dart';
import 'package:evently_c13_online/ui/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = const [
    HomeTab(),
    MapTab(),
    LoveTab(),
    ProfileTab(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.purple,
        shape:const CircleBorder(side: BorderSide(width: 5, color: AppColors.white)),
        child: const Icon(Icons.add, color: AppColors.white,size: 30,),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              activeIcon: ImageIcon(AssetImage(AppAssets.homeActive)),
              backgroundColor: AppColors.purple,
              icon: ImageIcon(AssetImage(AppAssets.homeIcon)),
              label: 'home'),
          BottomNavigationBarItem(
              activeIcon: ImageIcon(AssetImage(AppAssets.mapActive)),
              backgroundColor: AppColors.purple,
              icon: ImageIcon(AssetImage(AppAssets.mapIcon)),
              label: 'map'),
          BottomNavigationBarItem(
              activeIcon: ImageIcon(AssetImage(AppAssets.loveActive)),
              backgroundColor: AppColors.purple,
              icon: ImageIcon(AssetImage(AppAssets.loveIcon)),
              label: 'love'),
          BottomNavigationBarItem(
              activeIcon: ImageIcon(AssetImage(AppAssets.profileActive)),
              backgroundColor: AppColors.purple,
              icon: ImageIcon(AssetImage(AppAssets.profileIcon)),
              label: 'profile'),
        ],
      ),
      body: tabs[currentIndex]
    );
  }
}
