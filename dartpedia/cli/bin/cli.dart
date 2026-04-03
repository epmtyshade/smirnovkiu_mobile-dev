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
  // Если первый аргумент 'search' - команда поиска
  else if (arguments.first == 'search') {
    // Получаем аргументы после 'search' (или null, если их нет)
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs); // Вызываем функцию поиска
  } 
  // Любая другая нераспознанная команда - тоже показываем справку
  else {
    printUsage(); // Обработка неизвестных команд
  }
}

// Функция поиска в Wikipedia (с имитацией результатов)
void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // Если пользователь не передал аргументы - запрашиваем название статьи
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Ожидаем ввод и подставляем пустую строку, если ввод равен null
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Иначе объединяем все аргументы в одну строку
    articleTitle = arguments.join(' ');
  }

  // Имитация процесса поиска
  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');
}

// Асинхронная функция для получения статьи из Wikipedia API
Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );
  return 'Article content for: $articleTitle'; // Временный возврат
}

// Функция для отображения справки по доступным командам
void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}

