import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:occupied/common/my_dimens.dart';

class ProviderGame extends ChangeNotifier {

  VoidCallback? onEnd;

  int countPieces = 1;
  int explodeIndex = -1;

  double gridX = 50;
  double gridY = 200;
  double gridW = 250;
  double gridH = 250;

  double cellW = 50;
  double cellH = 50;

  double borderW = 2;

  List<bool> cellFlags = [];

  //-- For Timer
  Timer? _timer;
  int countTime = 0;
  int explodeTime = 0;

  final minePeriod = 10;  //-- Seconds
  final periodDiv = 10;   //-- Division per 1 sec
  final periodSteps = 100; // minePeriod * periodDiv


  void initDimens() {
    gridW = MyDimens.minAspect * 0.8;
    gridH = MyDimens.minAspect * 0.8;
    gridX = (MyDimens.screenWidth - gridW) / 2;
    gridY = MyDimens.screenHeight * 0.15;

    cellW = gridW / 5;
    cellH = gridH / 5;
  }


  void initCells(int count) {
    int i = 0;
    int index = 0;
    cellFlags.clear();
    for (i = 0; i < 25; i++) {
      cellFlags.add(false);
    }
    for (i = 0; i < count; i++) {
      do {
        index = Random().nextInt(100) % 25;
      } while (cellFlags[index]);
      cellFlags[index] = true;
    }
  }


  void move(int src, int dst) {
    cellFlags[src] = false;
    cellFlags[dst] = true;
    notifyListeners();
  }


  void start() {
    if (_timer != null) {
      _timer!.cancel();
    }
    countTime = 0;
    _timer = Timer.periodic(
      Duration(milliseconds: 1000 ~/ periodDiv),
      onTimer,
    );
  }


  void stop() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    explodeIndex = -1;
    explodeTime = 0;
  }


  void onTimer(Timer timer) {
    countTime++;
    if (countTime - explodeTime > 3 && explodeTime != 0) {
      explodeIndex = -1;
      explodeTime = 0;
    }
    if (countTime % periodSteps == 0) {
      explode();
    }
    notifyListeners();
  }


  void explode() {
    explodeIndex = Random().nextInt(100) % 25;
    explodeTime = countTime;
    if (cellFlags[explodeIndex]) {
      cellFlags[explodeIndex] = false;
      countPieces--;
      if (countPieces <= 0) {
        Future.delayed(const Duration(milliseconds: 500), () {
          stop();
          if (onEnd != null) {
            onEnd!();
          }
        });
      }
    }
  }

}