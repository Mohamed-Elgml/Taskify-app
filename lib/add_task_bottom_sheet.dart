import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo_rout_cours/fire_base_function.dart';
import 'package:todo_rout_cours/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  var descriptionController = TextEditingController();
  var titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "ADD NEW TASK",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your title";
                }
                return null;
              },
              controller: titleController,
              decoration: InputDecoration(
                label: Text("Title"),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please Enter The Description";
                }
                return null;
              },
              controller: descriptionController,
              decoration: InputDecoration(
                label: Text("Description"),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Time",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                selectData(context);
              },
              child: Text(
                "${selectedDate.toString().substring(0, 10)}",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    TaskModel task = TaskModel(
                        title: titleController.text,
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        description: descriptionController.text,
                        date: DateUtils.dateOnly(selectedDate)
                            .microsecondsSinceEpoch);
                    FirebaseFunctions.addTask(task);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "ADD TASK",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectData(BuildContext context) async {
    DateTime? choseDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
        initialDate: selectedDate);
    if (choseDate != null) {
      selectedDate = choseDate;
      setState(() {});
    }
  }
}
