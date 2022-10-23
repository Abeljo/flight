import 'package:flight/my_globals.dart';
import 'package:flight/repo/flight_repo.dart';
import 'package:flight/ui/auth/signIn.dart';
import 'package:flight/ui/myHome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/flight_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FlightRepo(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flight',
        home: home(),
        theme: ThemeData(
            scaffoldBackgroundColor: greeny,
            buttonTheme: ButtonThemeData(buttonColor: pinky)),
      ),
    );
  }
}

class home extends StatelessWidget {
  home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlightBloc(
          flightRepository: RepositoryProvider.of<FlightRepo>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flight Booking App',
          ),
          toolbarHeight: 40,
          backgroundColor: greeny,
          elevation: 20,
          centerTitle: true,
          shadowColor: Colors.white.withOpacity(0.5),
        ),
        body: BlocListener<FlightBloc, FlightState>(listener: (context, state) {
          if (state is FlightBooked) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Flight Booked'),
              duration: Duration(seconds: 2),
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
              return myHome();
              //return const signIn();
            },
          ),
        )),
      ),
    );
  }
}
