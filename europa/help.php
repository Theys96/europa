<?php
session_start();
include 'sessions.php';
?>
<!DOCTYPE html>
<html>
<head>
  <title><?php echo $sessie[$_SESSION['game']]; ?> - Help</title>
  <link rel="stylesheet" media="all" href="style.css"/>
</head>
<body>

<center><a href="index.php">Terug</a></center>
<div id="help">
<h2>Info</h2>
<p>Enige uitleg over het spel Europa/Wereld.</p>
<p>
Europa is een beurt-gebaseerd strategiespel. Men doet zetten, ook wel beurten genoemd, zoals ondersteunen en aanvallen, en zodra de beurt afloopt, die typisch tussen de 6 en 18 uur duurt, worden al deze zetten tegelijk uitgevoerd.
Bovenin kun je zien wanneer de huidige beurt afloopt.
</p>

<h3>Uitleg naar term</h3>
<p><b>BG: </b>Bondgenootschap. Afspraak om samen te werken. Men kan bovenin naast BG op '+' klikken en een username invullen, om deze officieel te laten werken. Dit betekent praktisch dat je elkaar kan ondersteunen met troepen. Lees hierover meer bij <b>OS</b>. Bondgenootschappen gaan meteen in, en hebben dus niets met beurten te maken.</p>
<p><b>Handel: </b>Landen hebben onderling handel, te zien bij 'handel' in de info van een land. Deze waarde is gebaseerd op de land-eigen 'export' waarde en de exportwaarden van de buurlanden waar een handelsrelatie mee bestaat. Deze handelsrelatie bestaat alleen als de landen van dezelfde eigenaar zijn, of als de landen van twee spelers zijn die hebben aangegeven handel met elkaar te willen drijven. Dit kan je doen door naast 'Handel' bovenin op de '+' te klikken en een username in te vullen.
<p><b>NAP: </b>Niet-aanvals-pact. Afspraak om elkaar niet aan te vallen.</p>
<p><b>OS: </b>Ondersteuning. Je stuurt hierbij legers naar een bondgenoot. Dit kan alleen als de zender en ontvanger bondgenoot zijn (lees meer bij <b>BG</b>). De legers verdwijnen hierbij in het land van de zender en verschijnen bij de ontvanger, net alsof je een eigen land ondersteunt.</p>
<p><b>Rang: </b>Als je 3e, 2e, of 1e wordt in een sessie, krijg je respectievelijk 1, 2 of 3 punten bij je rating opgeteld. Deze rating geeft je een bepaalde titel. Bij 0 rating is je rang 'Soldaat'.</p>
<p><b>Schermnaam: </b>De naam die verschijnt van een speler in het spel, bijvoorbeeld in de chat. Deze bestaat uit (naar keuze) de rang en username, en als je die hebt eventuele speciale (achter)titels.</p>
<p><b>Username: </b>De unieke naam die iedere speler heeft. Verder kan iedere speler een voornaam en achternaam naar keuze hebben, die op het profiel verschijnt.</p>

<h3>Winnen</h3>
<p>
Zodra er nog 3 spelers over zijn in een sessie stopt deze.<br />
De top 3 wordt nu vastgesteld aan de hand van <b>inkomen</b>.<br />
De 3e plaats wordt 1 punt rating toegekend.<br />
De 2e plaats wordt 2 punt rating toegekend.<br />
De 1e plaats wordt 3 punt rating toegekend.<br />
</p>

<h3>Iconenreferentie</h3>
<p><img src="media/att.png" height="20" style="float: left;" />Aanvallen. Dit staat voor het aanvallen van een land.</p>
<p><img src="media/def.png" height="20" style="float: left;" />Verdedigen. Dit staat voor het verdedigen, of ondersteunen van een land.</p>
<p><img src="media/coins.png" height="20" style="float: left;" />Geld. Dit geeft je saldo (blauw), uitgaven (rood) en inkomsten (groen) aan.</p>
<p><img src="media/army.PNG" height="20" style="float: left;" />Leger. Dit geeft de grootte van je leger op dit moment aan.</p>
<p><img src="media/tools.png" height="20" style="float: left;" />Settings. Hier kun je instellingen wijzigen.</p>
</div>

</body>
</html>