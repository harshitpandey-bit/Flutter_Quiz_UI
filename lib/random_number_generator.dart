import 'dart:math';
class RandomNumberGenerator{
  final Random _random = Random();


  int get num1 => _random.nextInt(100);
  int get num2 => _random.nextInt(100);
}

