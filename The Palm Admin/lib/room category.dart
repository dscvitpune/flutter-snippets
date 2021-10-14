import 'package:flutter/material.dart';

class SRoom {
  final String roomid;
  final String guest;
  final String date;
  final String guestnumber;
  final bool occupancy;

  SRoom({this.roomid, this.guest, this.date, this.guestnumber, this.occupancy});
}

final sroom1 = SRoom(
  guest: "sajal bhattar",
  roomid: "Room 1",
  date: "Mar 12-Mar 13",
  guestnumber: "2",
  occupancy: true,
);

final sroom2 = SRoom(
  guest: "no guest",
  roomid: "Room 2",
  date: " ",
  guestnumber: " ",
  occupancy: false,
);

final sroom3 = SRoom(
  guest: "no guest",
  roomid: "Room 3",
  date: " ",
  guestnumber: " ",
  occupancy: false,
);

final sroom4 = SRoom(
  guest: "no guest",
  roomid: "Room 4",
  date: " ",
  guestnumber: " ",
  occupancy: false,
);

final sroom5 = SRoom(
  guest: "no guest",
  roomid: "Room 5",
  date: " ",
  guestnumber: " ",
  occupancy: false,
);

final sroom6 = SRoom(
  guest: "no guest",
  roomid: "Room 6",
  date: " ",
  guestnumber: " ",
  occupancy: false,
);

final Srooms = [
  sroom1,
  sroom2,
  sroom3,
  sroom4,
  sroom5,
  sroom6,
];

class DRoom {
  final bool occupancy;
  final String roomid;
  final String guest;
  final String date;
  final String guestnumber;

  DRoom({this.roomid, this.guest, this.date, this.guestnumber, this.occupancy});
}

final droom1 = DRoom(
  guest: "no guest",
  roomid: "Room 1",
  date: " ",
  guestnumber: " ",
  occupancy: false,
);

final droom2 = DRoom(
  guest: "no guest",
  roomid: "Room 2",
  date: " ",
  guestnumber: " ",
  occupancy: false,
);

final droom3 = DRoom(
  guest: "no guest",
  roomid: "Room 3",
  date: " ",
  guestnumber: " ",
  occupancy: false,
);

final droom4 = DRoom(
  guest: "sajal bhattar",
  roomid: "Room 4",
  date: "May 12-May 14",
  guestnumber: "4 ",
  occupancy: true,
);

final Drooms = [
  droom1,
  droom2,
  droom3,
  droom4,
];
