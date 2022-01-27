import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:squamobi_to_do/app/constants.dart';

class DefaultAppBar extends StatelessWidget {
  final String text;
  bool isPopAvailable;
  DefaultAppBar({required this.text, this.isPopAvailable = false});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        border: Border(
          bottom: BorderSide(
            color: kPrimaryColor.withOpacity(0.06),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: size.width,
      height: 68 + padding.top,
      child: Container(
        // ignore: prefer_const_constructors

        margin: EdgeInsets.only(top: 44),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            isPopAvailable
                ? TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios))
                : TextButton(
                    onPressed: null,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.transparent,
                    )),
            Text(
              text,
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: kBlack,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
                onPressed: null,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.transparent,
                )),
          ],
        ),
      ),
    );
  }
}
