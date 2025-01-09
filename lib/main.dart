import 'package:flight_booking_app/project/home/presentation/hoem_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the status bar to a specific color (0xFF4CAF50) and adjust icon brightness
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF4CAF50), // Keep this color
      statusBarIconBrightness: Brightness.light, // Light icons for dark background
    ),
  );

  runApp(const FlightBookingApp());
}

class FlightBookingApp extends StatelessWidget {
  const FlightBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Booking',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const FlightSearchScreen(),
    );
  }
}
