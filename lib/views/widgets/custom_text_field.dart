import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hintText,this.mxLines = 1,this.onSaved, this.onChanged}) : super(key: key);
  final String hintText ;
  final int mxLines ;
  final void Function(String?)? onSaved ;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      cursorColor: kPrimaryColor,
      maxLines: mxLines,
      validator: (value)
      {
          if(value?.isEmpty ?? true)
          {
            return 'this field is required' ;
          }else
          {
            return null ;
          }
      },
      decoration: InputDecoration(
        hintText: hintText,
          hintStyle: const TextStyle(
            color: kPrimaryColor,
          ),
          border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: color ?? Colors.white,
          )
        );
  }
}
