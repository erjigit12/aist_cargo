import 'package:aist_cargo/src/feature/feature.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: isParcel == false
          ? ListView.builder(
              itemCount: 1,
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
              })
          : BlocBuilder<AllCubit, AllState>(
              builder: (context, state) {
                if (state is DeliveryLoadin) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DeliveryLoaded) {
                  final delivery = state.delivery;
                  return ListView.builder(
                    itemCount: 1, // кийин динамикалуу болушу мүмкүн
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 38),
                        child: TripCard(
                          title: title,
                          name: delivery.fullName,
                          tripNumber: delivery.transportNumber,
                          from: delivery.fromWhere,
                          to: delivery.toWhere,
                          packageSize: delivery.size,
                          arrivalDate: delivery.arrivalDate,
                          departureDate: delivery.dispatchDate,
                          autoNumber: delivery.transportNumber,
                          packageType: delivery.description,
                          profileImageUrl: delivery.userImage,
                          isParcel: isParcel,
                        ),
                      );
                    },
                  );
                } else if (state is DeliveryError) {
                  return Center(child: Text('Error: ${state.message}'));
                }

                context.read<AllCubit>().fetchDelivery(16);
                return const SizedBox();
              },
            ),
    );
  }
}
