import 'package:app_note/Views/edit_note_view.dart';
import 'package:app_note/cubits/notes_cubit/notes_cubit.dart';
import 'package:app_note/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotesItem extends StatelessWidget {
  const NotesItem(
      {super.key,
      required this.note,
      this.isSearching = false,
      this.test = false});
  final NoteModel note;
  final bool isSearching;
  final bool test;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditNoteView(
            note: note,
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: (Color(note.color))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(note.subTitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 18)),
              ),
              trailing: isSearching
                  ? null
                  : IconButton(
                      onPressed: () {
                        note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      },
                      icon: const Icon(
                        size: 24,
                        FontAwesomeIcons.trash,
                        color: Colors.black,
                      )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.4)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
