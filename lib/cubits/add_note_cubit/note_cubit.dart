import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/note_states.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<AddNoteStates>
{
  NotesCubit() : super (AddNoteInitialState());

  addNote(NoteModel noteModel)
  {

  }

}