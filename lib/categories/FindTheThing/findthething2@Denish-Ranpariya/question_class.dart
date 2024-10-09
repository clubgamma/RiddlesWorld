class QuestionClass {
  String option1;
  String option2;
  String option3;
  String option4;
  String correctAnswer;
  String description;

  QuestionClass({
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.correctAnswer,
    required this.description,
  });
}

List<QuestionClass> questionList = [
  new QuestionClass(
    option1: 'Dollar',
    option2: 'Peso',
    option3: 'Ounce',
    option4: 'Euro',
    correctAnswer: 'Ounce',
    description:
        'All except Ounce are names of currencies, while Ounce is a unit of weight.',
  ), //1
  new QuestionClass(
    option1: 'Geometry',
    option2: 'Algebra',
    option3: 'Calculus',
    option4: 'Thermodynamics',
    correctAnswer: 'Thermodynamics',
    description: 'All except Thermodynamics are topics of Mathematics.',
  ), //2
  new QuestionClass(
    option1: 'Square',
    option2: 'Triangle',
    option3: 'Rectangle',
    option4: 'Cuboid',
    correctAnswer: 'Cuboid',
    description: 'All except Cuboids are 3 dimensional figures.',
  ), //3
  new QuestionClass(
    option1: 'Fish',
    option2: 'Snake',
    option3: 'Crocodile',
    option4: 'Whale',
    correctAnswer: 'Whale',
    description: 'All except Whale lay eggs.',
  ), //4
  new QuestionClass(
    option1: 'Spoon',
    option2: 'Sword',
    option3: 'Knife',
    option4: 'Fork',
    correctAnswer: 'Sword',
    description: 'All except sword are used in kitchen.',
  ), //5
  new QuestionClass(
    option1: 'Copper',
    option2: 'Iron',
    option3: 'Iodine',
    option4: 'Tin',
    correctAnswer: 'Iodine',
    description: 'Except iodine rest are metals while iodine is non metal.',
  ), //6
];
