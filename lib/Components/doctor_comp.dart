import 'package:flutter/material.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

Widget cardbutton(context, imagename, headingtext, headingtextcolor) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(top: 30, bottom: 10),
    width: MediaQuery.of(context).size.width * 0.37,
    decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
    child: Column(
      children: [
        Text(
          headingtext,
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: headingtextcolor),
        ),
        SizedBox(
          height: 10,
        ),
        Image.asset(imagename)
      ],
    ),
  );
}

Widget cardlabel(
  context,
  headingtext,
) {
  return Container(
    padding: EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
    margin: EdgeInsets.only(top: 10, bottom: 3, right: 10),
    decoration: BoxDecoration(
        color: ColorConstraints.primarycolor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
    child: Column(
      children: [
        Text(
          headingtext,
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
              color: ColorConstraints.primarycolor),
        ),
      ],
    ),
  );
}

Widget cardcourse(context, headingtext, courseperson, courseimage) {
  return Container(
    margin: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.1),
      //     spreadRadius: 5,
      //     blurRadius: 7,
      //     offset: Offset(0, 3), // changes position of shadow
      //   ),
      // ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 4, bottom: 4, right: 6, left: 6),
          decoration: BoxDecoration(
            color: ColorConstraints.primarycolor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5), topLeft: Radius.circular(5)),
          ),
          child: Text(
            courseperson,
            style: TextStyle(
                color: ColorConstraints.primarycolor,
                fontWeight: FontWeight.w900,
                fontSize: 16),
          ),
        ),
        Stack(
          children: [
            Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(courseimage),
                    scale: 10,
                    alignment: Alignment.bottomRight,
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 100,
                height: 150,
                color: ColorConstraints.primarycolor.withOpacity(0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "12",
                      style: TextStyle(
                          color: ColorConstraints.primarycolor,
                          fontWeight: FontWeight.w900,
                          fontSize: 30),
                    ),
                    Icon(
                      Icons.playlist_play_sharp,
                      color: ColorConstraints.primarycolor,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 4, bottom: 4, right: 6, left: 6),
                color: ColorConstraints.primarycolor,
                child: Text(
                  courseperson,
                  style: TextStyle(
                      color: ColorConstraints.primarycolor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
        Container(
          color: ColorConstraints.primarycolor,
          width: 250,
          padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 30),
          child: Row(
            children: [
              Container(
                width: 200,
                child: Text(
                  headingtext,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: ColorConstraints.primarycolor),
                ),
              ),
              Container(width: 20, child: Icon(Icons.more_vert)),
            ],
          ),
        ),
      ],
    ),
  );
}
