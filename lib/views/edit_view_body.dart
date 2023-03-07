import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:24.0),
        child: Column(
          children:const [
            SizedBox(height: 50,),
            CustomAppBar(
                title: 'Edit Note',
                iconData: Icons.check,
            ),
            SizedBox(height: 50,),
            CustomTextField(hintText: 'Title'),
            SizedBox(height: 18,),
            CustomTextField(hintText: 'Content',mxLines: 5,),
          ],
        ),
      ),
    );
  }
}
