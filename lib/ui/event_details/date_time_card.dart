import 'package:evently_c13_online/core/assets/app_assets.dart';
import 'package:evently_c13_online/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DateTimeCard extends StatelessWidget {
  final String date;
  final String time;

  const DateTimeCard({required this.date, required this.time, super.key});

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
              AppAssets.calendarIc,
              height: 24,
              width: 24,
            ),
          ),
          SizedBox(width: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date,style: Theme.of(context).textTheme.labelSmall,),
              Text(time,style: Theme.of(context).textTheme.bodySmall,),
            ],
          ),
        ],
      ),
    );
  }
}
