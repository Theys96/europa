<?php
session_start();
require 'classes.php';
// MySQL creds:
$mysql  = new Mysqli("","","","") or die("Error " . mysqli_error($mysql));
$startqueries = intval(substr($mysql->stat,40,10));
$Session = new GameSession($mysql);
$Cookie = new Cookie();
$Europa = new EuropaGame($mysql,$Session);
$Map = new Map($mysql,$Session,$Session->GameData(null,'id'));
$Player = $Map->player($Session->username);
if (!isset($Player))
    $Player = new User($Session->username,$mysql);
if ($Player->exists()) :


if (isset($_GET['getinfo'])) :
$code = $_GET['getinfo'];
$region = $Map->region($code);
$owner = $Map->player($region->owner);
$access = ($owner->username == $Session->username);
echo "<h2>" . $region->name . "</h2>\n";
?>
<table width="100%" id="infotable" >
<tr><td>Code: </td><td><?php echo $code ?></td></tr>
<tr><td>Landsnaam: </td><td><?php echo $region->name ?></td></tr>
<tr><td>Eigenaar: </td><td><a onClick="placeUserData(<?php echo $owner->id; ?>)"><?php echo $owner->username; ?></a></td></tr>
<tr><td>Basisopbrengst: </td><td><?php echo $region->worth ?></td></tr>
<tr><td>Export: </td><td><?php echo $region->trade ?>%</td></tr>
<tr><td>Totale handel: </td><td><?php echo $Map->calcTrade($region->id) ?>%</td></tr>
<tr><td>Netto-opbrengst: </td><td><?php echo number_format($Map->calcProfit($region->id),2) ?></td></tr>
<?php
if ($access)
    echo "<tr><td>Legermacht: </td><td>" . number_format($region->army) . "<br />" .  $region->army_diff . " = " . number_format($region->army_new) . "</td></tr>\n";
else
    echo "<tr><td>Legermacht: </td><td>" . number_format($region->army) . "</td></tr>\n";
if ($access)
    echo "<tr><td>Rekrutering: </td><td><center>+" . number_format($region->recruit) . "<img class='smallicon' style='float: left' src='media/min.png' alt='min' onClick=\"recruit(this,'" . $region->id . "')\" /><img class='smallicon' style='float: right' src='media/plus.png' alt='plus' onClick=\"recruit(this,'" . $region->id . "')\" /></center></td></tr>\n";   

echo "<tr><td colspan='2'>Buurlanden: </td></tr><tr><td colspan='2'><table>";

if ($access)
    echo '<tr><td><b>Land</b></td><td><b>Handel</b></td><td><b>Actie</b></td><td><img src="media/att.png" class="icon" /></td><td><img src="media/def.png" class="icon" /></td></tr>';
else
    echo '<tr><td><b>Land</b></td><td><b>Handel</b></td></tr>';
foreach ($region->neigh as $neigh)
    {
    $neigh = $Map->region($neigh);
    $neigh_owner = $Map->player($neigh->owner);
    
    $owned = ($owner->username == $neigh_owner->username);
    $trade = $owner->isTrade($neigh_owner);
    $bg = $owner->isBG($neigh_owner);
    
    echo "<tr>\n";
    //Name
    if ($owned)
        echo "<td><b>" . $neigh->name . "</b></td>\n";
    else
        echo "<td>" . $neigh->name . "</td>\n";
    //Trade
    if ($trade)
        echo "<td>" . number_format($neigh->trade,1) . "%</td>\n";
    else
        echo "<td><del>" . number_format($neigh->trade,1) . "%</del></td>\n";
    if ($access)
        {
        //Actions
        echo "<td>\n";
        if (!$owned)
            echo "<img src='media/att.png' class='icon' onClick=\"attack('" . $region->id . "','" . $neigh->id . "')\" />\n";
        if ($bg or $owned)
            echo "<img src='media/def.png' class='icon' onClick=\"move('" . $region->id . "','" . $neigh->id . "')\" />\n";
        echo "</td>\n";
        //Attacks$Moves
        if ($owned)
            echo "<td>-</td><td>" . intval($region->move[$neigh->id]) . "</td>\n";
        else if (!$bg)
            echo "<td>" . intval($region->attack[$neigh->id]) . "</td><td>-</td>\n";
        else
            echo "<td>" . intval($region->attack[$neigh->id]) . "</td><td>" . intval($region->move[$neigh->id]) . "</td>\n";
        }
    echo "</tr>\n";
    }
echo "</table></td></tr>\n";
endif;


if (isset($_GET['player'])) :
$player = new User(intval($_GET['player']),$mysql,$Session);
$me = new User($Session->username,$mysql,$Session);

$bg = $me->isBG($player);
$trade = $me->isTrade($player);
$is_me = ($player->username == $me->username);

echo "<center><h2>" . $player->screenname . "</h2><table width='100%'>\n";
echo "<tr><td>Gebruikersnaam: </td><td>" . $player->username . "</td></tr>\n";
echo "<tr><td>Rang: </td><td>" . $player->rank . " (" . $player->rating . ")</td></tr>\n";
if ($player->pic != '')
    echo "<tr><td colspan='2'><center><img height='200px' src='" . $player->pic . "' /></center></td></tr>\n";

if ($player->inSession())
    {
    echo "<tr><td>Geld: </td><td>" . $player->money . "</td></tr>\n";
    echo "<tr><td>Kleur: </td><td style='background-color: " . $player->color . "'></td></tr>\n";
    if (!$is_me and $Player->living())
        {
        if (in_array($player->id,$me->trade))
            {
            $accept = in_array($me->id,$player->trade) ? 'In werking' : 'Nog niet geaccepteerd';
            echo "<tr><td>Handel: </td><td>" . $accept . " <img onClick=\"trade('".$me->username."','".$player->id."')\" class='smallicon' style='float: right' src='media/min.png' /></td></tr>\n";
            }
        else
            echo "<tr><td>Handel: </td><td><img onClick=\"trade('".$me->username."','".$player->id."')\" class='smallicon' src='media/plus.png' /></td></tr>\n";
        
        if (in_array($player->id,$me->bg))
            {
            $accept = in_array($me->id,$player->bg) ? 'In werking' : 'Nog niet geaccepteerd';
            echo "<tr><td>Bondgenoot: </td><td>" . $accept . " <img onClick=\"bg('".$me->username."','".$player->id."')\" class='smallicon' style='float: right' src='media/min.png' /></td></tr>\n";
            }
        else
            echo "<tr><td>Bondgenoot: </td><td><img onClick=\"bg('".$me->username."','".$player->id."')\" class='smallicon' src='media/plus.png' /></td></tr>\n";
        }
    echo "</table></center>";
    }
endif;


if (isset($_GET['getmoney'])) :
if ($_GET['getmoney'] == 'true')
    $player = $Player;
else
    $player = $Map->player($_GET['getmoney']);

$money = number_format($player->money,0);
$expense = number_format($player->money - $player->money_new,0);
$income = number_format($Map->calcPlayerProfit($player->username),0);

echo "<span style='color: #009'>$money</span> <span style='color: #900'>$expense</span> <span style='color: #090'>$income</span>";
endif;


if (isset($_GET['subs'])) :
$subtable = new Subtable($mysql,$Session);
echo "<center>\n";
echo "<p>Meld je hier aan voor de volgende sessie. Voor sommige sessies heb je een bepaald puntenaantal nodig.</p>\n";
echo "<p>Vereiste rating: <b>" . $subtable->required() . "</b></p>";
echo "<table>\n";
foreach ($subtable->sublist() as $sub)
    {
    if ($sub['type'] == 'sub')
        echo "<tr><td>" . $sub['user']->username . "</td>\n";
    else
        echo "<tr><td><i>" . $sub['user']->username . "</i></td>\n";
    if ($sub['user']->username == $Player->username)
        {
        echo "<td><img onClick='delSub(\"" . $Player->username . "\")' src='media/min.png' class='smallicon' /></td>";
        $inlist = true;
        }
    else
        echo "<td></td>";
    echo "</tr>";
    }
if (!$inlist)
    echo "<tr><td></td><td><img onClick='addSub(\"" . $Player->username . "\")' src='media/plus.png' class='smallicon' /></td>";
echo "<table/>\n";
echo "</center>\n";
endif;


if (isset($_GET['addsub'])) :
$subtable = new Subtable($mysql,$Session);
$subtable->addSub($_GET['addsub'],'sub');
endif;


if (isset($_GET['invitesub'])) :
$subtable = new Subtable($mysql,$Session);
$subtable->addSub($_GET['invitesub'],'intro');
endif;


if (isset($_GET['delsub'])) :
$subtable = new Subtable($mysql,$Session);
$subtable->removeSub($_GET['delsub']);
endif;


if (isset($_GET['settings'])) :
$playertable = $Session->GameData(null,'playertable');

?>
<center>
<span style="color: red"><?php echo $error ?></span>
<form method="post" id="settingsform">
<input type="hidden" name="settings" value="submit" />
<h2>Instellingen</h2>
<table width="100%">
<tr><td>Voornaam: </td><td><input maxlength="50" type="text" name="firstname" value="<?php echo $Player->firstname ?>" /></td></tr>
<tr><td>Achternaam: </td><td><input maxlength="50" type="text" name="lastname" value="<?php echo $Player->lastname ?>" /></td></tr>
<tr><td>E-mailadres: </td><td><input maxlength="50" type="text" name="mail" value="<?php echo $Player->mail ?>" /></td></tr>
<tr><td>Profielplaatje (URL): </td><td><input type="text" name="pic" value="<?php echo $Player->pic ?>" /></td></tr>
<tr><td>Schermnaam: </td><td>
Rang:<br>
<span class="tab"><input type="radio" name="showtitle" value="true" <?php if ($Player->settings['showtitle'] == 'true') echo 'checked'; ?>>Ja 
<input type="radio" name="showtitle" value="false" <?php if ($Player->settings['showtitle'] == 'false') echo 'checked'; ?>>Nee</span><br />
Titel:<br>
<span class="tab"><input type="radio" name="showspectitle" value="true" <?php if ($Player->settings['showspectitle'] == 'true') echo 'checked'; ?>>Ja 
<input type="radio" name="showspectitle" value="false" <?php if ($Player->settings['showspectitle'] == 'false') echo 'checked'; ?>>Nee</span><br />
Achtertitel:<br>
<span class="tab"><input type="radio" name="showsuftitle" value="true" <?php if ($Player->settings['showsuftitle'] == 'true') echo 'checked'; ?>>Ja 
<input type="radio" name="showsuftitle" value="false" <?php if ($Player->settings['showsuftitle'] == 'false') echo 'checked'; ?>>Nee</span><br />
</td></tr>
<tr><td>Eigen kleur in chat: </td><td>
<input type="radio" name="chatcolor" value="true" <?php if ($Player->settings['chatcolor'] == 'true') echo 'checked'; ?>>Ja <br />
<input type="radio" name="chatcolor" value="false" <?php if ($Player->settings['chatcolor'] == 'false') echo 'checked'; ?>>Nee 
</td></tr>
<tr><td>Verander wachtwoord: </td><td><input maxlength="50" type="password" name="password" autocomplete="off" /></td></tr>
<tr><td>Bevestig wachtwoord: </td><td><input maxlength="50" type="password" name="passwordcheck" autocomplete="off" /></td></tr>
<?php if ($Player->inSession()) : ?>
<tr><td>Kleur: </td>
<td>
<select name="color">
<?php
$colors = $Session->listColors();
foreach ($colors as $color=>$available)
    {
    $selected = ($color == $Player->color) ? ' selected="selected"' : '';
    $disabled = ($available) ? '' : 'disabled';
    echo '<option name="color"' . $selected . ' value="' . $color . '" style="background-color: ' . $color . '" ' . $disabled . '>' . $color . '</option>';
    }
?>
</select>
</td></tr>
<?php endif; ?>
<tr><td colspan="2"><button type="button" onclick="submitSettings()">Click Me!</button></td></tr>
</table>
</form>
</center>
<?php
endif;


if (isset($_POST['actiontype'])) :
switch($_POST['actiontype']) {
case 'move':
    $Map->move($_POST['from'],$_POST['to'],$_POST['q']);
break;
case 'attack':
    $Map->attack($_POST['from'],$_POST['to'],$_POST['q']);
break;
case 'recruit':
    $Map->recruit($_POST['region'],$_POST['q']);
break;
case 'bg':
    $Map->bg($_POST['player'],$_POST['bg']);
break;
case 'trade':
    $Map->trade($_POST['player'],$_POST['trade']);
break;
}
endif;

endif;
?>


