import 'dart:io'; // Добавлен для работы с stdin (ввод пользователя)
import 'package:http/http.dart' as http; // Добавлен для HTTP-запросов к Wikipedia API
import 'package:command_runner/command_runner.dart'; // Добавлен для использования CommandRunner

void main(List<String> arguments) async { // main теперь async и ожидает runner
  var runner = CommandRunner(); // Создаём экземпляр CommandRunner
  await runner.run(arguments); // Вызываем его метод run
}