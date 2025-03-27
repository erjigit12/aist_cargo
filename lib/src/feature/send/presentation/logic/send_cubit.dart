import 'dart:developer';

import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'send_state.dart';

class SendCubit extends Cubit<SendState> {
  final CreateSendUsecase createSendUsecase;
  SendCubit({required this.createSendUsecase}) : super(SendInitial());

  String fromWhere = '';
  String toWhere = '';
  String dispatchDate = '';
  String arrivalDate = '';
  String description = '';
  int boxType = 0;

  void isSubscribed(CreateDeliveryModel sendModel) async {
    emit(SendLoading());

    final result = await createSendUsecase.call(sendModel);
    return result.fold(
      (l) => emit(SendFailure(message: l)),
      (r) {
        if (r is CreateDeliveryModel) {
          final responseData = r.toJson();
          log("🚀 Айландырылган JSON: $responseData");

          if (responseData["success"] == true) {
            emit(
              SendSuccess(send: responseData),
            );
          } else {
            log("⚠️ Подписка жок, SendFailure чыгарылды");
            emit(const SendFailure(message: "Подписка жок!"));
          }
        } else {
          log("⚠️ Белгисиз жооп форматы!");
          emit(const SendFailure(message: "Белгисиз жооп форматы!"));
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
