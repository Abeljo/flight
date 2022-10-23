library globals;

import 'package:flutter/material.dart';

String control1 = '';
String control2 = '';

final control3 = TextEditingController();
final control4 = TextEditingController();
String depatureDate = 'YY-MM-DD';
String returnDate = 'YY-MM-DD';
var itemfrom = [
  "AddisAbaba",
  "Bahirdar",
  "Gonder",
  "Jimma",
  "DireDawa",
];
String defaultfrom = 'Your-LOcation';
String defaultto = 'Where-To';
var itemto = [
  "NewYork",
  "China",
  "Dubai",
  "Russia",
  "Brazil",
  "AddisAbaba",
  "Bahirdar",
  "Gonder",
  "Jimma",
  "DireDawa",
];
var defaultClass = 'First-Class';
var classes = [
  'First Class',
  'Second Class',
];
String classchoise = '';
Color bc = Colors.white.withOpacity(0.5);

int slectedSeats = 0;
int myseats = 0;
int mytotal = 0;

enum ConnectionType {
  Wifi,
  Mobile,
}

Color greeny = Color.fromARGB(255, 8, 114, 131);
Color pinky = Color.fromARGB(255, 255, 113, 86);
Color blacky = Color.fromARGB(255, 22, 26, 32);

var numberperson = [
  '1',
  '2',
  '3',
  '4',
];

var choosenseat;
var choosenquantity;
var seatnumberA = [
  'A1',
  'A2',
  'A3',
  'A4',
  'A5',
  'A6',
  'A7',
  'A8',
  'A9',
  'A10',
];
var seatnumberB = [
  'B1',
  'B2',
  'B3',
  'B4',
  'B5',
  'B6',
  'B7',
  'B8',
  'B9',
  'B10',
];
var seatnumberC = [
  'C1',
  'C2',
  'C3',
  'C4',
  'C5',
  'C6',
  'C7',
  'C8',
  'C9',
  'C10',
];

bool isSelected = false;
