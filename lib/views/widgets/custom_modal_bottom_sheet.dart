import 'package:flutter/material.dart';


import 'custom_button.dart';
import 'custom_text_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 32,),
            CustomTextField(hintText: 'Title',),
            SizedBox(height: 18.0,),
            CustomTextField(hintText: 'Content',mxLines: 5,),
            SizedBox(height: 32,),
            CustomButton(),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}




