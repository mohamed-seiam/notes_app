import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_note_cubit/note_states.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<AddNoteStates> {
  NotesCubit() : super(AddNoteInitialState());

  addNote(NoteModel noteModel) async {
    try {
      emit(AddNoteLoadingState());
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      await notesBox.add(noteModel);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFailureState(e.toString()));
    }
  }
}
