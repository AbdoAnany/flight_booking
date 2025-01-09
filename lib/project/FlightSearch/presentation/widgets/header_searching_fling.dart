import 'package:flutter/material.dart';

import '../../../../core/cont/image.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_typography..dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/flight_search_cubit.dart';

class HeaderSearchFling extends StatelessWidget {
  const HeaderSearchFling({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FlightSearchCubit>();

    return BlocBuilder<FlightSearchCubit, FlightSearchState>(
      builder: (context, state) {
        final activeTabIndex = cubit.tripTypes
            .indexOf(state.tripType); // Determine the active tab.

        return Container(
          height: 148,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.startTrip),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text("Let's start your trip",
                      style: AppTypography.bodyText1),
                ),
              ),
              Positioned(
                  bottom: -15,
                  left: 0,
                  right: 0,
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          cubit.tripTypes.length,
                          (index) => Expanded(
                            child: GestureDetector(
                                onTap: () => cubit.setTripTypeByTabIndex(index),
                                child: _buildTab(cubit.tripTypes[index],
                                    state.tripType == cubit.tripTypes[index])),
                          )),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab(String text, isSelected) {
    return  Container(
      // width: double.infinity,
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
    );
  }
}

// class HeaderSearchFling extends StatelessWidget {
//   const HeaderSearchFling({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return     Container(
//       height: 148,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(AppImages.startTrip),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           const Align(
//             alignment: Alignment.topLeft,
//             child: Padding(
//               padding: EdgeInsets.all(14.0),
//               child: Text("Let's start your trip",
//                   style: AppTypography.bodyText1),
//             ),
//           ),
//           Positioned(
//             bottom: -15,
//             left: 0,
//             right: 0,
//             child: Card(
//               elevation: 4,
//               margin: EdgeInsets.symmetric(horizontal: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(6),
//               ),
//               child: TabBar(
//                   controller: _tabController,
//                   indicatorColor: AppColors.transparent,
//                   labelColor: AppColors.transparent,
//                   indicatorWeight: 0,
//                   overlayColor:
//                   WidgetStateProperty.all(AppColors.transparent),
//                   indicatorSize: TabBarIndicatorSize.tab,
//                   indicatorPadding: EdgeInsets.zero,
//                   indicator: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6),
//                     color: AppColors.transparent,
//                   ),
//                   labelPadding: EdgeInsets.zero,
//                   padding: EdgeInsets.zero,
//                   dividerColor: AppColors.transparent,
//                   onTap: (e) {
//
//                     setState(() {});
//                   },
//                   // unselectedLabelColor: AppColors.textSecondary,
//                   // indicatorSize: TabBarIndicatorSize.tab,
//
//                   tabs: List.generate(tabs.length,
//                           (index) => _buildTab(tabs[index], index))),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
