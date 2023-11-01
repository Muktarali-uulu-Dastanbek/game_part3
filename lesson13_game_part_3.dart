import 'dart:io';
import 'dart:math';

void main() {
  start_game();
}

start_game() {
  print("Выберите режим игры: 1 или 2");
  print("1-режим. Угадывать будете вы.");
  print("2-режим. Угадывать будет компьютер");

  String gameMode = stdin.readLineSync()!; // gameMode - режим игры

  if (gameMode == '1') {
    int x = 1 + Random().nextInt(100);
    computer(x);
  } else if (gameMode == '2') {
    print("Загадайте число в диапазоне[0-100) и затем");
    computerModeHelper();
  } else {
    start_game();
  }
}

computerModeHelper() {
  print("Выбирайте способ угадывания:");
  print("1-режим. Рандомный метод.");
  print("2-режим. Бинарный метод");

  String a = stdin.readLineSync()!;

  if (a == '1') {
    random_search();
  } else if (a == '2') {
    binary_search();
  } else {
    computerModeHelper();
  }
}

void computer(int chislo) {
  int count = 0;
  int a = -1;

  print("Отгадайте число которое загадал компьютер:");

  while (a != chislo) {
    print("-------------------------------");
    a = int.parse(stdin.readLineSync()!);

    if (a > 0 && a <= 100) {
      count++;
      print("Попытка ------ $count");

      if (a > chislo) {
        print("greater ----- ваше число больше");
      } else if (a < chislo) {
        print("less ----- ваше число меньше");
      }
    } else {
      print("Введите числа в диапазоне[1:100]");
    }
  }

  print("yes");
  print("Вы нашли загаданное число компа за $count попыток");
}

int random_search() {
  int counter = 0;
  int min = 0;
  int max = 100;
  int randomChislo = -1;
  String userAnswer = "";

  while (userAnswer != "=") {
    counter++;
    randomChislo = min + Random().nextInt(max - min);
    print("vashe chislo -$randomChislo?");
    userAnswer = stdin.readLineSync()!;

    if (userAnswer == "+") {
      min = randomChislo + 1;
    } else if (userAnswer == "-") {
      max = randomChislo;
    } else if (userAnswer != "=") {
      counter--;
      print('Ответьте символами "+" и "-"');
    }
  }
  print("vashe chislo - $randomChislo.");
  print("kolichestvo popytok(rondom_search)=$counter");

  return counter;
}

int binary_search() {
  int count = 0;
  int min = 0;
  int max = 100;
  int mid = -1;
  String userAnswer = "";

  while (userAnswer != "=") {
    mid = (min + max) ~/ 2;
    count++;
    print("vashe chislo -$mid?");

    userAnswer = stdin.readLineSync()!;

    if (userAnswer == "+") {
      min = mid;
    } else if (userAnswer == "-") {
      max = mid;
    } else if (userAnswer != "=") {
      count--;
      print('Ответьте символами "+" и "-"');
    }
  }

  print("vashe chislo - $mid.");
  print("kolichestvo popytok(rondom_search)=$count");

  return count;
}
