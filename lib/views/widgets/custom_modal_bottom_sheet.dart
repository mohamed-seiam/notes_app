import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/note_states.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'add_note_form.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: BlocConsumer<AddNotesCubit, AddNoteStates>(
          listener: (context, state) {
            if (state is AddNoteFailureState) {}
            if (state is AddNoteSuccessState) {
              BlocProvider.of<GetNotesCubit>(context).getNotes();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoadingState ? true : false,
                child: const SingleChildScrollView(child: AddNoteForm()));
          },
        ),
      ),
    );
  }
}
