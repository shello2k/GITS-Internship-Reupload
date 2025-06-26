import 'dart:io';

List<int> generateA000124(int n) {
  List<int> sequence = [];
  for (int i = 0; i < n; i++) {
    int value = ((i * (i + 1)) ~/ 2) + 1;
    sequence.add(value);
  }
  return sequence;
}

void main() {
  stdout.write('Masukkan angka: ');
  String? input = stdin.readLineSync();

  if (input == null) {
    print('Input tidak valid.');
    return;
  }

  int? number = int.tryParse(input);

  if (number == null || number <= 0) {
    print('Masukkan angka lebih dari 0');
    return;
  }

  List<int> result = generateA000124(number);
  print('Hasil: ${result.join('-')}');
}
