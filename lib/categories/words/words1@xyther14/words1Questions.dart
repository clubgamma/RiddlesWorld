class Questions {
  String question;
  List<String> options;
  int correctOption;

  Questions({
    this.question,
    this.options,
    this.correctOption,
  });
}

List<Questions> questions = [
  Questions(question: 'I’m tall when I’m young, and I’m short when I’m old. What am I?', options: ['A rabbit', 'A candle', 'A soap', 'A phone'], correctOption: 1),
  Questions(question: 'What is always in front of you but can’t be seen?', options: ['Future', 'The door', 'Cricket Score', 'TV'], correctOption: 0),
  Questions(question: 'What can you catch, but not throw?', options: ['A ball', 'A cold', 'A book', 'A star'], correctOption: 1),
  Questions(question: 'I speak without a mouth and hear without ears. I have no body, but I come alive with wind. What am I? ', options: ['Youtube', 'Snake', 'Storm', 'Echo'], correctOption: 3),
  Questions(question: ' I have cities, but no houses. I have mountains, but no trees. I have water, but no fish. What am I?', options: ['Volcanoes', 'Moon', 'Map', 'Forests'], correctOption: 2),
];




