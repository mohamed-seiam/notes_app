import 'package:flutter/material.dart';

class CustomIconSearch extends StatelessWidget {
  const CustomIconSearch({Key? key, required this.iconData, this.onPressed}) : super(key: key);
  final IconData iconData ;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(
          onPressed:onPressed ,
          icon: Icon(iconData,size: 28,),
        ),
      ),
    );
  }
}