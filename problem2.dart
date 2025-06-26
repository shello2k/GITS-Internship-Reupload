import 'dart:io';

List<int> denseRanking(List<int> scores, List<int> gitsScores) {                  //deklarasi fungsi, scores = list skor pemain, gitsScores = list skor yang didapatkan gits
  List<int> uniqueScores = scores.toSet().toList()                                //membersihkan skor duplikat
    ..sort((b, a) => a.compareTo(b));                                             //sort dari besar ke kecil
  List<int> result = [];                                                          //menyimpan hasil ranking skor GITS

  for (int gitsScore in gitsScores) {                                             //looping skor gits
    int rank = 1;

    while (rank <= uniqueScores.length && gitsScore < uniqueScores[rank - 1]) {   //selama ranking blm melebihi panjang list, dan skor gits lebih kecil dari skor pemain lain yang lg di cek, maka naikkan rank sampe gits cocok di ranking yg sesuai.
      rank++;
    }
    result.add(rank);                                                             //memasukkan hasil ke result
  }
  return result;
}

void main() {
  stdout.write("Masukkan jumlah pemain: ");
  int n = int.parse(stdin.readLineSync()!);

  stdout.write("Masukkan skor pemain (diurutkan dari nilai terbesar ke nilai terkecil): ");
  List<int> scores = stdin.readLineSync()!
      .split(' ')
      .map(int.parse)
      .toList();

  stdout.write("Masukkan jumlah permainan yang diikuti GITS: ");
  int m = int.parse(stdin.readLineSync()!);

  stdout.write("Masukkan skor yang didapatkan GITS: ");
  List<int> gitsScores = stdin.readLineSync()!
      .split(' ')
      .map(int.parse)
      .toList();

  List<int> result = denseRanking(scores, gitsScores);

  print("Output:");
  print(result.join(' '));
}
