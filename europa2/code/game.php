<?php
$army = 0;
foreach($Player->regions as $region){$army += $Map->region($region)->army;}
?>
<div id="header" style="border: 1px solid black">
    <table>
        <tr>
            <td><a href="?action=logout"><img class="icon" src="./media/cancel.png" /></a></td>
            <td>Welkom <a onClick='placeUserData(<?php echo $Player->id ?>)'><?php echo $Player->username ?></a></td>
            <td>
            <form method="post">
                <input name="switch" value="true" type="hidden" />
                <select onchange="this.form.submit()" name="game">
                <?php
                foreach($Session->listGames('active') as $gameid=>$gamename)
                    {
                    $selected = '';
                    if ($gameid == $Session->gameid)
                        $selected = ' selected';
                    echo "<option value='" . $gameid . "'" . $selected . ">" . $gamename . "</option>";
                    }
                ?>
                </select>
            </form>
            </td>
            <?php if($Player->inSession()) : ?>
            <td><?php echo count($Player->regions); ?></td>
            <td style="min-width: 100px;"><img src="media/coins.png" class="tinyicon" /> <span id="money"></span></td>
            <td><img src="media/army.png" class="tinyicon" /> <?php echo number_format($army) ?></td>
            <?php endif; ?>
            <td style="width: 100px; text-align: center" id="countdown"></td>
            <td><img onClick="placeSettings()" src="media/tools.png" class="icon" /></td>
            <td><img onClick="placeSubs()" src="media/in.png" class="icon" /></td>
            <td><img onClick="showHelp()" src="media/info.png" class="icon" /></td>
        </tr>
    </table>
</div>

<?php
$maptype = $_GET['modus'];
echo '<div id="maptype"><table align="right">';
echo '<tr><td>' . ($maptype == 'owner' ? 'Eigenaar' : '<a href="?modus=owner">Eigenaar</a>') . '</td>' . "\n";
echo '<td>' . ($maptype == 'army' ? 'Legermacht' : '<a href="?modus=army">Legermacht</a>') . '</td>' . "\n";
echo '<td>' . ($maptype == 'profit' ? 'Opbrengst' : '<a href="?modus=profit">Opbrengst</a>') . '</td>' . "\n";
echo '<td>' . ($maptype == 'export' ? 'Export' : '<a href="?modus=export">Export</a>') . '</td>' . "\n";
echo '<td>' . ($maptype == 'trade' ? 'Handel' : '<a href="?modus=trade">Handel</a>') . '</td>' . "\n";
echo '<td>' . ($maptype == 'blackwhite' ? 'Zwart Wit' : '<a href="?modus=blackwhite">Zwart Wit</a>') . '</td></tr>' . "\n";
echo '</table></div>';
?>

<table width="100%"><tr><td class="notable">
<div id="info"></div></td><td class="notable">
<div id="map1"></div></td></tr>
</table>
<div id="players">
<table width="100%" class="sortable">
<tr><td><b>Naam</b></td><td><b>Landen</b></td><td><b>Inkomsten</b></td><td><b>Legermacht</b></td><td><b>Geld</b></td></tr>

<?php
foreach($Session->listPlayers() as $player)
    {
    if ($player->exists())
        {
        if (count($player->regions) > 0)
            {
            echo "<tr style='background-color: " . $player->color . "'>";
            echo "<td><a onClick='placeUserData(" . $player->id . ")'>" . $player->screenname . "</a></td>";
            echo "<td>" . count($player->regions) . "</td>";
            echo "<td>" . number_format($Map->calcPlayerProfit($player->username)) . "</td>";
            echo "<td>" . number_format($Map->calcPlayerArmy($player->username)) . "</td>";
            echo "<td>" . number_format($player->money) . "</td>";
            echo "</tr>\n";
            }
        }
    }
?>

</table>
</div>
<div id="messages">

<h2>Laatste nieuws</h2>
<?php
$process = $Map->latestProcess();
if (strlen(trim($process)) == 0)
    echo "<p><i>Er is niets gebeurd.</i></p>\n";
else
    echo $process;
?>

</div>
