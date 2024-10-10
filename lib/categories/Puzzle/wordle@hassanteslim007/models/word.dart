import 'package:riddleworld/categories/Puzzle/wordle@hassanteslim007/models/letter.dart';

class Word {
  final List<Letter> letters;

  Word(this.letters);

  String get wordString => letters.map((e) => e.value).join();

  void addLetter(String val) {
    int currentIndex = letters.indexWhere((element) => element.value.isEmpty);
    if (currentIndex != -1) {
      letters[currentIndex] = Letter(val);
    }
  }

  void removeLetter() {
    int currentIndex =
        letters.lastIndexWhere((element) => element.value.isNotEmpty);
    if (currentIndex != -1) {
      letters[currentIndex] = Letter.empty();
    }
  }

  @override
  String toString() => '$letters';
}
