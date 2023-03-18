import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../models/note_model.dart';
import 'color_item.dart';

class EditViewBodyColorList extends StatefulWidget {
  const EditViewBodyColorList({Key? key, required this.note}) : super(key: key);
  final NoteModel note ;
  @override
  State<EditViewBodyColorList> createState() => _EditViewBodyColorListState();
}

class _EditViewBodyColorListState extends State<EditViewBodyColorList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        height: 34*2,
        child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child:  GestureDetector(
                onTap: (){
                  widget.note.color = colors[index].value;
                  currentIndex = index;
                  setState(() {

                  });
                },
                child: ColorItem(
                  color: colors[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}