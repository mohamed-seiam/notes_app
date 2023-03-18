import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/note_states.dart';
import 'package:notes_app/models/note_model.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title;

  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:14.0),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              hintText: 'Title',
              onSaved: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 18.0,
            ),
            CustomTextField(
              hintText: 'Content',
              mxLines: 5,
              onSaved: (value) {
                subTitle = value;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<AddNotesCubit,AddNoteStates>(
              builder: ( context, state) {
                return  CustomButton(
                  isLoading: state is AddNoteLoadingState ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formattedDate = DateFormat.yMd().format(currentDate);
                      var noteModel = NoteModel(title: title!, subTitle: subTitle!, date: formattedDate, color: Colors.blue.value);
                      BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}