import 'package:flight_booking_app/core/theme/app_color.dart';
import 'package:flight_booking_app/project/home/presentation/widgets/FromToInputCard.dart';
import 'package:flight_booking_app/project/home/presentation/widgets/flight_hotel_package_card.dart';
import 'package:flight_booking_app/project/home/presentation/widgets/search_form.dart';
import 'package:flight_booking_app/project/home/presentation/widgets/travel_inspiration_card.dart';
import 'package:flutter/material.dart';

import '../../../core/cont/image.dart';
import '../../../core/theme/app_typography..dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen>with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  final List<String> tabs = ['Round Trip', 'One Way', 'Multi City'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48, toolbarHeight: 76,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: AppColors.textSecondary,
            )),
        // backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Search Flights', style: AppTypography.bodyText2),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Container(
              height: 148,
              width: double.infinity,
              decoration: const BoxDecoration(

                image: DecorationImage(
                  image: AssetImage(AppImages.startTrip),
                  fit: BoxFit.cover,
                ),
              ),
              child:  Stack(
                clipBehavior: Clip.none,
                children: [
               Align(alignment: Alignment.topLeft,
                    child:    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text("Let's start your trip",
                          style: AppTypography.bodyText1),
                    ),),
                  Positioned(bottom: -15,
                    left: 0,right: 0,
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      color:  AppColors.white,


                      child: TabBar(
                          controller: _tabController,
                          indicatorColor: AppColors.transparent,
                          labelColor: AppColors.transparent,
                          overlayColor: WidgetStateProperty.all(AppColors.transparent),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorPadding:  EdgeInsets.zero,

                          labelPadding:  EdgeInsets.zero,



                          padding: EdgeInsets.zero,
                          dividerColor:  AppColors.transparent,
                          onTap: (e){
                            print(e);
                            setState(() {

                            });
                          },
                          // unselectedLabelColor: AppColors.textSecondary,
                          // indicatorSize: TabBarIndicatorSize.tab,

                          tabs: List.generate(tabs.length,
                                  (index) =>_buildTab(tabs[index],index ) )


                      ),
                    ),
                  ),
                ],
              ),
            ),



            SizedBox(height: 32),
            FromToInputCard(),
            // _buildLocationField('From'),
            SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: DatePickerField(
                      label: 'Departure',
                      value: 'Sat, 23 Mar - 2024',
                      onSelect: (date) {
                        // Handle date selection
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DatePickerField(
                      label: 'Return',
                      value: 'Sat, 23 Mar - 2024',
                      onSelect: (date) {
                        // Handle date selection
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: SelectorField(
                      label: 'Travelers',
                      value: '1 Passenger',
                      onTap: () {
                        // Show passenger selector
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SelectorField(
                      label: 'Cabin Class',
                      value: 'Economy Class',
                      onTap: () {
                        // Show class selector
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle search flights action
                },
                child: Text('Search Flights'),
              ),
            ),
            SizedBox(height: 16),


            // Search Form
            // const SearchForm(),

            // Travel Inspirations
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Travel Inspirations',
                      style:AppTypography.bodyText3

                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        TravelInspirationCard(
                          image: AppImages.saudiArabia,
                          title: 'Saudi Arabia',
                        ),
                        TravelInspirationCard(
                          image: AppImages.kuwait,
                          title: 'Kuwait',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

           // Flight & Hotel Packages
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: FlightHotelPackageCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripTypeButton(String label, {bool isSelected = false}) {
    return ElevatedButton(
      onPressed: () {
        // Handle trip type selection
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey,
      ),
      child: Text(label),
    );
  }
  Widget _buildTab(String text, int index) {
    bool isSelected = _tabController.index == index;
    return Tab(
      child: Container(
        // width: 132,
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.text,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.bold,
          ),
        ),
      ),
    );
  }
  Widget _buildLocationField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDateField(String label, String date) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      controller: TextEditingController(text: date),
      readOnly: true,
      onTap: () {
        // Handle date picker
      },
    );
  }

  Widget _buildTravelersField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Travelers',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.person),
      ),
      controller: TextEditingController(text: '1 Passenger'),
      readOnly: true,
      onTap: () {
        // Handle travelers selection
      },
    );
  }

  Widget _buildCabinClassField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Cabin Class',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.airline_seat_recline_normal),
      ),
      controller: TextEditingController(text: 'Economy Class'),
      readOnly: true,
      onTap: () {
        // Handle cabin class selection
      },
    );
  }
}

// lib/presentation/widgets/flight_hotel_package_card.dart