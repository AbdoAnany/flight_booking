class FlightSearchState {
  final String fromLocation;
  final String toLocation;
  final DateTime? departureDate;
  final DateTime? returnDate;
  final String tripType;

  const FlightSearchState({
    this.fromLocation = '',
    this.toLocation = '',
    this.departureDate,
    this.returnDate,
    this.tripType = 'One Way',
  });

  // Copy with method for immutability
  FlightSearchState copyWith({
    String? fromLocation,
    String? toLocation,
    DateTime? departureDate,
    DateTime? returnDate,
    String? tripType,
  }) {
    return FlightSearchState(
      fromLocation: fromLocation ?? this.fromLocation,
      toLocation: toLocation ?? this.toLocation,
      departureDate: departureDate ?? this.departureDate,
      returnDate: returnDate ?? this.returnDate,
      tripType: tripType ?? this.tripType,
    );
  }

  // For debugging purposes
  @override
  String toString() {
    return 'FlightSearchState('
        'fromLocation: $fromLocation, '
        'toLocation: $toLocation, '
        'departureDate: $departureDate, '
        'returnDate: $returnDate, '
        'tripType: ${tripType})';
  }

  // For comparison
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FlightSearchState &&
        other.fromLocation == fromLocation &&
        other.toLocation == toLocation &&
        other.departureDate == departureDate &&
        other.returnDate == returnDate &&
        other.tripType == tripType;
  }

  @override
  int get hashCode {
    return Object.hash(
      fromLocation,
      toLocation,
      departureDate,
      returnDate,
      tripType,
    );
  }

  // Convert to Map for storage or API calls
  Map<String, dynamic> toMap() {
    return {
      'fromLocation': fromLocation,
      'toLocation': toLocation,
      'departureDate': departureDate?.toIso8601String(),
      'returnDate': returnDate?.toIso8601String(),
      'tripType': tripType.toString(),
    };
  }
}