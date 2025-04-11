import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_state.dart';

class AllCubit extends Cubit<AllState> {
  final GetDeliveryByIdUsecase getDeliveryByIdUsecase;

  AllCubit({required this.getDeliveryByIdUsecase}) : super(AllInitial());

  Future<void> fetchDelivery(int id) async {
    emit(DeliveryLoading());
    try {
      final delivery = await getDeliveryByIdUsecase(id);
      emit(DeliveryLoaded(delivery));
    } catch (e) {
      emit(DeliveryError(e.toString()));
    }
  }
}
