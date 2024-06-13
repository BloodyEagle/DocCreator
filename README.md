Движок шаблонов xlsx. Читает шаблон из базы

Структура базы:

`code
CREATE TABLE `uts_doctemplates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL COMMENT 'тип документа 1-заявление, 2-приказ о зачислении, 3-приказ об отчислении, 4-приказ об окончании курса',
  `replacetype` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Тип замены: \r\ntext - простая замена, \r\nfield- поле из запроса, \r\njson - замена по условию',
  `cell` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Адрес ячейки',
  `search` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'искомый шаблон {%X%}. Если NULL то заменяем всю ячейку',
  `replace` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '[текст | имя_поля | имя_поля {значение1: \'замена1\', значение2:\'замена2\' ...}] для замены шаблона.',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci
