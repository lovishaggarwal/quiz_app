
import 'package:quiz_app_1/utilities.dart';

var questions = [
  QuizQuestion(
    question: 'What are the main building blocks of Flutter UIs?',
    options: [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
    answer: 'Widgets',
  ),
  QuizQuestion(
    question: 'How are Flutter UIs built?',
    options: [
      'By defining widgets in config files',
      'By using XCode for iOS and Android Studio for Android',
      'By combining widgets in code',
      'By combining widgets in a visual editor',
    ],
    answer: 'By combining widgets in code',
  ),
  QuizQuestion(
    question: 'What\'s the purpose of a StatefulWidget?',
    options: [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
    answer: 'Update UI as data changes',
  ),
  QuizQuestion(
    question:
        'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    options: [
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
      'StatelessWidget',
    ],
    answer: 'StatelessWidget',
  ),
  QuizQuestion(
    question: 'What happens if you change data in a StatelessWidget?',
    options: [
      'Any nested StatefulWidgets are updated',
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
    ],
    answer: 'The UI is not updated',
  ),
  QuizQuestion(
    question: 'How should you update data inside of StatefulWidgets?',
    options: [
      'By calling updateData()',
      'By calling updateUI()',
      'By calling setState()',
      'By calling updateState()',
    ],
    answer: 'By calling setState()',
  ),
];
