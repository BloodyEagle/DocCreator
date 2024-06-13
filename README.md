<h1>Движок шаблонов xlsx. Читает шаблон из базы</h1>

Структура базы:

<pre>CREATE TABLE `uts_doctemplates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `replacetype` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cell` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `search` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `replace` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;
</pre>