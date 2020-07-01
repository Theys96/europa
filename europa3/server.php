<?php
session_start();
require "engine/php/europa.class.php";

require "engine/php/config.php";
require "engine/php/init.php";

$Europa->setMap($_REQUEST['map']);

if (isset($_GET['action'])) :
switch ($_GET['action']) {
	case 'getRegions':
		header('Content-Type: application/json');
		echo json_encode($Europa->regions->getRegions());
	break;
	
	case 'getMapColors':
		echo json_encode(array('scale' => $Europa->getPlayers(), 'values' => $Europa->regions->getOwners(), 'attribute' => 'fill'));
	break;
	
	case 'getPlayer':
		if (isset($_GET['player'])) {
			$player = new Player($Db, $_GET['player'], $Europa->getMapInfo('id'));
			echo json_encode($player->getInfo(false));
			}
		else {
			$player = new Player($Db, $Europa->user->getProp('username'), $Europa->getMapInfo('id'));
			echo json_encode($player->getInfo(true));
			}
	break;
	
	case 'getNeighbors':
		$region = $Europa->regions->getRegion($_GET['region']);
		echo json_encode($region->getNeighbors());
		break;
	
	case 'getAttackOptions':
		$region = $Europa->regions->getRegion($_GET['region']);
		echo json_encode($region->getAttackOptions($Europa->user->getProp('id')));
		break;
	
	case 'getAidOptions':
		$region = $Europa->regions->getRegion($_GET['region']);
		echo json_encode($region->getAidOptions($Europa->user->getProp('id')));
		break;
	
	case 'logout':
		session_destroy();
		break;
	
	case 'getUsername':
		echo $Europa->user->getProp("username");
		break;
	
	case 'getMapInfo':
		echo json_encode($Europa->getMapInfo());
		break;
	}
endif;
if (isset($_POST['action'])) :
switch ($_POST['action']) {
	case 'updateSettings':
		$player = new Player($Db, $Europa->user->getProp('username'), $Europa->getMapInfo('id'));
		$player->updateProps($_POST['name'], $_POST['img'], $_POST['color'], $_POST['mail']);
		break;
	}
endif;
?>