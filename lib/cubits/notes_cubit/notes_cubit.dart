import 'package:app_note/constants.dart';
import 'package:app_note/models/note_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(knotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
