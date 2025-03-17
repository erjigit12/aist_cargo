import 'dart:developer';

import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  final CreateDeliveryUsecase createDeliveryUsecase;
  final CreateSubscriptionUsecase createSubscriptionUsecase;

  DeliveryCubit({
    required this.createDeliveryUsecase,
    required this.createSubscriptionUsecase,
  }) : super(DeliveryInitial());

  void createDeliveries(CreateDeliveryModel delivery) async {
    emit(DeliveryLoading());

    final result = await createDeliveryUsecase.call(delivery);
    result.fold(
      (l) => emit(DeliveryFailure(message: l)),
      (r) {
        if (r is CreateDeliveryModel) {
          final responseData = r.toJson();
          log("🚀 Айландырылган JSON: $responseData");

          if (responseData["success"] == true) {
            emit(
              DeliverySuccess(deliveries: responseData),
            );
          } else {
            log("⚠️ Подписка жок, DeliveryFailure чыгарылды");
            emit(const DeliveryFailure(message: "Подписка жок!"));
          }
        } else {
          log("⚠️ Белгисиз жооп форматы!");
          emit(const DeliveryFailure(message: "Белгисиз жооп форматы!"));
        }
      },
    );
  }

  void createSubscription(String duration, String transportType) async {
    emit(DeliveryLoading());

    final result =
        await createSubscriptionUsecase.call(duration, transportType);
    result.fold(
      (l) => emit(DeliveryFailure(message: l)),
      (r) {
        emit(DeliverySuccess(deliveries: r));
      },
    );
  }
}
