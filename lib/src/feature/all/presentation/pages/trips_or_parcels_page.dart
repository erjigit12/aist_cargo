import 'package:aist_cargo/src/feature/feature.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class TripsOrParcelsPage extends StatelessWidget {
  const TripsOrParcelsPage({
    super.key,
    required this.title,
    this.isParcel,
  });

  final String title;
  final bool? isParcel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 38),
              child: TripCard(
                title: title,
                name: 'Асел Асылбекова',
                tripNumber: '12345',
                from: 'Batken',
                to: 'Osh',
                packageSize: 'M',
                arrivalDate: '2023-09-01',
                departureDate: '2323-09-01',
                autoNumber: 'IA 3456 K',
                packageType: 'Box',
                profileImageUrl: 'assets/images/truck_mx3.png',
                isParcel: isParcel,
              ),
            );
          }),
    );
  }
}
