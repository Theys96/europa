<?php
session_start();
include 'config_' . $_SESSION['game'] . '.php';
include 'functions.php';

$code = $_REQUEST['code'];

$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

$region = getRegion($code);
$trade = $region['trade']/100+1;
$owner = getPlayer($region['owner']);

$access = ($_SESSION[$maptable]['username'] == $owner['username']);

$moves = explode(',',$region['move']);
foreach ($moves as $move)
    {
    $move = explode(':',$move);
    $moves[$move[0]] = $move[1];
    }
$attacks = explode(',',$region['attack']);
foreach ($attacks as $attack)
    {
    $attack = explode(':',$attack);
    $attacks[$attack[0]] = $attack[1];
    }
?>
<table width="100%" id="infotable" >
<tr><td>Code:</td><td><?php echo $code ?></td></tr>
<tr><td>Landsnaam:</td><td><?php echo $region['name'] ?></td></tr>
<tr><td>Eigenaar:</td><td><a href="player.php?pid=<?php echo $owner['id'] ?>"><?php echo getScreenName($owner['username']) ?></a></td></tr>
<?php
echo '<tr><td colspan="2">Buurlanden:</td></tr><tr><td colspan="2">';
if ($region['neigh'] != '')
    {
    echo '<table><tr><td>Naam</td><td>Handel</td>' . ($access ? '<td>Actie</td><td><img src="media/att.png" height="20"/></td><td><img src="media/def.png" height="20"/></td>' : '') . '</tr>';
    
    foreach (explode(',',$region['neigh']) as $neigh)
        {
        $neigh = getRegion($neigh);
        echo '<tr><td>';
        if ($neigh['owner'] == $region['owner'])
            echo '<b>';
        echo $neigh['name'];
        if ($neigh['owner'] == $region['owner'])
            echo '</b>';
        echo '</td><td>';
        if ($neigh['trade'] != '')
            {
            if (checkTrade($region['owner'],$neigh['owner']))
                {
                echo $neigh['trade'] . '%';
                $trade *= $neigh['trade']/100+1;
                }
            else
                echo '<del>' . $neigh['trade'] . '%' . '</del>';
            }
        else
            echo '-';
        if ($access)
            {
            echo '</td><td>';
            if ($neigh['owner'] != '')
                {
                if ($neigh['owner'] != $region['owner'])
                    {
                    echo '<img src="media/att.png" onClick="attack(this,region)" alt="' . $neigh['id'] . '" height="20"/>';
                    }
                if (checkBG($neigh['owner'],$region['owner']))
                    {
                    echo '<img src="media/def.png" onClick="move(this,region)" alt="' . $neigh['id'] . '" height="20"/>';
                    }
                echo '</td><td>' . intval($attacks[$neigh['id']]) . '</td><td>' . intval($moves[$neigh['id']]) . '</td></tr>';
                }
            else
                echo '-</td><td>-</td></tr>';
            }
        }
    echo '</table>';
    }
/*
echo '<table>';
$allneigh = array_diff(getAllNeigh($code),explode(',',$region['neigh']));
foreach($allneigh as $neigh)
	{
	$neigh = getRegion($neigh);
	echo '<tr><td>' . $neigh['name'] . '</td></tr>';
	}
echo '</table>';
*/

echo '</td></tr>';
$trade -= 1;
$trade *= 100;
$trade = round($trade,2);
?>
<tr><td>Legermacht:</td><td><?php echo $region['army'] ?><br /><?php echo ($access ? formatNum($region['army_new'] - $region['army']) : '' ) ?></td></tr>
<tr><td>Rekrutering: </td><td><center><?php echo ($access ? $region['recruit'] . '<img style="float: right;" src="media/plus.PNG" height="15px" alt="plus" onClick="recruit(this,region)" /><img style="float: left;" src="media/min.PNG" height="15px" alt="min" onClick="recruit(this,region)" />' : '?'); ?></center></td></tr>
<tr><td>Basisopbrengst:</td><td><?php echo $region['worth'] ?></td></tr>
<tr><td>Export:</td><td><?php echo $region['trade'] ?>%</td></tr>
<tr><td>Totale handel:</td><td><?php echo $trade ?>%</td></tr>
<tr><td>Netto-opbrengst:</td><td><?php echo round((1+($trade/100))*$region['worth'],2) ?></td></tr>
<tr><td colspan="2"><p class="normaltext">
<!--<center><img src="<?php echo $region['pic']; ?>" class="regionpic" /></center>-->
<?php
echo nl2br(htmlentities(file_get_contents('files/' . $code . '.txt')));
?>
</p></td></tr>
</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script>
var region = '<?php echo $code ?>';

function move(object,region)
    {
    q = prompt("Hoeveelheid: ");
    $.post('action.php', {type: 'move',from: region, to: object.alt, q: q}).done(function( data ) {
alert( data );
$('#info').html('');
});
    }
    
function attack(object,region)
    {
    q = prompt("Hoeveelheid: ");
    $.post('action.php', {type: 'attack',from: region, to: object.alt, q: q}).done(function( data ) {
alert( data );
$('#info').html('');
});
    }

function recruit(object,region)
	{
	q = prompt("Hoeveelheid: ");
	if (object.alt == 'min')
		{q = -q;}
	$.post('action.php', {type: 'recruit',region: region,q: q}).done(function( data ) {
alert( data );
window.location = '';
});
	}
</script>












