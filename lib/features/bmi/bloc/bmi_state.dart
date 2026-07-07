part of 'bmi_bloc.dart';

class BmiState {
  final bool isMale;
  final double sliderValue;
  final int weight;
  final int age;

  BmiState({
    this.isMale = false,
    this.sliderValue = 160.0,
    this.weight = 60,
    this.age = 20,
  });

  BmiState copyWith({
    bool? isMale,
    double? sliderValue,
    int? weight,
    int? age,
  }) {
    return BmiState(
      isMale: isMale ?? this.isMale,
      sliderValue: sliderValue ?? this.sliderValue,
      weight: weight ?? this.weight,
      age: age ?? this.age,
    );
  }
}
