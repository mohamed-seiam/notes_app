import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view_body.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.noteModel}) : super(key: key);
final NoteModel noteModel ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const EditViewBody();
          }),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24.0, bottom: 24.0, left: 16.0),
        decoration: BoxDecoration(
          color:  Color(noteModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                noteModel.title,
                style:const TextStyle(
                  color: Colors.black,
                  fontSize: 26.0,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  noteModel.subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18.0,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  noteModel.delete();
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                noteModel.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
