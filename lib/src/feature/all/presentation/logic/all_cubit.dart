import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'all_state.dart';

class AllCubit extends Cubit<AllState> {
  final GetDeliveryByIdUsecase getDeliveryByIdUsecase;

  AllCubit({
    required this.getDeliveryByIdUsecase,
  }) : super(AllInitial());

  Future<void> fetchDelivery() async {
    emit(DeliveryLoadin());

    SharedPreferences storage = await SharedPreferences.getInstance();
    var deliveryId = storage.getInt('deliveryId');
    try {
      final delivery = await getDeliveryByIdUsecase(deliveryId ?? -1);
      emit(DeliveryLoaded(delivery));
    } catch (e) {
      emit(DeliveryError(e.toString()));
    }
  }
}
