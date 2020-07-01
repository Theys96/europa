<!DOCTYPE html>
<html>
<head>
  <title>Europa - Login</title>
  <link rel="stylesheet" media="all" href="style.css"/>
</head>
<body>
<center>
<div id="login">
<h2>Europa</h2>
<form action="index.php" method="post">
<table id="logintable">
<tr><td colspan="2">Je bent niet ingelogd.</td></tr>
<tr><td>Gebruikersnaam: </td><td><input type="text" name="user" /></td></tr>
<tr><td>Wachtwoord: </td><td><input type="password" name="pass" /></td></tr>
<tr><td>Sessie: </td><td>
<select name="game">
<?php
foreach ($sessie as $id=>$name)
    {
    echo '<option name="game" value="' . $id . '">' . $name . '</option>';
    }
?>
</select> 
</td></tr>
<tr><td colspan="2"><input type="submit" value="OK!" /></td></tr>
<tr><td colspan="2"><i>Inloggen als gast kan met username 'gast'.<br />Een wachtwoord is niet nodig.</i></td></tr>
</table>
</form>
</div>
</center>
</body>
</html>