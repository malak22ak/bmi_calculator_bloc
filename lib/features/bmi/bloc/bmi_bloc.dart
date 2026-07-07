import 'package:bloc/bloc.dart';

part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiState()) {
    on<ChangeGender>((event, emit) {
      emit(state.copyWith(isMale: event.newGender));
    });

    on<ChangeSlider>((event, emit) {
      emit(state.copyWith(sliderValue: event.newSlider));
    });

    on<ChangeWeight>((event, emit) {
      emit(state.copyWith(weight: event.newWeight));
    });

    on<ChangeAge>((event, emit) {
      emit(state.copyWith(age: event.newAge));
    });
  }
}
