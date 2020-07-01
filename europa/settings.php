<?php
session_start();
include 'functions.php';
include 'sessions.php';
include 'config_' . $_SESSION['game'] . '.php';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

if (isset($_SESSION[$maptable]['username'])) :

if ($_POST['change'] == 'true')
    {
    $username = $_SESSION[$maptable]['username'];
    $player = getPlayer($username);
    $firstname = substr($_POST['firstname'],0,50);
    $lastname = substr($_POST['lastname'],0,50);
    if (preg_match('/^[^\W][a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*\@[a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*\.[a-zA-Z]{2,4}$/',substr($_POST['mail'],0,50)) and ($_POST['mail'] != ''))
        $mail = substr($_POST['mail'],0,50);
    else
        {
        $mail = $player['mail'];
        echo '<p>Geef een geldig e-mailadres op.</p>';
        }
    if (isset($_POST['color']))
        $color = $_POST['color'];
    else
        $color = $player['color'];
    
    $settings[] = 'showtitle:' . $_POST['showtitle'];
    $settings[] = 'showspectitle:' . $_POST['showspectitle'];
    $settings[] = 'showsuftitle:' . $_POST['showsuftitle'];
    $settings[] = 'chatcolor:' . $_POST['chatcolor'];
    $settings = implode(',',$settings);
    
    $image = getimagesize($_POST['pic']);

    if ($image['mime'] == 'image/png' or $image['mime'] == 'image/jpg' or $image['mime'] = 'image/jpeg')
        {
        if ($image[0]/$image[1] < 2)
            {
            if ($image[1] <= 1000)
                {
                $imageurl = $_POST['pic'];
                mysqli_query($con,"UPDATE players SET pic='$imageurl' WHERE username='$username'");
                }
            else
                {
                $error .= 'Afbeelding mag maximaal 1000 pixels hoog zijn.<br />';
                }
            }
        else
            {
            $error .= 'Afbeeldingsresolutie mag maximaal 2:1 zijn.<br />';
            }
        }
    else
        {
        $error .= 'Alleen jpg en png afbeeldingen kunnen als profielafbeelding woorden toegevoegd.<br />';
        }
    
    mysqli_query($con,"UPDATE $playertable,players SET firstname='$firstname',lastname='$lastname',settings='$settings',color='$color',mail='$mail' WHERE players.id=$playertable.id AND players.username='$username'");
    
    $_SESSION[$maptable]['displayname'] = getScreenName($username);
    if ($_POST['chatcolor'] == 'true')
        $_SESSION[$maptable]['chatcolor'] = $color;
    else
        $_SESSION[$maptable]['chatcolor'] = 'black';
        
    if ($_POST['password'] != '')
        {
        if ($_POST['password'] === $_POST['passwordcheck'])
            {
            $newpass = $_POST['password'];
            mysqli_query($con,"UPDATE $playertable SET password='$newpass' WHERE username='$username'");
            $error .= 'Wachtwoord veranderd!<br />';
            }
        else
            $error .= 'Wachtwoord komt niet overeen met "bevestig wachtwoord".<br />';
        }
    }

$profile = getPlayer($_SESSION[$maptable]['username']);
if ($profile['username'] != 'gast') :
?>
<!DOCTYPE html>
<html>
<head>
  <title><?php echo $sessie[$_SESSION['game']]; ?> - Settings</title>
  <link rel="stylesheet" media="all" href="style.css"/>
</head>
<body>
<center>
<a href="index.php">Terug</a><br />
<span style="color: red"><?php echo $error ?></span>
<form method="post"><input type="hidden" name="change" value="true" />
<table>
<tr><td colspan="2">Instellingen</td></tr>
<tr><td>Voornaam: </td><td><input maxlength="50" type="text" name="firstname" value="<?php echo $profile['firstname'] ?>" /></td></tr>
<tr><td>Achternaam: </td><td><input maxlength="50" type="text" name="lastname" value="<?php echo $profile['lastname'] ?>" /></td></tr>
<tr><td>E-mailadres: </td><td><input maxlength="50" type="text" name="mail" value="<?php echo $profile['mail'] ?>" /></td></tr>
<tr><td>Profielplaatje (URL): </td><td><input type="text" name="pic" value="<?php echo $profile['pic'] ?>" /></td></tr>
<tr><td>Schermnaam: </td><td>
Rang:
<input type="radio" name="showtitle" value="true" <?php if ($profile['settings']['showtitle'] == 'true') echo 'checked'; ?>>Ja 
<input type="radio" name="showtitle" value="false" <?php if ($profile['settings']['showtitle'] == 'false') echo 'checked'; ?>>Nee 
<br />
Titel:
<input type="radio" name="showspectitle" value="true" <?php if ($profile['settings']['showspectitle'] == 'true') echo 'checked'; ?>>Ja 
<input type="radio" name="showspectitle" value="false" <?php if ($profile['settings']['showspectitle'] == 'false') echo 'checked'; ?>>Nee 
<br />
Achtertitel:
<input type="radio" name="showsuftitle" value="true" <?php if ($profile['settings']['showsuftitle'] == 'true') echo 'checked'; ?>>Ja 
<input type="radio" name="showsuftitle" value="false" <?php if ($profile['settings']['showsuftitle'] == 'false') echo 'checked'; ?>>Nee 
</td></tr>
<tr><td>Eigen kleur in chat: </td><td>
<input type="radio" name="chatcolor" value="true" <?php if ($profile['settings']['chatcolor'] == 'true') echo 'checked'; ?>>Ja <br />
<input type="radio" name="chatcolor" value="false" <?php if ($profile['settings']['chatcolor'] == 'false') echo 'checked'; ?>>Nee 
</td></tr>
<?php
if (inSession($_SESSION[$maptable]['username'])) :
?>
<tr><td>Kleur: </td>
<td><?php
$values = array('00','33','66','99','cc','ff');
$restrictedcolors = array('#ffffff','#000000');
echo '<select name="color">';
for ($r=0;$r<6;$r++)
    {
    for ($g=0;$g<6;$g++)
        {
        for ($b=0;$b<6;$b++)
            {
            $color = '#' . $values[$r] . $values[$g] . $values[$b];
            if (!in_array($color,$restrictedcolors))
                {
                $res = mysqli_query($con,"SELECT * FROM $playertable WHERE color='$color'");
            
                if (mysqli_num_rows($res) > 0)
                    $disabled = ' disabled';
                else
                    $disabled = '';
            
                if ($color == $profile['color'])
                    $selected = 'selected="selected" ';
                else
                    $selected = '';
            
                echo '<option name="color" ' . $selected . 'value="' . $color . '" style="background-color: ' . $color . '"' . $disabled . '>' . $color . '</option>';
                }
            }
        }
    }
echo '</select>';
?></td></tr>
<?php endif; ?>
<tr><td>Verander wachtwoord: </td><td><input maxlength="50" type="password" name="password" autocomplete="off" /></td></tr>
<tr><td>Bevestig wachtwoord: </td><td><input maxlength="50" type="password" name="passwordcheck" autocomplete="off" /></td></tr>
<tr><td colspan="2"><input type="submit" value="bijwerken" /></td></tr>
</table>
</form>
</center>
</body>
</html>

<?php
endif;
if ($profile['username'] == 'gast') :
?>
<!DOCTYPE html>
<html>
<head>
  <title>Europa - Settings</title>
  <link rel="stylesheet" media="all" href="style.css"/>
</head>
<body>
<center>
<p>Als gast kun je geen settings aanpassen.</p>
<p><a href="index.php">Terug</a></p>
</center>
</body>
</html>
<?php
endif;
endif;
?>