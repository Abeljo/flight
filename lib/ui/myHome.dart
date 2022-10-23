import 'package:flight/bloc/flight_bloc.dart';
import 'package:flight/ui/freeFlight.dart';
import 'package:flight/ui/locationPick.dart';
import 'package:flutter/material.dart';
import 'package:flight/my_globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class myHome extends StatefulWidget {
  const myHome({super.key});

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.loose, children: [
      Container(
          decoration: BoxDecoration(
            color: greeny,
          ),
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                width: MediaQuery.of(context).size.width,
                image: AssetImage('asset/world2.png'),
                fit: BoxFit.fitHeight,
              ),
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Text(
                  ' Book Your \n Flight',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              )
            ],
          )),
      Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          margin: EdgeInsets.only(top: 250),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              )),
          height: MediaQuery.of(context).size.height - 320,
          child: Column(
            children: [
              locationPick(),
            ],
          )),
    ]);
  }
}
