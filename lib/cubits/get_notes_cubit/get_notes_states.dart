import '../../models/note_model.dart';

abstract class GetNotesStates {}

class InitialGetNotesState extends GetNotesStates {}

class SuccessGetNotesState extends GetNotesStates {
  List<NoteModel> notes;
  SuccessGetNotesState(this.notes);
}

class FailureGetNotesState extends GetNotesStates {
  final String error ;
  FailureGetNotesState(this.error);
}