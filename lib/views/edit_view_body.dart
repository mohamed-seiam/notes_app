import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';

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
          ],
        ),
      ),
    );
  }
}
