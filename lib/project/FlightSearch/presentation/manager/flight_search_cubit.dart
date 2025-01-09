import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../search_result/presentation/pages/FlightSearchScreen.dart';

part 'flight_search_state.dart';

class FlightSearchCubit extends Cubit<FlightSearchState> {
  FlightSearchCubit()
      : super(FlightSearchState(
          tripType: 'Round Trip',
          travelers: '1 Passenger',
          cabinClass: 'Economy Class',
          fromLocation: "Bengaluru",
          toLocation: "Dubai",
          departureDate: DateTime.now(),
          returnDate: DateTime.now().add(const Duration(days: 7)),
        ));

  final List<String> tripTypes = ['Round Trip', 'One Way', 'Multi City'];

  void setTripTypeByTabIndex(int index) {
    if (index >= 0 && index < tripTypes.length) {
      final selectedType = tripTypes[index];
      emit(state.copyWith(
        tripType: selectedType,
        returnDate: selectedType == 'One Way' ? null : state.returnDate,
      ));
    }
  }

  onNavigateToSearch(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SearchForm(
                flightSearchState: FlightSearchState(
                  tripType: state.tripType,
                  travelers: state.travelers,
                  cabinClass: state.cabinClass,
                  fromLocation: state.fromLocation,
                  toLocation: state.toLocation,
                  departureDate: state.departureDate,
                  returnDate: state.returnDate,
                ),
              )),
    );
  }

  void setTripType(String type) {
    emit(state.copyWith(
      tripType: type,
      returnDate: type == 'One Way' ? null : state.returnDate,
    ));
  }

  void setTravelers(String? travelers) {
    emit(state.copyWith(travelers: travelers));
  }

  void setCabinClass(String? cabinClass) {
    emit(state.copyWith(cabinClass: cabinClass));
  }

  void setDepartureDate(DateTime? date) {
    if (date!.isAfter(state.returnDate!)) {
      emit(state.copyWith(returnDate: date, departureDate: date));
    }
    emit(state.copyWith(departureDate: date));
  }

  void setReturnDate(DateTime? date) {
    if (date!.isBefore(state.departureDate)) {
      emit(state.copyWith(returnDate: date, departureDate: date));
    }
    emit(state.copyWith(returnDate: date));
  }

  void setTravelFromLocation(String? from) {
    if (from != null) {
      print("Updating fromLocation: $from");
      emit(state.copyWith(fromLocation: from));
    }
  }

  void setTravelToLocation(String? to) {
    if (to != null) {
      print("Updating toLocation: $to");
      emit(state.copyWith(toLocation: to));
    }
  }
}
