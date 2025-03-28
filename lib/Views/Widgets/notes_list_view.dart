import 'package:app_note/cubits/notes_cubit/notes_cubit.dart';
import 'package:app_note/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: notes.length + 1,
              itemBuilder: (context, index) {
                if (index == notes.length) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: notes.isEmpty ? 325 : 16),
                      child: Text(
                        notes.isEmpty
                            ? "Add Your Beautiful Notes."
                            : notes.length == 4
                                ? "This is the End Of Notes"
                                : "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                }
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: NotesItem(
                      note: notes[index],
                    ));
              }),
        );
      },
    );
  }
}
