import 'package:flutter/material.dart';
import 'package:htx_mh/resources/colors.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
import 'package:htx_mh/utills/text/middle_text.dart';
import 'package:htx_mh/utills/text/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String fistHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimentions.height50*5;

  @override
  void initState(){
    super.initState();
    if(widget.text.length > textHeight){
      fistHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    }else{
      fistHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty? MiddleText(text: fistHalf, overflow: TextOverflow.clip,): Column(
        children: [
          MiddleText(text: hiddenText? (fistHalf + "..."): (fistHalf + secondHalf), overflow: TextOverflow.clip, height: 1.8,),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText =! hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Xem thêm",size: Dimentions.font15, color: mainColor,),
                Icon(hiddenText? Icons.arrow_drop_down: Icons.arrow_drop_up, color: mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
