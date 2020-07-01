<?php
if ($Europa->mapSet()) :
?>
<!-- Map -->
<script src='maps/<?php echo $Europa->getMapInfo("mapFile"); ?>.js'></script>

<!-- Engine -->
<script>
$(function(){
	Europa.initMap('#map-display', '<?php echo $Europa->getMapInfo("name"); ?>');
});
</script>
<?php
endif;
?>

<!-- View -->
<table id='gameboard'>
	<tr>
		<td width="100%">
			<div id='moveArmies' class='controlView'>
				<form action='javascript:Europa.moveArmies()'>
				<table id='actionForm'><tr>
					<td>Stuur leger naar <span id='armytarget'></span>: </td>
					<td><input min='1' id='army' type='number' value='1' /></td>
					<td><input class='icon' type="image" src="media/img/army.png" border="0" /></td>
				</table>
				</form>
			</div>
			<div id='selectedRegion' class='controlView'>
				<table class='infoTable'>
					<tr><td>Land: </td><td id='selectedRegionName'></td></tr>
					<tr><td>Basiswaarde: </td><td id='selectedRegionWorth'></td></tr>
					<tr><td>Export: </td><td id='selectedRegionTrade'></td></tr>
					<tr><td>Eigenaar: </td><td id='selectedRegionOwner'></td></tr>
					<tr><td>Leger: </td><td id='selectedRegionArmy'></td></tr>
					<tr><td colspan='2'>Buurlanden: </td></tr>
					<tr><td colspan='2' id='selectedRegionNeigh'></td></tr>
					<tr class='regionOwnerControls'><td colspan='2'><a onclick='Europa.selectAttackableRegions()' id='attackRegion'>Aanvallen met dit land</a></td></tr>
					<tr class='regionOwnerControls'><td colspan='2'><a onclick='Europa.selectAidableRegions()' id='aidRegion'>Ondersteunen met dit land</a></td></tr>
				</table>
			</div>
			<div id='playerView' class='controlView'>
				<table class='infoTable'>
					<tr><td colspan='2' style='font-size: 2em; text-align: center;' id='playerViewUsername'></td></tr>
					<tr><td style='text-align: center;' colspan='2'><img class='profilePic' id='playerViewImg' /></td></tr>
					<tr><td>Naam: </td><td id='playerViewName'></td></tr>
					<tr><td>Kleur: </td><td id='playerViewColor'></td></tr>
					<tr><td>Bondgenoten: </td><td id='playerViewAllies'></td></tr>
					<tr><td padding-left='10px'>in aanvraag: </td><td id='playerViewAlliesPending'></td></tr>
					<tr><td>Handel: </td><td id='playerViewTrade'></td></tr>
					<tr><td padding-left='10px'>in aanvraag: </td><td id='playerViewTradePending'></td></tr>
				</table>
			</div>
			<div id='settingsView' class='controlView'>
				<form action='javascript:Europa.updateSettings()' accept-charset='utf-8'>
				<table class='infoTable'>
					<tr><td colspan='2' style='font-size: 2em; text-align: center;'>Instellingen</td></tr>
					<tr><td>Login: </td><td id='settingsViewUsername'></td></tr>
					<tr><td style='text-align: center;' colspan='2'><img class='profilePic' id='settingsViewImgPreview' /><br /><input type='text' id='settingsViewImg' /></td></tr>
					<tr><td>Voornaam: </td><td><input type='text' id='settingsViewName'/></td></tr>
					<tr><td>Kleur: </td><td id='settingsViewColorBackground'><input style='background-color: rgba(255,255,255,0.5)' type='text' id='settingsViewColor'></td></tr>
					<tr><td>E-mail adres: </td><td><input type='text' id='settingsViewMail'/></td></tr>
					<tr><td colspan='2' style='text-align: center'><input type='submit' value='Updaten' style='width: 150px' /></td></tr>
				</table>
				</form>
			</div>
		</td>
		<td id='mapcell'>
			<div id="map-display"></div>
		</td>
	</tr>
</table>