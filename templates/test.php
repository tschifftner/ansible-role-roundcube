<?php

$hosts = array('127.0.0.1'); //, 'localhost');

foreach($hosts as $host) {
    // Create connection
    $db = new mysqli($host, 'test', 'test', 'th_live');

    // Check connection
    if ($db->connect_error) {
        echo "Connection to $host failed: " . $db->connect_error;
    }

    $befehl = $db->query("SELECT version() AS version");
    $resultat = $befehl->fetch_object();

    echo "Wir arbeiten mit MySQL-Version {$resultat->version}";

    foreach($db->query('SHOW TABLES')->fetch_all() as $table) {
        print_r($table);
    }

    $db->close();
}
