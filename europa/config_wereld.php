<?php
//MYSQL data

// Enter MySQL credentials:
$mysql_host = '';
$mysql_username = '';
$mysql_password = '';
$mysql_db = '';
$maptable = 'map_wereld';
$playertable = 'players_wereld';
$subtable = 'subs_wereld';

//Mapinfo
if ($_REQUEST['map'] == 'europa')
    {
    $mapname = 'europe_mill_en';
    $focusonx = 0;
    $focusony = 0;
    $focusonscale = 1;
    $zoommax = 8;
    $zoommin = 1;
    }
else
    {
    $mapname = 'world_mill_en';
    $focusonx = 0.5;
    $focusony = 0.48;
    $focusonscale = 1;
    $zoommax = 15;
    $zoommin = 1.7;
    }
?>