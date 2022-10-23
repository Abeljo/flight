// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'flight_bloc.dart';

abstract class FlightState extends Equatable {
  const FlightState();

  @override
  List<Object> get props => [];
}

class FlightInitial extends FlightState {
  @override
  List<Object> get props => [];
}

class FlightBooking extends FlightState {
  @override
  List<Object> get props => [];
}

class FlightBooked extends FlightState {
  @override
  List<Object> get props => [];
}

class FlightError extends FlightState {
  final String error;
  FlightError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
