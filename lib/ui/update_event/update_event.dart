import 'package:evently_c13_online/core/assets/app_assets.dart';
import 'package:evently_c13_online/core/theme/app_colors.dart';
import 'package:evently_c13_online/firebase_helpers/firestore/firestore_helper.dart';
import 'package:evently_c13_online/model/category_dm.dart';
import 'package:evently_c13_online/model/event_dm.dart';
import 'package:evently_c13_online/model/user_dm.dart';
import 'package:evently_c13_online/ui/shared_widgets/categories_tabs.dart';
import 'package:evently_c13_online/ui/shared_widgets/custom_text_field.dart';
import 'package:evently_c13_online/ui/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class UpdateEvent extends StatefulWidget {
  static const routeName = "update_event";

  final EventDM eventDM;
  const UpdateEvent({required this.eventDM, super.key});

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  late CategoryDM selectedCategory;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.eventDM.name);
    descriptionController = TextEditingController(text: widget.eventDM.description);
    selectedDate = widget.eventDM.date;
    selectedTime = TimeOfDay(hour: selectedDate.hour, minute: selectedDate.minute);
    selectedCategory = CategoryDM.defaultCategories.firstWhere(
          (category) => category.name == widget.eventDM.category,
      orElse: () => CategoryDM.defaultCategories[0],
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update event"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildCategoryImage(),
                      buildCategoriesTabs(),
                      SizedBox(height: 16),
                      buildTitleTextField(),
                      SizedBox(height: 16),
                      buildDescriptionTextField(),
                      SizedBox(height: 16),
                      buildSelectDateRow(),
                      SizedBox(height: 16),
                      buildSelectTimeRow(),
                      SizedBox(height: 16),
                      buildLocationRow(),
                      SizedBox(height: 16),
                    ],
                  ),
                )),
            buildAddEventButton()
          ],
        ),
      ),
    );
  }

  Container buildCategoryImage() => Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(AppAssets.sport)));

  buildCategoriesTabs() => Container(
    color: AppColors.blue,
    child: CategoriesTabs(
        categories: CategoryDM.defaultCategories,
        onCategoryClick: (category) {
          setState(() {
            selectedCategory = category;
          });
        }),
  );

  buildDescriptionTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Text("Description"),
      const SizedBox(height: 8),
      CustomTextField(
        controller: descriptionController,
        minLines: 3,
        hint: "Description",
      ),
    ],
  );

  buildTitleTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Text("Title"),
      const SizedBox(height: 8),
      CustomTextField(
        controller: titleController,
        iconData: EvaIcons.edit,
        hint: "Title",
      ),
    ],
  );

  buildSelectDateRow() => Row(
    children: [
      const Icon(EvaIcons.calendar),
      Text("${selectedDate.year} / ${selectedDate.month} / ${selectedDate.day}"),
      const Spacer(),
      InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
            );
            if (pickedDate != null) {
              setState(() {
                selectedDate = pickedDate;
              });
            }
          },
          child: const Text("Choose Date")),
    ],
  );

  buildSelectTimeRow() => Row(
    children: [
      const Icon(EvaIcons.clock),
      SizedBox(width: 8),
      Text("${selectedTime.hour}:${selectedTime.minute}"),
      const Spacer(),
      InkWell(
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: selectedTime,
            );
            if (pickedTime != null) {
              setState(() {
                selectedTime = pickedTime;
              });
            }
          },
          child: const Text("Select Time")),
    ],
  );

  buildLocationRow() => Container();

  buildAddEventButton() => FilledButton(
      child: Text("Update event"),
      onPressed: () async {
        selectedDate = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
        EventDM updatedEvent = EventDM(
          name: titleController.text,
          date: selectedDate,
          ownerId: UserDM.currentUser.id,
          category: selectedCategory.name,
          description: descriptionController.text,
        );
        showLoading(context);
        await updateEvent(updatedEvent);
        hideLoading(context);
        Navigator.pop(context);
      });
}
