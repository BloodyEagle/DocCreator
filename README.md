<h1>Движок шаблонов xlsx. Читает шаблон из базы</h1>
<p>Нужно переработать в универсальную...</p>
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

<p>type - тип шаблона. По сути - номер шаблона. Все ячейки с одинаковым типом принадлежат одному шаблону.</p>
<p>replacetype - тип замены: 
<ul>
<li>size - размер поля шаблона в xlsx файле.  В поле `cell` указывается область для клонирования по числу строк данных. В полях `search` и `replace` ширина и высота в ячейках для листа отчета</li>
<li>text - простая замена. В ячейке `cell` ищем  `search` и заменяем его на `replace`</li>
<li>field- поле из запроса. Ячейку `cell` заменяем на поле из запроса, имя которого передается в `search`</li>
<li>json - замена по условию. Имя поля передается в `replace` в виде<br> 
          &nbsp;&nbsp;&nbsp;имя_поля { "значение1": "замена1", "значение2": "замена2"... }<br>
          &nbsp;&nbsp;&nbsp;в ячейке `cell` ищется `search` (если NULL, то заменяется вся ячейка) и заменяется на "заменаN" если значение "имя_поля" из базы совпадает с "значениеN"<br>
	например:<br>
	    &nbsp;&nbsp;&nbsp;`search` = {%A%}	<br>
	    &nbsp;&nbsp;&nbsp;`replace` = sex { "1": "Муж", "2": "Жен" }<br>
	Если поле sex из базы пришло со значением 1, то искомое значение заменится на "Муж"</li>
<ul>
Если `search` пустой (NULL), то заменяем всю ячейку, иначе ищем текст в ячейке </p>

