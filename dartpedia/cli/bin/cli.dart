import 'dart:io'; // Добавлен для работы с stdin (ввод пользователя)

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

// Функция поиска в Wikipedia
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

  print('Current article title: $articleTitle');
}

// Функция для отображения справки по доступным командам
void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}