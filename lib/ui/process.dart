// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight/bloc/auth_bloc.dart';
import 'package:flight/main.dart';
import 'package:flight/ui/myHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flight/bloc/flight_bloc.dart';
import 'package:flight/my_globals.dart';
import 'package:flight/ui/freeFlight.dart';
import 'package:flight/ui/locationPick.dart';

import '../repo/flight_repo.dart';

class process extends StatefulWidget {
  String fromis;
  String tois;
  String rd;
  String dd;
  String finalprice;
  String seatnum;
  String planenum;
  String classing;
  process(
      {Key? key,
      required this.fromis,
      required this.tois,
      required this.rd,
      required this.dd,
      required this.finalprice,
      required this.classing,
      required this.seatnum,
      required this.planenum})
      : super(key: key);

  @override
  State<process> createState() => _processState();
}

class _processState extends State<process> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlightBloc(
          flightRepository: RepositoryProvider.of<FlightRepo>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Check Out'),
          elevation: 20,
          shadowColor: Colors.white.withOpacity(0.5),
          toolbarHeight: 50,
          backgroundColor: greeny,
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UnAuthenticated) {
              // Navigate to the sign in screen when the user Signs Out
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => myHome()),
                (route) => false,
              );
            }
          },
          child:
              BlocListener<FlightBloc, FlightState>(listener: (context, state) {
            if (state is FlightBooked) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Center(child: Text('Flight Booked Successfully')),
                duration: Duration(seconds: 3),
              ));
            }
          }, child: SingleChildScrollView(
            child: BlocBuilder<FlightBloc, FlightState>(
              builder: (context, state) {
                if (state is FlightBooking) {
                  return const Center(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is FlightError) {
                  return const Center(child: Text("Error"));
                }
                return Container(
                  height: MediaQuery.of(context).size.height - 100,
                  child: Stack(fit: StackFit.expand, children: [
                    /* const Image(
                            image: AssetImage('asset/abb.png'),
                            //fit: BoxFit.fitHeight,
                          ), */
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage('asset/visa.png'),
                                fit: BoxFit.contain,
                              ),
                              Image(
                                image: AssetImage('asset/maestro.png'),
                                fit: BoxFit.contain,
                              ),
                              Image(
                                image: AssetImage('asset/visa.png'),
                                fit: BoxFit.contain,
                              ),
                              Image(
                                image: AssetImage('asset/maestro.png'),
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          height: 380,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              )),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booked Under: ',
                                style: const TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Email:',
                                    style: const TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '${user.email}',
                                    style: const TextStyle(fontSize: 24),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Paid:',
                                    style: const TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    widget.finalprice,
                                    style: const TextStyle(fontSize: 24),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 150),
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton.icon(
                                      onPressed: () {
                                        BlocProvider.of<FlightBloc>(context)
                                            .add(
                                          Create(
                                              mail: user.email.toString(),
                                              depature: widget.dd,
                                              from: widget.fromis,
                                              returndate: widget.rd,
                                              to: widget.tois,
                                              classing: widget.classing,
                                              seatnum: widget.seatnum,
                                              pricepaid: widget.finalprice,
                                              planenum: widget.planenum),
                                        );
                                      },
                                      icon: Icon(Icons.done),
                                      label: Text('Book Your Trip')),
                                ),
                              )
                            ],
                          ),
                        ),
                        /* Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 210),
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(SignOutRequested());
                                },
                                icon: Icon(Icons.arrow_back),
                                label: Text('logout')),
                          ),
                        ) */
                      ],
                    )
                  ]),
                );
              },
            ),
          )),
        ),
      ),
    );
  }
}
