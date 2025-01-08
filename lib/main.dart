

import 'package:flight_booking_app/project/home/presentation/hoem_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await initializeDependencies();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF4CAF50),
      statusBarIconBrightness: Brightness.light,
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


      // theme: ThemeData(
      //   primaryColor: const Color(0xFF4CAF50),
      //   scaffoldBackgroundColor: Colors.white,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     iconTheme: IconThemeData(color: Colors.black),
      //   ),
      // ),
      home: const FlightSearchScreen(),
    );
  }
}