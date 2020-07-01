<?php
session_start();


require "engine/php/europa.class.php";
require "engine/php/config.php";
require "engine/php/init.php";
$Db = new Mysqli($mysql_host, $mysql_username, $mysql_password, $mysql_database);

//START login screen code
if (isset($_POST['loginaction'])) {
	switch ($_POST['loginaction']) {
		case 'register':
			require 'engine/php/lib/securimage/securimage.php';
			$securimage = new Securimage();
   			if ($securimage->check($_POST['captcha_code']) == true) {
   				if ($_POST['registerpass'] === $_POST['repeatpass']) {
   					if ($Europa->valUsername($_POST['registeruser'])) {
   						if ($Europa->valPassword($_POST['registerpass'])) {
   								$register = $Europa->registerUser($_POST['registeruser'], $_POST['registerpass'], $_POST['registername'], $_POST['mail']);
   								if ($register[0] != null) $error = $register[0];
   								if ($register[1] != null) $message = $register[1];
   							} else $error = "Wachtwoord te kort.";
   						} else $error = "Ongeldige gebruikersnaam.";
   					} else $error = "Wachtwoord komt niet overeen.";
        		} else $error = "Captcha incorrect.";
			break;
		
		case 'guestlogin':
			$_SESSION['gast'] = "true";
			break;
			
		case 'login':
			$user = new User($Db, $_POST['user']);
			if ($user->auth($_POST['pass'])) {
				$_SESSION['user'] = $user->getProp("username");
				} else {
				$error = "Incorrecte gegevens.";
				}
			break;
		}
	}
//END login screen code

$Europa = new Europa($Db);
if ($Europa->isAuth()) {
	$view = array(
		'menu' => 'mainMenu.php',
		'view' => 'mainView.php'
		);
	$map = "europa";
	}
else {
	$view = array(
		'menu' => 'loginMenu.php',
		'view' => 'loginView.php'
		);
}

require 'view/indexView.php';
?>