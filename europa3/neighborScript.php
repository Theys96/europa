<?php
require 'engine/php/europa.class.php';

require 'engine/php/config.php';
require 'engine/php/init.php';

$query = $Db->query("SELECT * FROM eu2.map_europa");

$relations = array();
while ($row = $query->fetch_assoc()) {
	foreach (explode(",", $row['neigh']) as $neigh) {
		if ($neigh != '') {
			if (!in_array($neigh . "," . $row['id'], $relations)) {
				$relations[] = $row['id'] . "," . $neigh;
				}
			}
		}
	}

foreach ($relations as $rel) {
	$r = explode(",", $rel);
	
	$id1 = $Db->query("SELECT id FROM regions WHERE map=1 AND code='" . $r[0] . "'");
	$id1 = $Db->query("SELECT id FROM regions WHERE map=1 AND code='" . $r[0] . "'");
	
	echo("INSERT INTO region_neighbors (region1, region2) VALUES ((SELECT id FROM regions WHERE map=1 AND code='" . $r[0] . "'), (SELECT id FROM regions WHERE map=1 AND code='" . $r[1] . "'));");
	echo "\n";
	}
?>