<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" media="all" href="style.css"/>
</head>
<body>
<form>
Datum: <input name="date" type="text" /><br />
Tijd: <input name="time" type="text" /><br />
Sessie: <input name="maptable" type="text" value="europa1" /><br />
<input type="submit" value="OK" /><br />
<hr />
</form>
<?php
if (isset($_GET['date']) and isset($_GET['time']))
    {
    echo file_get_contents('process/process_' . $_GET['date'] . '_' . $_GET['time'] . ':00.txt');
    }
?>
<body>
</html>