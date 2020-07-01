<div id="header">
<table><tr><td><a href="logout.php"><img src="https://cdn1.iconfinder.com/data/icons/defaulticon/icons/png/256x256/cancel.png" height="20" /></a></td>
<td><a style="text-decoration: underline;" onClick="$('#info').height(500);$('#info').html('<iframe frameborder=0 width=500 height=500 src=chat></iframe>')">Chat</a></td>

<td>Welkom <a href="player.php?pid=<? echo $user['id'] ?>" ><?php echo $user['firstname'] ?></a></td>

<td>
<?php echo $regions ?>
</td>

<td>
<img src="media/coins.png" height="15" />
<span style="color: #000099" title="Saldo"><?php echo $saldo ?></span>
<span style="color: #990000" title="Uitgaven"><?php echo $expense ?></span> 
<span style="color: #009900" title="Inkomsten"><?php echo $profit ?></span>
</td>

<td>
<img src="media/army.PNG" height="15" /><?php echo $army; ?>
</td><td><?php echo $time ?></td>

<td>Handel <a style="text-decoration: underline;" onClick="
var partner = prompt('Handelspartner: ');
$.post('action.php', {type: 'trade',from: '<?php echo $user['username'] ?>',to: partner}).done(function( data ) {
alert(data);
location.reload();
});
"><img src="media/plus.PNG" height="15" /></a> <a style="text-decoration: underline;" onClick="
var partner = prompt('Handelspartner: ');
$.post('action.php', {type: 'stoptrade',from: '<?php echo $user['username'] ?>',to: partner}).done(function( data ) {
alert(data);
location.reload();
});
"><img src="media/min.PNG" height="15" /></a></td>

<td>BG <a style="text-decoration: underline;" onClick="
var partner = prompt('Bondgenoot: ');
$.post('action.php', {type: 'bg',from: '<?php echo $user['username'] ?>',to: partner}).done(function( data ) {
alert(data);
location.reload();
});
"><img src="media/plus.PNG" height="15" /></a> <a style="text-decoration: underline;" onClick="
var partner = prompt('Bondgenoot: ');
$.post('action.php', {type: 'stopbg',from: '<?php echo $user['username'] ?>',to: partner}).done(function( data ) {
alert(data);
location.reload();
});
"><img src="media/min.PNG" height="15" /></a></td>
<td><a href="settings.php"><img src="media/tools.png" height="25" /></a></td>
<td><a href="help.php"><img src="media/info.png" height="25" /></a></td>

</tr></table>
</div>
<?php
echo '<div id="maptype"><table align="right">';
echo '<tr><td>' . ($maptype == 'owner' ? 'Eigenaar' : '<a href="index.php">Eigenaar</a>') . '</td>';
echo '<td>' . ($maptype == 'army' ? 'Legermacht' : '<a href="index.php?modus=army">Legermacht</a>') . '</td>';
echo '<td>' . ($maptype == 'profit' ? 'Opbrengst' : '<a href="index.php?modus=profit">Opbrengst</a>') . '</td>';
echo '<td>' . ($maptype == 'export' ? 'Export' : '<a href="index.php?modus=export">Export</a>') . '</td>';
echo '<td>' . ($maptype == 'trade' ? 'Handel' : '<a href="index.php?modus=trade">Handel</a>') . '</td>';
echo '<td>' . ($maptype == 'blackwhite' ? 'Zwart Wit' : '<a href="index.php?modus=blackwhite">Zwart Wit</a>') . '</td></tr>';
echo '</table></div>';
?>