import 'package:evently_c13_online/core/assets/app_assets.dart';
import 'package:evently_c13_online/core/theme/app_colors.dart';
import 'package:evently_c13_online/model/event_dm.dart';
import 'package:evently_c13_online/ui/event_details/event_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventTask extends StatelessWidget {
  final EventDM eventDM;

  const EventTask({super.key, required this.eventDM});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, EventDetails.routeName,arguments: eventDM);
      },
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          margin: EdgeInsets.all(8),
          width: double.infinity,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                AppAssets.sport,
                fit: BoxFit.cover,
              )),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(eventDM.name),
              ImageIcon(
                AssetImage(
                  AppAssets.loveActive,
                ),
                color: AppColors.blue,
              )
            ],
          ),
        ),
        Positioned(
            left: size.width * 0.030,
            top: size.height * 0.018,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    eventDM.date.day.toString(),
                    style: TextStyle(color: AppColors.blue),
                  ),
                  Text(DateFormat('MMMM').format(DateTime(0, eventDM.date.month)),
                      style: TextStyle(color: AppColors.blue)),
                ],
              ),
            ))
      ]),
    );
  }
}
