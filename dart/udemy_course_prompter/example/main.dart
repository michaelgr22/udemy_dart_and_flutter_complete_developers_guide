import 'package:prompter_mgr/prompter_mgr.dart';

void main() {
  var options = [
    Option(label: 'I want red', value: '#f00'),
    Option(label: 'I want blue', value: '#f01')
  ];

  final prompter = Prompter();

  String colorCode = prompter.askMultiple('Select a color', options);

  bool answer = prompter.askBinary('Do you like this lib?');

  print(colorCode);
  print(answer);
}
