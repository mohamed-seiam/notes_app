import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_note_color_list.dart';

import '../models/note_model.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel ;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String ? title ;
  String ? content ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:24.0),
        child: Column(
          children: [
           const SizedBox(height: 50,),
            CustomAppBar(
                title: 'Edit Note',
                iconData: Icons.check,
              onPressed: (){
                  widget.noteModel.title = title ?? widget.noteModel.title;
                  widget.noteModel.subTitle = content ?? widget.noteModel.subTitle;
                  widget.noteModel.save();
                  BlocProvider.of<GetNotesCubit>(context).getNotes();
                  Navigator.pop(context);
              },
            ),
            const SizedBox(height: 50,),
             CustomTextField(
              hintText: widget.noteModel.title,
              onChanged:(value)
              {
                title = value;
              } ,
            ),
            const SizedBox(height: 18,),
             CustomTextField(
               hintText: widget.noteModel.subTitle,mxLines: 5,
               onChanged: (value){
                 content = value;
               },
             ),
            const SizedBox(height: 30,),

            EditViewBodyColorList(note: widget.noteModel,),
          ],
        ),
      ),
    );
  }
}




