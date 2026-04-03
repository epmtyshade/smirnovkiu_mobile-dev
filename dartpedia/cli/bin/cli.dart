import 'dart:io'; // Добавлен для работы с stdin (ввод пользователя)
import 'package:http/http.dart' as http; // Добавлен для HTTP-запросов к Wikipedia API

// Объявление константы для версии приложения
const version = '0.0.1';

void main(List<String> arguments) {
  // Если нет аргументов или первый аргумент 'help' - показываем справку
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage(); // Вызов функции справки
  } 
  // Если первый аргумент 'version' - показываем версию
  else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } 
  // Если первый аргумент 'wikipedia' - команда поиска в Wikipedia
  else if (arguments.first == 'wikipedia') { // Изменено с 'search' на 'wikipedia'
    // Получаем аргументы после 'wikipedia' (или null, если их нет)
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs); // Вызываем функцию поиска
  } 
  // Любая другая нераспознанная команда - тоже показываем справку
  else {
    printUsage(); // Обработка неизвестных команд
  }
}

// Функция поиска в Wikipedia
void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    final inputFromStdin = stdin.readLineSync(); // Read input
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return; // Exit the function if no valid input
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');

  // Call the API and await the result
  var articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent); // Print the full article response (raw JSON for now)
}

// Асинхронная функция для получения статьи из Wikipedia API
Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );
  final response = await http.get(url); // Make the HTTP request

  if (response.statusCode == 200) {
    return response.body; // Return the response body if successful
  }

  // Return an error message if the request failed
  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
}

// Функция для отображения справки по доступным командам
void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'wikipedia <ARTICLE-TITLE>'"
  );
}