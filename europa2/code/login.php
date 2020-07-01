<center>
<div style="height: 100px; width: 300px; margin-top: 10px; margin-left: auto; margin-right: auto;" id="logo">
<div style="height: 100px; width: 300px; position: relative; left: 0px; top: 0px;" id="logocontainer"></div>
<img style="height: 100px; width: 300px; position: relative; left: 0px; top: -100px;" src="media/logo2.png"/>
</div>
<?php
if (isset($err_msg))
    echo '<div id="err">' . $err_msg . '</div>';
?>
<div id="login">
<?php echo $message ?>
<form action="index.php" method="post">
<table id="logintable">
<tr><td colspan="2">Je bent niet ingelogd.<img src="media/info.png" onClick="showHelp()" class="smallicon" style="float: right" /></td></tr>
<tr><td colspan="2">
<input onClick="login()" id="loginform" type="radio" name="action" value="login" checked> Inloggen
<input onClick="guestLogin()" type="radio" name="action" value="guestlogin"> Inloggen als gast
<input onClick="register()" id="registerloginform" type="radio" name="action" value="register"> Registreren
</td></tr>

<!--Login-->
<tr id="username"><td>Gebruikersnaam: </td><td><input id="user" type="text" name="user" onChange="updateHandler()" /></td></tr>
<tr id="password"><td>Wachtwoord: </td><td><input id="pass" type="password" name="pass" onChange="updateHandler()" /></td></tr>
<tr id="session"><td>Sessie: </td><td id="sessie">
<select name="game">
<?php
foreach ($Session->listGames('active') as $id=>$name)
    {
    echo '<option name="game" value="' . $id . '">' . $name . '</option>';
    }
?>
</select>
</td></tr>

<!--Register-->
<tr id="registername"><td>Voornaam: </td><td><input autocomplete="off" id="registername" type="text" name="registername" /></td></tr>
<tr id="registeruser"><td>Gebruikersnaam: </td><td><input autocomplete="off" id="registeruser" type="text" name="registeruser" /></td></tr>
<tr id="registerpass"><td>Wachtwoord: </td><td><input autocomplete="off" id="registerpass" type="password" name="registerpass" /></td></tr>
<tr id="repeatpassword"><td>Herhaal wachtwoord: </td><td><input autocomplete="off" id="repeatpass" type="password" name="repeatpass" /></td></tr>
<tr id="mail"><td>E-mailadres: </td><td><input autocomplete="off" id="mail" type="text" name="mail" /></td></tr>

<tr><td colspan="2"><input type="submit" value="OK!" /></td></tr>
</table>
</form>
</div>
</center>