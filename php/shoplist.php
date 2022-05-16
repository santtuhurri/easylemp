<?php
// public_html/index.php - Read MySQL from PHP
// (c) 2016 Tero Karvinen http://TeroKarvinen.com
// MySQL Login
$user='shoplist';
$password='USERshopl157forDEBIAN22';
// Data Source Name i.e. connection details
$database=$user;
$dsn="mysql:host=localhost;charset=UTF8;dbname=$database";
// Open Connection, create new object of PDO class
$pdo=new PDO($dsn, $user, $password);
// Perform SQL Query
$pdoStatement=$pdo->prepare('SELECT * FROM items;');
$pdoStatement->execute();
$hits=$pdoStatement->fetchAll();
// Print the $hits Array
foreach($hits as $row) {
 echo "<p>".$row['id']." ".$row['name']."</p>\n";
}
?>
