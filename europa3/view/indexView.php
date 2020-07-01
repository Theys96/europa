<!DOCTYPE html>
<html>
<head>
<title>Europa 3.0 | BETA</title>
<meta charset="ISO-8859-1">
<?php include "engine/php/includes.php"; ?>
<?php
$Europa->setMap($map);
?>
</head>
<body>

<div id='container'>
	<div id='head'>
		<div id='logo'>Europa<sup>3.0</sup></div>
		<div id='menu'>

<!-- Menu start -->
<?php
include $view['menu'];
?>

<!-- Menu end -->

		</div>
	</div>

	<div id='main'>

<!-- View start -->
<?php
include $view['view'];
?>

<!-- View end -->

	</div>
</div>

</body>
</html>