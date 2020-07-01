<?
session_start();
include '../sessions.php';
include '../config_' . $_SESSION['game'] . '.php';
if(isset($_SESSION[$maptable]['username'])){
    
    if ($_SESSION[$maptable]['username'] == 'god')
        $style = 'color: red; font-weight: bold;';
    if ($_SESSION[$maptable]['username'] == 'bandos')
        $style = 'color: #c26300; font-weight: bold;';
    
	$text = preg_replace('~(?:http://)[^ ]+~', '<a target="_blank" href="$0">$0</a>', stripslashes(htmlspecialchars($_POST['text'])));
	$new = "<span style='" . $style . "'>(".date("G:i:s").", " . $sessie[$_SESSION['game']] . ") <a target='_top' href='../player.php?pid=".$_SESSION[$maptable]['id']."'><span style='color: " . $_SESSION[$maptable]['chatcolor'] . "'><u>".$_SESSION[$maptable]['displayname']."</u></span></a>: ".$text."</span><br>
";
	$new .= file_get_contents('log.html');
	file_put_contents('log.html', $new);
}
?>
