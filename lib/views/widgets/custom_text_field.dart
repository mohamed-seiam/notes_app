import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hintText,this.mxLines = 1}) : super(key: key);
  final String hintText ;
  final int mxLines ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      maxLines: mxLines,
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
