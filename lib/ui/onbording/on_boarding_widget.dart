import 'package:flutter/material.dart';

import '../../core/assets/app_assets.dart';
import '../../model/on_boarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  OnBoardingModel onBoardingModel;

  OnBoardingWidget(this.onBoardingModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppAssets.appHorizontalLogoImage,
            //width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.065,
          ),
          const SizedBox(height: 28),
          Image.asset(
            onBoardingModel.imagePath,
            height: MediaQuery.of(context).size.height * 0.42,
          ),
          const SizedBox(height: 28),
          Text(
            onBoardingModel.title,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 30),
          Text(
            onBoardingModel.description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
