// Объявление константы для версии приложения
const version = '0.0.1';

void main(List<String> arguments) {
  // Если аргументы командной строки не переданы - выводим приветствие
  if (arguments.isEmpty) {
    print('Hello, Kirill!');
  } 
  // Если первый аргумент равен 'version' - выводим версию CLI
  else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version'); // $version - строковая интерполяция
  }
}