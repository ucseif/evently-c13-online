import 'package:flutter/material.dart';

import '../../core/assets/app_assets.dart';
import '../../core/theme/app_colors.dart';

class LocationCard extends StatelessWidget {

  final String lat;
  final String long;
  const LocationCard({required this.lat,required this.long, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.blue,
            width: 1,
          )),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.blue,
            ),
            child: Image.asset(
              AppAssets.locationIc,
              height: 24,
              width: 24,
            ),
          ),
          SizedBox(width: 8,),
          Text("${lat} , ${long}",style: Theme.of(context).textTheme.labelSmall,),
          //Text(long,style: Theme.of(context).textTheme.bodySmall,),
          Spacer(),
          Image.asset(AppAssets.halfArrowRight,width: 24,height: 24,)
        ],
      ),
    );
  }
}
