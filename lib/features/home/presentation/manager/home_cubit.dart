import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/assets.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  String selectedNumber = '';
  Random random = Random();
  int minDifference = 5;
  final player = AudioPlayer();
  List<String> prevNumbers = [];

  void getSelectedNumber(int max) async {
    emit(HomeLoading());
    await player
        .play(AssetSource(Assets.soundsTick)); // will immediately start playing
    await Future.delayed(const Duration(seconds: 3));
    late String newNumber;
    do {
      newNumber = (random.nextInt(max) + 1).toString();
    } while (prevNumbers.contains(newNumber)|| isTooCloseToPrevious(newNumber));
    selectedNumber = newNumber;
    prevNumbers.add(newNumber);
    player.stop();
    emit(HomeFinished());
  }

  bool isTooCloseToPrevious(String newNumber) {
    if (prevNumbers.isEmpty) return false;
    return (int.parse(newNumber) - int.parse(prevNumbers.last)).abs() < minDifference;
  }

}
