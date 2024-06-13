<?php
declare(strict_types = 1);

namespace OnlineRecord;
use OnlineRecord;
use Pixie\Connection;
use Pixie\QueryBuilder\QueryBuilderHandler;

const config = array( //конфиг БД
            'driver'    => 'mysql',
            'host'      => 'localhost',
            'database'  => 'dev',
            'username'  => 'dev',
            'password'  => 'Gfhjkz!',
            'charset'   => 'utf8',
            'collation' => 'utf8_general_ci',
            'prefix'    => 'uts_'
        );

new \Pixie\Connection('mysql', config, 'QB');

if ( isset($_SERVER['HTTP_X_REQUESTED_WITH'])// Проверяем пришел запрос Ajax или нет
     && !empty($_SERVER['HTTP_X_REQUESTED_WITH']) 
     && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
    define('AJAX', true);
} else {
    define('AJAX', false);
}
