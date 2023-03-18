import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_states.dart';

import '../../constant.dart';
import '../../models/note_model.dart';

class GetNotesCubit extends Cubit<GetNotesStates> {
  GetNotesCubit() : super(InitialGetNotesState());

  List<NoteModel> notes = [];

  getNotes() {
    var notesBox = Hive.box<NoteModel>(kNoteBox);
    notes = notesBox.values.toList();
    emit(SuccessGetNotesState());
  }
}
