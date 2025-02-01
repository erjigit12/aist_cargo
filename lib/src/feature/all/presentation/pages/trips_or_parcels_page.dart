import 'package:aist_cargo/src/feature/feature.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class TripsOrParcelsPage extends StatelessWidget {
  const TripsOrParcelsPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TripCard(
                name: 'Erzhigit',
                tripNumber: '12345',
                from: 'Batken',
                to: 'Osh',
                packageSize: 'M',
                arrivalDate: '2023-09-01',
                departureDate: '2323-09-01',
                packageType: 'Box',
                profileImageUrl: 'assets/images/truck_mx3.png',
              ),
            );
          }),
    );
  }
}
