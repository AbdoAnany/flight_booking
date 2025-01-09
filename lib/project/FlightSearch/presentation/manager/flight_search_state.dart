part of 'flight_search_cubit.dart';


class FlightSearchState {
  final String tripType;
  final String travelers;
  final String cabinClass;
  final String fromLocation;
  final String toLocation;
  final DateTime departureDate;
  final DateTime? returnDate;

  FlightSearchState({
    required this.tripType,
    required this.travelers,
    required this.fromLocation,
    required this.toLocation,
    required this.cabinClass,
    required this.departureDate,
    this.returnDate,
  });

  FlightSearchState copyWith({
    String? tripType,
    String? fromLocation,
    String? toLocation,
    String? travelers,
    String? cabinClass,
    DateTime? departureDate,
    DateTime? returnDate,
  }) {
    return FlightSearchState(
      tripType: tripType ?? this.tripType,
      fromLocation: fromLocation ?? this.fromLocation,
      toLocation: toLocation ?? this.toLocation,
      travelers: travelers ?? this.travelers,
      cabinClass: cabinClass ?? this.cabinClass,
      departureDate: departureDate ?? this.departureDate,
      returnDate: returnDate ?? this.returnDate,
    );
  }
}

