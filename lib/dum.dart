import 'dart:math';

void main() {
  getNumber();
}

void getNumber() {
  Random random = new Random();
  int randomNumber = random.nextInt(12); // from 0 upto 11 included
  print(randomNumber);
}
