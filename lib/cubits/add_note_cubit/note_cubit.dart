import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/note_states.dart';

class NotesCubit extends Cubit<NoteStates>
{
  NotesCubit() : super (NoteInitialState());

}