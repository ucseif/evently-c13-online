import 'package:evently_c13_online/core/assets/app_assets.dart';
import 'package:evently_c13_online/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EventTask extends StatelessWidget {
  const EventTask({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.all(8),
          width:double.infinity,
          height: 200,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
              child: Image.asset(AppAssets.sport,fit: BoxFit.cover,)),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14,vertical: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
          ),

          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('This is a Birthday Party'),
              ImageIcon(AssetImage(AppAssets.loveActive,),color: AppColors.purple,)
            ],

          ),),
        Positioned(
          left: size.width *0.030,
            top: size.height *0.018,

            child: Container(
              padding:EdgeInsets.all(8) ,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(children: [
                            Text('21',style:TextStyle(color: AppColors.purple) ,),
                            Text('May',style:TextStyle(color: AppColors.purple)),
              ],),
            ))
    ]
    );
  }
}
