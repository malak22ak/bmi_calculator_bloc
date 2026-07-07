part of 'bmi_bloc.dart';

abstract class BmiEvent {}

class ChangeGender extends BmiEvent {
  final bool newGender;
  ChangeGender({required this.newGender});
}

class ChangeSlider extends BmiEvent {
  final double newSlider;
  ChangeSlider({required this.newSlider});
}

class ChangeWeight extends BmiEvent {
  final int newWeight;
  ChangeWeight({required this.newWeight});
}

class ChangeAge extends BmiEvent {
  final int newAge;
  ChangeAge({required this.newAge});
}
