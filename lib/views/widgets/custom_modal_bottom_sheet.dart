import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const SingleChildScrollView(
          child: AddNoteForm(),
        ),
      );

  }
}

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
            CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
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
