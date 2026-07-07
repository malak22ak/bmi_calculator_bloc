import 'package:bmi_with_bloc/core/constants/constants.dart';
import 'package:bmi_with_bloc/features/bmi/bloc/bmi_bloc.dart';
import 'package:bmi_with_bloc/features/bmi/views/math_page.dart';
import 'package:bmi_with_bloc/features/bmi/views/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<BmiBloc, BmiState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: _buildGenderCard(
                        icon: Icons.male,
                        text: 'MALE',
                        isSelected: state.isMale,
                        onTap: () => context.read<BmiBloc>().add(
                          ChangeGender(newGender: true),
                        ),
                        screenWidth: screenWidth,
                      ),
                    ),
                    Expanded(
                      child: _buildGenderCard(
                        icon: Icons.female,
                        text: 'FEMALE',
                        isSelected: !state.isMale,
                        onTap: () => context.read<BmiBloc>().add(
                          ChangeGender(newGender: false),
                        ),
                        screenWidth: screenWidth,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: containerColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${state.sliderValue.round()}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: redColor,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          overlayColor: redColor.withOpacity(.3),
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12,
                          ),
                        ),
                        child: Slider(
                          min: 100,
                          max: 220,
                          value: state.sliderValue,
                          onChanged: (value) {
                            context.read<BmiBloc>().add(
                              ChangeSlider(newSlider: value),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: _buildCounterCard(
                        label: 'WEIGHT',
                        value: state.weight,
                        onAdd: () => context.read<BmiBloc>().add(
                          ChangeWeight(newWeight: state.weight + 1),
                        ),
                        onRemove: () => context.read<BmiBloc>().add(
                          ChangeWeight(newWeight: state.weight - 1),
                        ),
                        screenWidth: screenWidth,
                      ),
                    ),
                    Expanded(
                      child: _buildCounterCard(
                        label: 'AGE',
                        value: state.age,
                        onAdd: () => context.read<BmiBloc>().add(
                          ChangeAge(newAge: state.age + 1),
                        ),
                        onRemove: () => context.read<BmiBloc>().add(
                          ChangeAge(newAge: state.age - 1),
                        ),
                        screenWidth: screenWidth,
                      ),
                    ),
                  ],
                ),
              ),

              MaterialButton(
                minWidth: double.infinity,
                height: screenHeight * 0.08,
                color: redColor,
                onPressed: () {
                  final brain = CalculatorBrain(
                    state.sliderValue.toInt(),
                    state.weight,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(
                        bmi: brain.calculateBMI(),
                        result: brain.getResult(),
                        interpretation: brain.getInterpretation(),
                      ),
                    ),
                  );
                },
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGenderCard({
    required IconData icon,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    required double screenWidth,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? redColor : containerColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: screenWidth * 0.18, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterCard({
    required String label,
    required int value,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
    required double screenWidth,
  }) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: containerColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.grey),
          ),
          Text(
            '$value',
            style: TextStyle(
              fontSize: screenWidth * 0.12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRoundButton(icon: Icons.remove, onPressed: onRemove),
              const SizedBox(width: 15),
              _buildRoundButton(icon: Icons.add, onPressed: onAdd),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoundButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: const Color(0xFF4C4F5E),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
      ),
    );
  }
}
