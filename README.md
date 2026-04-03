# smirnovkiu_mobile-dev
Вступительный обучающий курс по Dart.

308004e (HEAD -> main, origin/main, origin/HEAD) Полная структура проекта
c60bb01 Создан GetArticleCommand для получения статей из Wikipedia
adac9fd Создан SearchCommand с поддержкой поиска и флага im-feeling-lucky
480d884 Обновлён cli/bin/cli.dart: добавлен логгер и передача в команды
ee6e5d6 Добавлен экспорт логгера и команд в cli.dart
3d6f93e Добавлен логгер с записью в файл
10a3682 Добавлен пакет logging в cli/pubspec.yaml
6b4ef92 Добавлены экспорты API функций и моделей в wikipedia.dart
c2154da Добавлена функция getArticleByTitle для получения полной статьи
99dd4c1 Добавлена функция search для поиска статей в Wikipedia
e93cce6 Добавлены функции getRandomArticleSummary и getArticleSummaryByTitle
d531b4d Добавлена зависимость http в wikipedia/pubspec.yaml
4c0f64a Добавлены тесты для десериализации JSON в модели Summary, Article и SearchResults
176a1a4 Добавлены тестовые данные для моделей Wikipedia (dart_lang_summary, cat_extract, open_search_response)
a6b458d Создан файл model_test.dart с импортами для тестирования моделей Wikipedia
d4fb028 Добавлена зависимость test в wikipedia/pubspec.yaml
437616a Добавлен класс SearchResults для представления результатов поиска Wikipedia
daf66ad Добавлен класс Article для представления статьи из Wikipedia API
4f47bd4 Добавлен класс TitlesSet для парсинга заголовков из JSON Wikipedia API
6d005b6 Добавлен класс Summary для парсинга JSON ответа Wikipedia API
0fe7e31 Добавлен resolution: workspace в wikipedia/pubspec.yaml
b831953 Добавлен resolution: workspace в command_runner/pubspec.yaml
8abcbf7 Добавлен resolution: workspace в cli/pubspec.yaml
fe83c80 Создан корневой pubspec.yaml с workspace для cli, command_runner и wikipedia
fe0888c Добавлен onOutput callback в main для использования write функции
718e8df Добавлен onOutput callback в CommandRunner для гибкой обработки вывода
0377249 Улучшен вывод HelpCommand с детальным описанием опций
c3cf632 Добавлен пример PrettyEcho для цветного вывода в консоль
fe4fe82 Добавлен экспорт console.dart в command_runner
bfadc2d Добавлено расширение TextRenderUtils для цветового форматирования строк
0f7ef07 Добавлена консольная цветовая схема ConsoleColor
b06e261 Добавлен экспорт exceptions.dart в command_runner
7f3e81a Обновленый cli.dart: добавлен onError callback в CommandRunner
c5771d2 Добавлена обработка ошибок в CommandRunner: try/catch, onError callback и валидаця в parse
7338b86 Создан класс ArgumentException для обработки ошибок аргументов
777a160 Обновленый cli.dart: добавлен CommandRunner и HelpCommande
620b79a Создан класс HelpCommand с флагами verbose и command
4007534 Добавлены экспорты arguments, command_runner_base и help_command
206ae89 Обновлена CommandRunner: добавлены импорты, методы addCommand и parse
d28fd44 Добавлены классы Argument, Option, Command и ArgResults для парсина CLI
47fe5c9 Замена логика main на использование CommandRunner
ed420ea Добавлен command_runner как локальная зависимость
be8877f Добавлен класс CommandRunner с методом run
f9850df Создана библиотека command_runner с экспортом
d7dfe05 Измененная команда с search на wikipedia в main
98e75a8 Вызвана getWikipediaArticle и выведены результат в searchWikipedia
81a6a8f Добавлена проверка null и пустой строки в searchWikipedia
6f6545c Добавлен async в searchWikipedia
1b2ce98 Добавлен HTTP-запрос и обработка ответа в getWikipediaArticle
29f9a2f Добавлено построение API URL в getWikipediaArticle
475ed4a Добавлена функцию getWikipediaArticle с асинхронной сигнатурой
7791705 Импортирован http
4a8069f Добавлена зависимость http
c27c666 Добавлена имитация результатов поиска в searchWikipedia
e2fa58c Добавлен запрос заголовка статьи через stdin при отсутствии аргументов
e85779b Вызвана searchWikipedia из main с передачей аргументов
c3a7b15 Добавлена функция searchWikipedia с выводом аргументов
140bb34 Добавлена команда search с заглушкой
b19e0b7 Реализована команда help и обработка неизвестных команд
53adbca Добавлена функция printUsage для отображения справки
669285e Добавлена константа version и обработка аргумента version
f6e5753 Удален неиспользуемый импорт и изменено приветствие
f871679 Изначальный код
db625e8 Initial commit
