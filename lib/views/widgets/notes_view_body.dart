import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';
import 'note_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:24.0),
      child: Column(
        children: const [
          SizedBox(height: 50,),
          CustomAppBar(iconData: Icons.search,title: 'Notes',),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}






