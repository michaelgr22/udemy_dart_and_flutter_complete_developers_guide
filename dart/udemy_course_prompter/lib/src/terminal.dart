import 'dart:io';
import 'package:prompter_mgr/src/option.dart';

class Terminal {
  const Terminal();

  void printPrompt(String prompt) {
    stdout.writeln(prompt);
  }

  void clearScreen() {
    if (Platform.isWindows) {
      stdout.write('\x1B[2J\x1B[0f');
    } else {
      stdout.write('\x1B[2J\x1B[3J\x1B[H');
    }
  }

  String collectInput() {
    return stdin.readLineSync();
  }

  void printOptions(List<Option> options) {
    options.asMap().forEach(
        (index, option) => stdout.writeln('${index + 1}) ${option.label}'));
    stdout.writeln("Enter a choice: \n");
    stdout.write(">");
  }
}
