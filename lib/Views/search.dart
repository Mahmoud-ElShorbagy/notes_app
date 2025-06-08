import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../models/note_model.dart';
import 'Widgets/custom_note_item.dart';

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 24),
        child: IconButton(
            onPressed: () {
              query = '';
            },
            icon: Icon(Icons.clear)),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: IconButton(
          onPressed: () {
            close(context, "");
          },
          icon: Icon(Icons.arrow_back_ios_new)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildFilteredNotesList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildFilteredNotesList();
  }

  Widget _buildFilteredNotesList() {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;

        if (notes.isEmpty) {
          return Center(
            child: Text(
              "There Are No Notes To Search For",
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        final List<NoteModel> filteredNotes = notes
            .where((note) =>
                note.title.toLowerCase().contains(query.toLowerCase()) ||
                note.subTitle.toLowerCase().contains(query.toLowerCase()))
            .toList();

        if (filteredNotes.isEmpty) {
          return Center(
            child: Text(
              "There Are No Results",
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: ListView.builder(
              itemCount: filteredNotes.length + 1,
              itemBuilder: (context, index) {
                if (index == filteredNotes.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                        child: Text(
                      filteredNotes.length == 4
                          ? "This is the End Of Notes"
                          : "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: NotesItem(
                    note: filteredNotes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
