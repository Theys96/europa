<?php
session_start();
include '../config_' . $_SESSION['game'] . '.php';

function loginForm(){
	echo'
	<div id="loginform">

<form method="post" action="log.php">
<table id="login">
<tr>
<td width="100px">Username </td><td><input class="form" type="text" name="username" /></td>
</tr>
<tr>
<td>Password </td><td><input class="form" type="password" name="password" /></td>
</tr>
<tr>
<td colspan="2">
<input class="confirm" type="submit" value="Log in" />
</td>
</tr>
</table>
</form>

	</div>
	';
}

if(isset($_POST['enter'])){
	if($_POST['name'] != ""){
		$_SESSION[$maptable]['username'] = stripslashes(htmlspecialchars($_POST['name']));
	}
	else{
		echo '<span class="error">Please type in a name</span>';
	}
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Chat</title>
<link type="text/css" rel="stylesheet" href="style.css" />
</head>

<?php
if(!isset($_SESSION[$maptable]['username'])){
	loginForm();
}
else {
?>
<div id="wrapper">
	<div id="menu">
		<p class="welcome"><b>Welkom</b></p>
		<div style="clear:both"></div>
	</div>
	<div id="chatbox">
    </div> 
	<form name="message" action="">
		<input name="usermsg" type="textarea" id="usermsg" autocomplete="off"/>
		<input name="submitmsg" type="submit" id="submitmsg" value="Send" />
	</form>
</div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script type="text/javascript">
// jQuery Document
    //Load the file containing the chat log  
    function loadLog(){       
        $.ajax({  
            url: "log.html",  
            cache: false,  
            success: function(html){          
                $("#chatbox").html(html); //Insert chat log into the #chatbox div             
            },  
        });  
    }
$(document).ready(function(){

$("#submitmsg").click(function(){   
    var clientmsg = $("#usermsg").val();  
    $.post("post.php", {text: clientmsg});                
    $("#usermsg").attr("value", "");  
    return false;  
});
setInterval (loadLog, 2000);

});

document.getElementById('usermsg').focus();
document.getElementById('usermsg').select();

</script>
<?php  
}
?>  
</body>
</html>