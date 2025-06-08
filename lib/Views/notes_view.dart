import 'package:app_note/Views/Widgets/add_note_bottomsheet.dart';
import 'package:app_note/Views/Widgets/notes_view_body.dart';
import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xff62FCD7),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) => const AddNoteBottomShet(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
