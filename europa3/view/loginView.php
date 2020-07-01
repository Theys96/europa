<script>
function login() {
	$(".logininput").show();
	$(".registerinput").hide();
	}

function guestLogin() {
	$(".logininput").hide();
	$(".registerinput").hide();
	}

function register() {
	$(".logininput").hide();
	$(".registerinput").show();
	}

$(function() {
	login();
	setTimeout(function () {
		if ($("#err").text() != "" || $("#msg").text()) {
			$("#err").slideUp(1000);
			$("#msg").slideUp(1000);
			}
		}, 3000);
	});
</script>
<center>
<div id="login">
<h1>Europa<sup>3.0</sup></h2>
<div id='err'><?php echo $error; ?></div>
<div id='msg'><?php echo $message; ?></div>
<form method="post">
<table id="logintable" width="50%">
<tr><td colspan="2">
<input onClick="login()" id="loginform" type="radio" name="loginaction" value="login" checked> <label for="loginform">Inloggen</label>
<input onClick="guestLogin()" id="guestloginform" type="radio" name="loginaction" value="guestlogin"> <label for="guestloginform">Inloggen als gast</label>
<input onClick="register()" id="registerloginform" type="radio" name="loginaction" value="register"> <label for="registerloginform">Registreren</label>
</td></tr>

<!--Login-->
<tr class="logininput"><td>Gebruikersnaam: </td><td><input id="user" type="text" name="user" /></td></tr>
<tr class="logininput"><td>Wachtwoord: </td><td><input id="pass" type="password" name="pass" /></td></tr>

<!--Register-->
<tr class="registerinput"><td>Voornaam: </td><td><input autocomplete="off" id="registername" type="text" name="registername" /></td></tr>
<tr class="registerinput"><td>Gebruikersnaam: </td><td><input autocomplete="off" id="registeruser" type="text" name="registeruser" /></td></tr>
<tr class="registerinput"><td>Wachtwoord: </td><td><input autocomplete="off" id="registerpass" type="password" name="registerpass" /></td></tr>
<tr class="registerinput"><td>Herhaal wachtwoord: </td><td><input autocomplete="off" id="repeatpass" type="password" name="repeatpass" /></td></tr>
<tr class="registerinput"><td>E-mailadres: </td><td><input autocomplete="off" id="mail" type="text" name="mail" /></td></tr>
<tr class="registerinput"><td colspan="2" align="center"><img id="captcha" src="engine/php/lib/securimage/securimage_show.php" alt="CAPTCHA Image" /></td></tr>
<tr class="registerinput"><td>Schrijf de bovenstaande afbeelding over: 
</td><td valign="top">
<input type="text" name="captcha_code" size="10" maxlength="6" />
<img src="media/img/refresh.png" style="float: right" class="icon" onclick="document.getElementById('captcha').src = 'engine/php/lib/securimage/securimage_show.php?' + Math.random(); return false" />
</td></tr>

<tr><td colspan="2"><center><input type="submit" value="Login" /></center></td></tr>
</table>
</form>
</div>
</center>