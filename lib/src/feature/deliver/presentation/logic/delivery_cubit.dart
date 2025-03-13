import 'dart:developer';

import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  final CreateDeliveryUsecase createDeliveryUsecase;
  DeliveryCubit({
    required this.createDeliveryUsecase,
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
}
