import 'package:date_format/date_format.dart';
import 'package:flight/main.dart';
import 'package:flight/ui/freeFlight.dart';
import 'package:flutter/material.dart';
import 'package:flight/my_globals.dart';

import 'dart:math' as math;

class locationPick extends StatefulWidget {
  const locationPick({super.key});

  @override
  State<locationPick> createState() => _locationPickState();
}

class _locationPickState extends State<locationPick> {
  Future datePick(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    var formattedDate = formatDate(picked!, [yyyy, '-', mm, '-', dd]);

    var ndate = formattedDate.toString();
    setState(() {
      depatureDate = ndate;
    });
  }

  Future datePick2(BuildContext context) async {
    final DateTime? picked2 = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    var formattedDate = formatDate(picked2!, [yyyy, '-', mm, '-', dd]);

    var ndate = formattedDate.toString();
    setState(() {
      returnDate = ndate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: Text(
              'Find Your Flight',
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 8, 114, 131)),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'From (Location)',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 8, 114, 131)),
          ),
          const SizedBox(
            height: 6,
          ),
          DropdownButtonFormField(
              //value: defaultfrom,
              hint: Text('Your Location'),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              items: itemfrom.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  control1 = newValue!;
                });
              }),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('--------------------------------    '),
              Icon(Icons.airplanemode_active),
              Transform.rotate(
                angle: 180 * math.pi / 180,
                child: Icon(Icons.airplanemode_active),
              ),
              Text('   --------------------------------'),
            ],
          ),
          const Text(
            'To (Destination)',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 8, 114, 131)),
          ),
          const SizedBox(
            height: 6,
          ),
          DropdownButtonFormField(
              // value: defaultto,
              hint: Text('Where To'),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              items: itemto.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  control2 = newValue!;
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                'Depature Date',
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 8, 114, 131)),
              ),
              SizedBox(
                height: 5,
              ),
              Text('Return Date',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 114, 131))),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 150,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        datePick(context);
                      },
                      icon: Icon(Icons.date_range),
                      label: Text(depatureDate)),
                ),
                Container(
                  height: 40,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        datePick2(context);
                      },
                      icon: Icon(Icons.date_range),
                      label: Text(returnDate)),
                ),
              ],
            ),
          ),
          const Center(
            child: Icon(Icons.arrow_downward,
                size: 100, color: Color.fromARGB(255, 8, 114, 131)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return freeFlight(
                            fromis: control1,
                            tois: control2,
                            dd: depatureDate,
                            rd: returnDate);
                      });
                },
                icon: Icon(Icons.search),
                label: Text('Find Available Flight')),
          )
        ],
      ),
    );
  }
}
