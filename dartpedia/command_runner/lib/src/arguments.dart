import 'dart:async'; // Для FutureOr (синхронный или асинхронный результат)
import 'dart:collection'; // Для UnmodifiableSetView (неизменяемое представление)
import '../command_runner.dart'; // Для CommandRunner (исполнитель команд)

// Тип опции: flag (флаг, без значения) или option (с значением)
enum OptionType { flag, option }

// Абстрактный базовый класс для всех аргументов командной строки
abstract class Argument {
  String get name; // Уникальное имя аргумента
  String? get help; // Описание аргумента (опционально)
  Object? get defaultValue; // Значение по умолчанию (bool для флагов, String для опций)
  String? get valueHelp; // Подсказка для ожидаемого значения (опционально)
  String get usage; // Строка использования аргумента
}

// Класс для опций командной строки (например --verbose или --output=file.txt)
class Option extends Argument {
  Option(
    this.name, {
    required this.type, // Тип опции (flag или option)
    this.help,
    this.abbr, // Короткая форма (например -v вместо --verbose)
    this.defaultValue,
    this.valueHelp,
  });

  @override
  final String name;
  final OptionType type;
  @override
  final String? help;
  final String? abbr;
  @override
  final Object? defaultValue;
  @override
  final String? valueHelp;

  @override
  String get usage {
    if (abbr != null) {
      return '-$abbr,--$name: $help'; // С короткой формой
    }
    return '--$name: $help'; // Только длинная форма
  }
}

// Абстрактный класс для команд (исполняемых действий)
abstract class Command extends Argument {
  @override
  String get name; // Имя команды
  String get description; // Описание команды
  bool get requiresArgument => false; // Требует ли команда аргумента

  late CommandRunner runner; // Ссылка на исполнитель команд

  @override
  String? help;
  @override
  String? defaultValue;
  @override
  String? valueHelp;

  final List<Option> _options = []; // Внутренний список опций

  // Неизменяемое представление опций команды
  UnmodifiableSetView<Option> get options =>
      UnmodifiableSetView(_options.toSet());

  // Добавление флага (булевой опции без значения)
  void addFlag(String name, {String? help, String? abbr, String? valueHelp}) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: false,
        valueHelp: valueHelp,
        type: OptionType.flag,
      ),
    );
  }

  // Добавление опции (принимает значение)
  void addOption(
    String name, {
    String? help,
    String? abbr,
    String? defaultValue,
    String? valueHelp,
  }) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: defaultValue,
        valueHelp: valueHelp,
        type: OptionType.option,
      ),
    );
  }

  // Абстрактный метод выполнения команды (должен быть реализован в подклассах)
  FutureOr<Object?> run(ArgResults args);

  @override
  String get usage {
    return '$name:  $description'; // Простая строка использования
  }
}

// Результаты разбора аргументов командной строки
class ArgResults {
  Command? command; // Найденная команда
  String? commandArg; // Аргумент команды
  Map<Option, Object?> options = {}; // Карта опций и их значений

  // Возвращает true, если флаг существует и установлен
  bool flag(String name) {
    // Проверяем только флаги (тип flag)
    for (var option in options.keys.where(
      (option) => option.type == OptionType.flag,
    )) {
      if (option.name == name) {
        return options[option] as bool;
      }
    }
    return false;
  }

  // Проверяет, существует ли опция с указанным именем
  bool hasOption(String name) {
    return options.keys.any((option) => option.name == name);
  }

  // Возвращает опцию и её значение по имени или короткой форме
  ({Option option, Object? input}) getOption(String name) {
    var mapEntry = options.entries.firstWhere(
      (entry) => entry.key.name == name || entry.key.abbr == name,
    );
    return (option: mapEntry.key, input: mapEntry.value);
  }
}