import 'dart:developer';

import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'send_state.dart';

class SendCubit extends Cubit<SendState> {
  final CreateSendUsecase createSendUsecase;
  final IsSubscribedSendUsecase isSubscribedSendUsecase;
  SendCubit({
    required this.createSendUsecase,
    required this.isSubscribedSendUsecase,
  }) : super(SendInitial());

  String fromWhere = '';
  String toWhere = '';
  String dispatchDate = '';
  String arrivalDate = '';
  String description = '';
  int boxType = 0;

  void isSubscribed(CreateDeliveryModel delivery) async {
    emit(SendLoading());

    final result = await isSubscribedSendUsecase.call(delivery);
    result.fold(
      (l) {
        emit(SendFailure(message: l));
      },
      (r) {
        if (r is CreateDeliveryModel) {
          final responseData = r.toJson();

          if (responseData["success"] == true) {
            emit(
              SendSuccess(send: responseData),
            );
          } else {
            emit(const SendFailure(message: "Подписка жок!"));
          }
        } else {
          log("⚠️ Белгисиз жооп форматы!");
          emit(const SendFailure(message: "Белгисиз жооп форматы!"));
        }
      },
    );
  }

  void createSend(CreateDeliveryModel send) async {
    emit(SendLoading());

    final result = await createSendUsecase.call(send);
    result.fold(
      (l) => emit(SendFailure(message: l)),
      (r) {
        final responseData = r.toJson();

        if (responseData["success"] == true) {
          emit(
            SendSuccess(
              send: responseData,
              orderNumber: r.random ?? 0,
            ),
          );
        } else {
          emit(const SendFailure(message: "Доставка не создана"));
        }
      },
    );
  }

  void updateSendInfo({
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
