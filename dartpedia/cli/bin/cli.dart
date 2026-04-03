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
  // Любая другая нераспознанная команда - тоже показываем справку
  else {
    printUsage(); // Обработка неизвестных команд
  }
}

// Функция для отображения справки по доступным командам
void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}