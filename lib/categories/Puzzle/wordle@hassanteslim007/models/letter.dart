// ignore_for_file: public_member_api_docs, sort_constructors_first
class Letter {
  final String value;
  final LetterStatus status;

  Letter(this.value, {this.status = LetterStatus.initial});

  factory Letter.empty() => Letter('');

  Letter copyWith({
    String? value,
    LetterStatus? status,
  }) {
    return Letter(
      value ?? this.value,
      status: status ?? this.status,
    );
  }

  @override
  String toString() => '$value${status != LetterStatus.initial ? status : ''}';

  @override
  bool operator ==(covariant Letter other) {
    if (identical(this, other)) return true;

    return other.value == value && other.status == status;
  }

  @override
  int get hashCode => value.hashCode ^ status.hashCode;
}

enum LetterStatus { initial, correct, inWord, wrong }
