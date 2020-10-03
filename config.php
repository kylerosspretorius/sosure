<?php
/**
 * Created by PhpStorm.
 * User: Ross
 * Date: 2020/10/03
 * Time: 14:00
 */

define('USER', 'root');
define('PASSWORD', '');
define('HOST', 'localhost');
define('DATABASE', 'sosure');

try {
    $connection = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
} catch (PDOException $e) {
    exit("Error: " . $e->getMessage());
}
?>