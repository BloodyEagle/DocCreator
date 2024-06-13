/*
 Navicat Premium Data Transfer

 Source Server         : dev на sites
 Source Server Type    : MySQL
 Source Server Version : 101106
 Source Host           : localhost:3306
 Source Schema         : dev

 Target Server Type    : MySQL
 Target Server Version : 101106
 File Encoding         : 65001

 Date: 13/06/2024 15:18:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for uts_doctemplates
-- ----------------------------
DROP TABLE IF EXISTS `uts_doctemplates`;
CREATE TABLE `uts_doctemplates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL COMMENT 'тип документа 1-заявление, 2-приказ о зачислении, 3-приказ об отчислении, 4-приказ об окончании курса',
  `replacetype` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Тип замены: \r\ntext - простая замена, \r\nfield- поле из запроса, \r\njson - замена по условию',
  `cell` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Адрес ячейки',
  `search` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'искомый шаблон {%X%}. Если NULL то заменяем всю ячейку',
  `replace` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '[текст | имя_поля | имя_поля {значение1: \'замена1\', значение2:\'замена2\' ...}] для замены шаблона.',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Если `search` пустой (NULL), то заменяем всю ячейку, иначе ищем текст в ячейке \r\n--------------------\r\nreplacetype - тип замены: \r\n\r\nsize - размер поля шаблона в xlsx файле.  В поле `cell` указывается область для клонирования по числу слушателей (строки данных). В полях `search` и `replace` ширина и высота в ячейках для листа отчета\r\n\r\ntext - простая замена. В ячейке `cell` ищем  `search` и заменяем его на `replace`\r\n\r\nfield- поле из запроса. Ячейку `cell` заменяем на поле из запроса, имя которого передается в `search`\r\n \r\njson - замена по условию. Имя поля передается в `replace` в виде \r\n          имя_поля { \"значение1\": \"замена1\", \"значение2\": \"замена2\"... }\r\n           в ячейке `cell` ищется `search` (если NULL, то заменяется вся ячейка) и заменяется на \"заменаN\" если значение \"имя_поля\" из базы совпадает с \"значениеN\"\r\n	например:\r\n	    `search` = {%A%}	\r\n	   `replace` = sex { \"1\": \"Муж\", \"2\": \"Жен\" }\r\n	Если поле sex из базы пришло со значением 1, то искомое значение заменится на \"Муж\"' ROW_FORMAT = COMPACT;

SET FOREIGN_KEY_CHECKS = 1;
