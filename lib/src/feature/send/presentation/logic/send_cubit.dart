import 'dart:developer';

import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'send_state.dart';

class SendCubit extends Cubit<SendState> {
  final CreateSendUsecase createSendUsecase;
  SendCubit({required this.createSendUsecase}) : super(SendInitial());

  void createSend(CreateDeliveryModel sendModel) async {
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
}
