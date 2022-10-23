import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flight/repo/flight_repo.dart';

part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  final FlightRepo flightRepository;

  FlightBloc({required this.flightRepository}) : super(FlightInitial()) {
    on<Create>(((event, emit) async {
      emit(FlightBooking());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await flightRepository.create(
            mail: event.mail,
            from: event.from,
            to: event.to,
            depature: event.depature,
            returndate: event.returndate,
            planenum: event.planenum,
            pricepaid: event.pricepaid,
            seatnum: event.seatnum,
            classing: event.classing);
        emit(FlightBooked());
      } catch (e) {
        emit(FlightError(error: e.toString()));
      }
    }));
  }
}
