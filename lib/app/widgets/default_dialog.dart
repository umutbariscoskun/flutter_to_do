import 'package:flutter/material.dart';
import 'package:squamobi_to_do/app/constants.dart';
import 'package:squamobi_to_do/app/texts.dart';

class DefaultDialog extends StatefulWidget {
  final Function() addToDo;

  DefaultDialog(this.addToDo);

  @override
  State<DefaultDialog> createState() => _DefaultDialogState();
}

class _DefaultDialogState extends State<DefaultDialog> {
  @override
  Widget build(BuildContext context) {
    String title;
    String description;
    String imageUrl;
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: size.width - 50,
        height: size.width - 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              SquamobiTexts.addToDo,
              style: kTitleStyleBold(kBlack),
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => {
                setState(() {
                  title = value;
                }),
              },
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => {
                setState(() {
                  description = value;
                }),
              },
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: 'Description',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => {
                setState(() {
                  imageUrl = value;
                }),
              },
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: 'ImageUrl',
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  //  widget.addToDo();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kLightGrayButtonColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: kBlack.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  width: 100,
                  height: 56,
                  child: Center(
                    child: Text(
                      SquamobiTexts.add,
                      textAlign: TextAlign.center,
                      style: kTitleStyle(kBlack),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
