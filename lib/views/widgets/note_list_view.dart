import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_states.dart';
import 'package:notes_app/models/note_model.dart';

import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit,GetNotesStates>(
      builder: (context,states){
        List<NoteModel> notes = BlocProvider.of<GetNotesCubit>(context).notes;
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical:16.0),
          child: ListView.builder(
            itemCount:notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context,index)
            {
              return  Padding(
                padding:const EdgeInsets.symmetric(vertical:4.0),
                child:  NoteItem(noteModel: notes[index],),
              );
            },
          ),
        );
      },
    );
  }
}