import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  final CreateDeliveryUsecase createDeliveryUsecase;
  DeliveryCubit({
    required this.createDeliveryUsecase,
  }) : super(DeliveryInitial());

  void createDeliveries(
    String fromWhere,
    String toWhere,
    String dispatchDate,
    String arrivalDate,
    String description,
  ) async {
    emit(DeliveryLoading());

    final result = await createDeliveryUsecase.call(
      fromWhere,
      toWhere,
      dispatchDate,
      arrivalDate,
      description,
    );
    result.fold(
      (l) => emit(DeliveryFailure(message: l)),
      (r) => emit(DeliverySuccess(deliveries: r)),
    );
  }
}
