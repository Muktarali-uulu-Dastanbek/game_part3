import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  print("Выберите режим игры: 1 или 2");
  print("1-режим. Угадывать будете вы.");
  print("2-режим. Угадывать будет компьютер");
  int a = int.parse(stdin.readLineSync()!);
  if (a == 1) {
    int x = 1 + Random().nextInt(100);
    computer(x);
  } else if (a == 2) {
    print("Загадайте число в диапазоне[0-100)");
    int b = int.parse(stdin.readLineSync()!);
    print("Выбирайте способ угадывания:");
    print("1-режим. Рандомный метод.");
    print("2-режим. Бинарный метод");
    int a = int.parse(stdin.readLineSync()!);
    if (a == 1) {
      zadacha2_1(b);
    } else if (a == 2) {
      zadacha2_2(b);
    }
  }
}

void computer(int chislo) {
  int count = 0;
  print("Отгадайте число которое загадал компьютер:");
  int a = -1;
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

int zadacha2_1(int chislo) {
  int counter = 1;
  int min = 0;
  int max = 100;
  int a = -1;
  while (chislo != a) {
    counter++;
    a = min + Random().nextInt(max - min);
    if (a < chislo) {
      min = a + 1;
    } else {
      max = a;
    }
  }
  print("kolichestvo popytok(rondom_search)=$counter");
  return counter;
}

int zadacha2_2(int chislo) {
  int count = 1;
  int min = 0;
  int max = 100;
  int mid = (min + max) ~/ 2;
  while (chislo != mid) {
    if (chislo > mid) {
      min = mid;
    } else {
      max = mid;
    }
    mid = (min + max) ~/ 2;
    count++;
  }
  print("kolichestvo popytok(binary_search)=$count");
  return count;
}
