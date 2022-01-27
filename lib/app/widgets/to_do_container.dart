import 'package:flutter/material.dart';
import 'package:squamobi_to_do/app/constants.dart';
import 'package:squamobi_to_do/domain/entities/to_do_card.dart';

class ToDoContainer extends StatelessWidget {
  final ToDoCard toDo;
  final Function() removeToDo;
  final Function() onPressed;

  ToDoContainer({
    required this.toDo,
    required this.removeToDo,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: size.width - 40,
              height: 170,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width / 2,
                        child: Text(
                          toDo.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kLargeTitleStyle(kBlack),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: size.width / 2,
                        child: Text(
                          toDo.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: kContentStyleThin(kBlack),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              toDo.imageUrl,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            removeToDo;
                          },
                          child: Icon(
                            Icons.delete,
                            size: 32,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: size.width - 40,
              height: 170,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                    (_) => kPrimaryColor.withOpacity(0.08),
                  ),
                ),
                child: Container(),
                onPressed: onPressed,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
