import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_state.dart';

class AllCubit extends Cubit<AllState> {
  AllCubit() : super(AllInitial());
}
