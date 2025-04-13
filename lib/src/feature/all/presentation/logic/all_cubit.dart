import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'all_state.dart';

class AllCubit extends Cubit<AllState> {
  final GetDeliveryByIdUsecase getDeliveryByIdUsecase;
  final GetSendByIdUsecase getSendByIdUsecase;

  AllCubit({
    required this.getDeliveryByIdUsecase,
    required this.getSendByIdUsecase,
  }) : super(AllInitial());

  Future<void> fetchDelivery() async {
    emit(DeliveryLoadin());

    SharedPreferences storage = await SharedPreferences.getInstance();
    var deliveryId = storage.getInt('deliveryId');
    try {
      final delivery = await getDeliveryByIdUsecase(deliveryId ?? -1);
      emit(DeliveryLoaded(delivery: delivery));
    } catch (e) {
      emit(DeliveryError(e.toString()));
    }
  }

  Future<void> fetchSend() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var sendId = storage.getInt('sendId');
    try {
      final send = await getSendByIdUsecase(sendId ?? -1);
      emit(DeliveryLoaded(send: send));
    } catch (e) {
      emit(DeliveryError(e.toString()));
    }
  }
}
