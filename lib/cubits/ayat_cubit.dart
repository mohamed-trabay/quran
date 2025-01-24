import 'package:bloc/bloc.dart';
import '../models/ayat_data.dart';
import 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  AyatCubit() : super(AyatInitial());

  void loadAyat() {
    try {
      emit(AyatLoaded(sourData));
    } catch (e) {
      emit(AyatError('Failed to load data'));
    }
  }
}
