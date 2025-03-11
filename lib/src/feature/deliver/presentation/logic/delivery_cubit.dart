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
    result.fold((l) => emit(DeliveryFailure(message: l)), (r) {
      final responseData = r;

      // `success` маанисин текшеребиз
      if (responseData["success"] == true) {
        emit(DeliverySuccess(deliveries: responseData));

        // // Подпискасы бар болсо, жеткирүү ийгиликтүү бетине өтүү
        // Navigator.pushNamed(context, '/successDeliveryPage');
      } else {
        emit(const DeliveryFailure(message: "Подписка жок!"));

        // // Подпискасы жок болсо, подписка алуу бетине өтүү
        // Navigator.pushNamed(context, '/subscribePage');
      }
    });
  }
}
