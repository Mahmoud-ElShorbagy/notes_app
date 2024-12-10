import 'package:app_note/Views/Widgets/custom_app_bar.dart';
import 'package:app_note/Views/Widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'EditNote',
            icon: Icons.check,
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextFiled(hint: "Title"),
          SizedBox(
            height: 16,
          ),
          CustomTextFiled(
            hint: "Content",
            maxLines: 5,
          )
        ],
      ),
    );
  }
}
