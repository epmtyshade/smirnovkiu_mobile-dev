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

// Функция поиска в Wikipedia (получает аргументы команды search)
void searchWikipedia(List<String>? arguments) {
  print('searchWikipedia received arguments: $arguments');
}

// Функция для отображения справки по доступным командам
void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}