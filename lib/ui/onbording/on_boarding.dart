import 'package:dots_indicator/dots_indicator.dart';
import 'package:evently_c13_online/core/theme/app_colors.dart';
import 'package:evently_c13_online/model/on_boarding_model.dart';
import 'package:evently_c13_online/ui/login/login_screen.dart';
import 'package:evently_c13_online/ui/onbording/on_boarding_widget.dart';
import 'package:flutter/material.dart';
import '../../core/assets/app_assets.dart';

class OnBoarding extends StatefulWidget {
  static const routeName = "on_boarding";
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _currentIndex = _pageController.page?.toInt() ?? 0;
      setState(() {});
    });
  }

  List<OnBoardingModel> onBoardingList = [
    const OnBoardingModel(
      imagePath: AppAssets.pageView1,
      title: 'Find Events That Inspire You',
      description:
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    ),
    const OnBoardingModel(
      imagePath: AppAssets.pageView2,
      title: 'Effortless Event Planning',
      description:
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we've got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    ),
    const OnBoardingModel(
      imagePath: AppAssets.pageView3,
      title: 'Connect with Friends & Share\nMoments',
      description:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) =>
                  OnBoardingWidget(onBoardingList[index]),
              itemCount: onBoardingList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentIndex != 0
                    ? IconButton(
                        icon: Image.asset(AppAssets.arrowBack,
                            width: 38, height: 38),
                        onPressed: () => _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubic,
                        ),
                      )
                    : const SizedBox.shrink(),
                // IconButton(
                //   icon: Image.asset(AppAssets.arrowBack,width: 38,height: 38,),
                //   onPressed:
                //   _currentIndex > 0
                //       ? () => _pageController.previousPage(
                //     duration: const Duration(milliseconds: 300),
                //     curve: Curves.easeInOut,
                //   )
                //       : null,
                // ),
                DotsIndicator(
                  dotsCount: 3,
                  position: _currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: AppColors.blue,
                    size: const Size.square(8.0),
                    activeSize: const Size(21, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    AppAssets.arrowForward,
                    width: 38,
                    height: 38,
                  ),
                  onPressed: () {
                    if (_currentIndex == 2) {
                      onBoardingAsDone();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubic,
                      );
                    }
                  },
                  // _currentIndex < 2
                  //     ? () => _pageController.nextPage(
                  //   duration: const Duration(milliseconds: 300),
                  //   curve: Curves.easeInOut,
                  // )
                  //     : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onBoardingAsDone() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // await preferences.setBool("firstTime", false);
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
}
