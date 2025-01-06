import 'package:evently_c13_online/core/assets/app_assets.dart';
import 'package:evently_c13_online/core/theme/app_colors.dart';
import 'package:evently_c13_online/ui/home_screen/tabs/home_tab/widget/event_task.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          SafeArea(
              child: Container(
            width: double.infinity,
            height: 174,
            decoration: const BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Welcome Back ✨',
                            style: TextStyle(color: AppColors.white),
                          ),
                          Text('yousef', style: TextStyle(color: AppColors.white)),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.sunny,
                        color: AppColors.white,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white),
                        child: const Text(
                          'EN',
                          style: TextStyle(
                              color: AppColors.purple, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(AppAssets.mapIcon),
                        color: AppColors.white,
                      ),
                      const Text('Cairo , Egypt',
                          style: TextStyle(color: AppColors.white)),
                    ],
                  ),
                  TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: AppColors.white),
                        color: AppColors.white,
                      ),
                      dividerColor: Colors.transparent,
                      // unselectedLabelColor: AppColors.white,
                      // labelColor: AppColors.purple,
                      unselectedLabelStyle: TextStyle(color: AppColors.white),
                      labelStyle: TextStyle(color: AppColors.purple),
                      tabs: [
                        Tab(
                          child: Container(
                            decoration: boxDecoration(),
                            width: 84,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.compass_calibration_outlined,
                                ),
                                Text('All'),
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          icon: Container(
                            decoration: boxDecoration(),
                            width: 84,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.directions_bike_sharp,
                                ),
                                Text('Sport'),
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          icon: Container(
                            decoration: boxDecoration(),
                            width: 84,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.cake_outlined,
                                ),
                                Text('Birthday'),
                              ],
                            ),
                          ),
                        ),
                      ]),

                ],
              ),
            ),
          )),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) => EventTask(),itemCount: 10,),
            
          )
        ],
      ),
    );
  }

  Decoration boxDecoration() {
    return BoxDecoration(
      border: Border.all(color: AppColors.white),
      borderRadius: BorderRadius.circular(50),
    );
  }
}
