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
          ? BlocBuilder<AllCubit, AllState>(
              builder: (context, state) {
                if (state is DeliveryLoadin) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SendLoaded) {
                  final send = state.send;
                  return ListView.builder(
                    itemCount: 1, // кийин динамикалуу болот
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 38),
                        child: TripCard(
                          title: title,
                          name: send?.fullName ?? '',
                          tripNumber: send?.id.toString() ?? '',
                          from: send?.fromWhere ?? '',
                          to: send?.toWhere ?? '',
                          packageSize: send?.size ?? '',
                          arrivalDate: send?.arrivalDate ?? '',
                          departureDate: send?.dispatchDate ?? '',
                          autoNumber: 'send.transportNumber',
                          // packageType: send?.packageType ?? '',
                          profileImageUrl:
                              'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
                          isParcel: isParcel,
                          description: send?.description ?? '',
                        ),
                      );
                    },
                  );
                } else if (state is DeliveryError) {
                  return Center(
                      child: Text('Маалымат базада жок: ${state.message}'));
                }

                context.read<AllCubit>().fetchSend();
                return const SizedBox();
              },
            )
          : BlocBuilder<AllCubit, AllState>(
              builder: (context, state) {
                if (state is DeliveryLoadin) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DeliveryLoaded) {
                  final delivery = state.delivery;
                  return ListView.builder(
                    itemCount: 1, // кийин динамикалуу болот
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 38),
                        child: TripCard(
                          title: title,
                          name: delivery!.fullName,
                          tripNumber: delivery.id.toString(),
                          from: delivery.fromWhere,
                          to: delivery.toWhere,
                          packageSize: delivery.size,
                          arrivalDate: delivery.arrivalDate,
                          departureDate: delivery.dispatchDate,
                          autoNumber: delivery.transportNumber,
                          // packageType: delivery.phoneNumber,
                          profileImageUrl: delivery.userImage,
                          isParcel: isParcel,
                          description: delivery.description,
                        ),
                      );
                    },
                  );
                } else if (state is DeliveryError) {
                  return Center(
                      child: Text('Маалымат базада жок: ${state.message}'));
                }

                context.read<AllCubit>().fetchDelivery();
                return const SizedBox();
              },
            ),
    );
  }
}
