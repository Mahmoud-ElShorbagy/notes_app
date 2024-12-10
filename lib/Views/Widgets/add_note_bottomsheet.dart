import 'package:app_note/Views/Widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class AddNoteBottomShet extends StatelessWidget {
  const AddNoteBottomShet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            CustomTextFiled(
              hint: "title",
            ),
            SizedBox(
              height: 25,
            ),
            CustomTextFiled(
              maxLines: 5,
              hint: "content",
            ),
            SizedBox(
              height: 70,
            ),
            CustomButton(),
            SizedBox(
              height: 23,
            ),
          ],
        ),
      ),
    );
  }
}
