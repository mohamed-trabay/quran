
import '../models/AyatSour_model.dart';

abstract class AyatState {}

class AyatInitial extends AyatState {}

class AyatLoaded extends AyatState {
  final List<AyatSour> sourList;

  AyatLoaded(this.sourList);
}

class AyatError extends AyatState {
  final String error;

  AyatError(this.error);
}
