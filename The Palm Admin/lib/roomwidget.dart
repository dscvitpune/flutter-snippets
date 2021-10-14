import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'room category.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RoomWidget extends StatelessWidget {
  final SRoom sroom;

  const RoomWidget({Key key, this.sroom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (sroom.occupancy == false) {
      return Padding(
          padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
          child: Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(sroom.roomid,
                          style: GoogleFonts.oswald(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w400))),
                ],
              )));
    } else {
      return Padding(
          padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
          child: Container(
              width: 200,
              height: 150,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(24, 24, 0, 10),
                      child: Row(children: <Widget>[
                        Text(sroom.roomid,
                            style: GoogleFonts.oswald(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.people,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(sroom.guestnumber,
                            style: GoogleFonts.oswald(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ])),
                  Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                      child: Text(sroom.guest,
                          style: GoogleFonts.oswald(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                      child: Text(sroom.date,
                          style: GoogleFonts.oswald(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400))),
                ],
              )));
    }
  }
}

class RoomWidget1 extends StatelessWidget {
  final DRoom droom;

  const RoomWidget1({Key key, this.droom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (droom.occupancy == false) {
      return Padding(
          padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
          child: Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(droom.roomid,
                          style: GoogleFonts.oswald(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w400))),
                ],
              )));
    } else {
      return Padding(
          padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
          child: Container(
              width: 200,
              height: 150,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(24, 24, 0, 10),
                      child: Row(children: <Widget>[
                        Text(droom.roomid,
                            style: GoogleFonts.oswald(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.people,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(droom.guestnumber,
                            style: GoogleFonts.oswald(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ])),
                  Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                      child: AutoSizeText(droom.guest,
                          style: GoogleFonts.oswald(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                      child: Text(droom.date,
                          style: GoogleFonts.oswald(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400))),
                ],
              )));
    }
  }
}
