class Question {
  String question;
  List<String> options;
  String answer;

  Question({
  required  this.question,
   required this.options,
  required  this.answer,
  });
}

List<Question> questions = [
  Question(
    question: '''You, you may say I'm a dreamer
But I'm not the only one
I hope someday you will join us
And the world will be as one''',
    options: ['Jealous Guy', 'Woman', 'Dream', 'Imagine'],
    answer: 'Imagine',
  ),
  Question(
    question: '''Don't carry the world upon your shoulders
For well you know that it's a fool who plays it cool
By making his world a little colder''',
    options: ['I Want to Hold Your Hand', 'Hey Jude', 'In My Life', 'Yesterday'],
    answer: 'Hey Jude',
  ),
  Question(
    question: '''When I'm drivin' in my car, and the man come on the radio
He's tellin' me more and more about some useless information
Supposed to fire my imagination''',
    options: ["(I Can't Get No) Satisfaction", 'Wild Horses', 'Paint It, Black', 'Gimme Shelter'],
    answer: "(I Can't Get No) Satisfaction",
  ),
  Question(
    question: '''Love was such an easy game to play
Now I need a place to hide away
Oh, I believe in yesterday
Why she had to go, I don't know, she wouldn't say''',
    options: ['A Day in the Life', 'Come Together', 'Yesterday', 'Love Me Do'],
    answer: 'Yesterday',
  ),
  Question(
    question: '''Close my eyes, she's somehow closer now
Softly smile, I know she must be kind
When I look in her eyes
She goes with me to a blossom world''',
    options: ['Good Vibrations', 'Fun, Fun, Fun', 'I Get Around', 'Do It Again'],
    answer: 'Good Vibrations',
  ),
  Question(
    question: '''With the lights out, it's less dangerous
Here we are now, entertain us
I feel stupid and contagious
Here we are now, entertain us''',
    options: ['In Bloom', 'About A Girl', 'Smells Like Teen Spirit', 'All Apologies'],
    answer: 'Smells Like Teen Spirit',
  ),
  Question(
    question: '''He used to carry his guitar in a gunny sack
Go sit beneath the tree by the railroad track
Oh, the engineers would see him sitting in the shade''',
    options: ['Maybellene', 'Little Queenie', 'Rocking on the Railroad', 'Johnny B. Goode'],
    answer: 'Johnny B. Goode',
  ),
  Question(
    question: '''Yeah, you've got that something
I think you'll understand
When I say that something''',
    options: ['Something', 'Penny Lane', 'I Want To Hold Your Hand', 'She Loves You'],
    answer: 'I Want To Hold Your Hand',
  ),
  Question(
    question: '''Yes, 'n' how many years can a mountain exist
Before it is washed to the sea?
Yes, 'n' how many years can some people exist
Before they're allowed to be free?''',
    options: ['Blowin’ In The Wind', 'Like A Rolling Stone', 'Not Dark Yet', 'Mr. Tambourine Man'],
    answer: 'Blowin’ In The Wind',
  ),
  Question(
    question: '''If you should ever leave me
Though life would still go on, believe me
The world could show nothing to me
So what good would living do me''',
    options: ["Don't Worry Baby", 'California Girls', "Surfin'", 'God Only Knows'],
    answer: 'God Only Knows',
  ),
];
