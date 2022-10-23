// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'flight_bloc.dart';

abstract class FlightEvent extends Equatable {
  const FlightEvent();

  @override
  List<Object> get props => [];
}

class Create extends FlightEvent {
  final String from;
  final String to;
  final String depature;
  final String returndate;
  final String planenum;
  final String seatnum;
  final String pricepaid;
  final String classing;
  final String mail;
  Create({
    required this.mail,
    required this.classing,
    required this.from,
    required this.to,
    required this.depature,
    required this.returndate,
    required this.planenum,
    required this.seatnum,
    required this.pricepaid,
  });
}
