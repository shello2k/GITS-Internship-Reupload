import 'dart:io';

bool isValid(String s) {                                    //fungsi menerima string dan mengembalikkan boolean, true jika string valid, false jika tidak
  if (s.length % 2 != 0) return false;                      //kondisi jika panjang string ganjil, automatis tidak valid

  List<String> stack = [];                                  

  for (int i = 0; i < s.length; i++) {                      //looping buat membaca setiap karakter dalam string, satu per satu.
    String char = s[i];

    if (char == '(') {                                      //cek karakter buka dan penutupnya
      stack.add(')');
    } else if (char == '[') {
      stack.add(']');
    } else if (char == '{') {
      stack.add('}');
    } else {
      if (stack.isEmpty || stack.removeLast() != char) {    //if karakter saat ini kurung tutup: (1) stack kosong, tidak ada pembuka agar seimbang, return false. (2) stack paling atas bukan pasangan yang cocok, return false.
        return false;
      }
    }
  }

  return stack.isEmpty;                                     // (1) if stack masih ada isinya, maka ada pembuka yang belum ditutup, alhasil false. (2) if stack kosong, maka semua pasangan kurung sudah ditutup, alhasil true.
}

void main() {
  stdout.write("Input: ");
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print("Input salah!");
    return;
  }

  bool result = isValid(input);
  print(result ? "YES" : "NO");
}
