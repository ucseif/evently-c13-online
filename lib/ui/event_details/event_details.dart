import 'package:evently_c13_online/core/assets/app_assets.dart';
import 'package:evently_c13_online/firebase_helpers/firestore/firestore_helper.dart';
import 'package:evently_c13_online/ui/event_details/date_time_card.dart';
import 'package:evently_c13_online/ui/event_details/location_card.dart';
import 'package:evently_c13_online/ui/update_event/update_event.dart';
import 'package:flutter/material.dart';

import '../../model/event_dm.dart';
import '../utils/dialog_utils.dart';

class EventDetails extends StatefulWidget {
  static const routeName = "event_details";

  final EventDM eventModel;
  const EventDetails({required this.eventModel, super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Image.asset(
            AppAssets.arrowLeftIc,
            width: 24,
            height: 24,
          ),
        ),
        title: Text(
          "Event Details",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, UpdateEvent.routeName,arguments: widget.eventModel);
              },
              icon: Image.asset(
                AppAssets.editIc,
                height: 24,
                width: 24,
              )),
          IconButton(
              onPressed: () {
                _eventDelete();
              },
              icon: Image.asset(
                AppAssets.deletetIc,
                height: 24,
                width: 24,
              ))
        ],
      ),
      body: ListView(padding: EdgeInsets.all(16), children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(AppAssets.sportImage),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          widget.eventModel.name,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(
          height: 16,
        ),
        DateTimeCard(
          date: "21 November 2024",
          time: "12:12PM",
        ),
        SizedBox(
          height: 16,
        ),
        LocationCard(lat: "Cairo", long: "Egypt"),
        SizedBox(
          height: 16,
        ),
        Image.asset(
          AppAssets.mapImage,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 16,),
        Text(
          "Description",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 8,),
        Text(
          widget.eventModel.description,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ]),
    );
  }

  void _eventDelete() async {
    showMessage(context, "Event has been deleted",
        posButtonTitle: "ok");
    await deleteEvent(widget.eventModel);
    hideLoading(context);
    Navigator.pop(context);
  }
}
