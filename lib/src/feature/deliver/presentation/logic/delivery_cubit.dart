import 'dart:developer';

import 'package:aist_cargo/src/feature/deliver/domain/usecases/create_delivery_usecase.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  final IsSubscribedUsecase isSubscribedUsecase;
  final CreateDeliveryUsecase createDeliveryUsecase;
  final CreateSubscriptionUsecase createSubscriptionUsecase;

  DeliveryCubit({
    required this.isSubscribedUsecase,
    required this.createDeliveryUsecase,
    required this.createSubscriptionUsecase,
  }) : super(DeliveryInitial());

  String fromWhere = '';
  String toWhere = '';
  String dispatchDate = '';
  String arrivalDate = '';
  String description = '';
  int boxType = 0;

  void isSubscribed(CreateDeliveryModel delivery) async {
    emit(DeliveryLoading());

    final result = await isSubscribedUsecase.call(delivery);
    result.fold(
      (l) {
        emit(DeliveryFailure(message: l));
      },
      (r) {
        if (r is CreateDeliveryModel) {
          final responseData = r.toJson();

          if (responseData["success"] == true) {
            emit(
              DeliverySuccess(deliveries: responseData),
            );
          } else {
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

  void createDelivery(CreateDeliveryModel delivery) async {
    emit(DeliveryLoading());

    final result = await createDeliveryUsecase.call(delivery);
    result.fold(
      (l) => emit(DeliveryFailure(message: l)),
      (r) {
        if (r is CreateDeliveryModel) {
          final responseData = r.toJson();

          if (responseData["success"] == true) {
            emit(
              DeliverySuccess(
                deliveries: responseData,
                orderNumber: r.random ?? 0,
              ),
            );
          } else {
            emit(const DeliveryFailure(message: "Доставка не создана"));
          }
        } else {
          log("⚠️ Белгисиз жооп форматы!");
          emit(const DeliveryFailure(message: "Белгисиз жооп форматы!"));
        }
      },
    );
  }

  void updateDeliveryInfo({
    required String fromWhere,
    required String toWhere,
    required String dispatchDate,
    required String arrivalDate,
    required String description,
    required int boxType,
  }) {
    this.fromWhere = fromWhere;
    this.toWhere = toWhere;
    this.dispatchDate = dispatchDate;
    this.arrivalDate = arrivalDate;
    this.description = description;
    this.boxType = boxType;
  }
}
