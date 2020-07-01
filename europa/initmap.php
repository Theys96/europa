  <link rel="stylesheet" media="all" href="jquery-jvectormap.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
  <script src="lib/jquery-jvectormap.js"></script>
  <script src="lib/jquery-mousewheel.js"></script>

  <script src="lib/jvectormap.js"></script>

  <script src="lib/abstract-element.js"></script>
  <script src="lib/abstract-canvas-element.js"></script>
  <script src="lib/abstract-shape-element.js"></script>

  <script src="lib/svg-element.js"></script>
  <script src="lib/svg-group-element.js"></script>
  <script src="lib/svg-canvas-element.js"></script>
  <script src="lib/svg-shape-element.js"></script>
  <script src="lib/svg-path-element.js"></script>
  <script src="lib/svg-circle-element.js"></script>

  <script src="lib/vml-element.js"></script>
  <script src="lib/vml-group-element.js"></script>
  <script src="lib/vml-canvas-element.js"></script>
  <script src="lib/vml-shape-element.js"></script>
  <script src="lib/vml-path-element.js"></script>
  <script src="lib/vml-circle-element.js"></script>

  <script src="lib/vector-canvas.js"></script>
  <script src="lib/simple-scale.js"></script>
  <script src="lib/numeric-scale.js"></script>
  <script src="lib/ordinal-scale.js"></script>
  <script src="lib/color-scale.js"></script>
  <script src="lib/data-series.js"></script>
  <script src="lib/proj.js"></script>
  <script src="lib/world-map.js"></script>

  <script src="europe.js"></script>
  <script src="world.js"></script>
  <script src="usa.js"></script>
  <script>



    jQuery(function(){
      var $ = jQuery;

      function placeData(data) {
    	$('#info').html(data);
	var infoheight = $('#infotable').height();
	$('#info').height('0px');
	$('#info').animate({height: infoheight});
        }
      
      $('#map1').vectorMap({
        map: '<?php echo $mapname ?>',
        focusOn: {
          x: <?php echo $focusonx ?>,
          y: <?php echo $focusony ?>,
          scale: <?php echo $focusonscale ?>
        },
        zoomMax: <?php echo $zoommax ?>,
        zoomMin: <?php echo $zoommin ?>,
        series: {
          regions: [{
            scale: 
<?php

if ($maptype == 'owner') :
echo '{';
$result = mysqli_query($con,"SELECT * FROM players,$playertable WHERE players.id=$playertable.id");
while ($player = mysqli_fetch_array($result))
    {
    echo $player['username'] . ': "' . $player['color'] . '",';
    }
echo 'neutral: "#000000"}';
endif;

if ($maptype == 'blackwhite') :
echo '{me: "#FFFFFF",notme: "#000000",bg: "#999999"}';
endif;

if ($maptype == 'army') :
echo "['#FFFFFF', '#A52A2A']";
endif;

if ($maptype == 'trade') :
echo "['#FFFFFF', '#2AA52A']";
endif;

if ($maptype == 'export') :
echo "['#FFFFFF', '#2A2AA5']";
endif;

if ($maptype == 'profit') :
echo "['#FFFFFF', '#FDD017']";
endif;
?>
            ,
            normalizeFunction: 'polynomial',
            values: {
<?php
if ($maptype == 'owner') :
$result = mysqli_query($con,"SELECT * FROM $maptable");
while ($region = mysqli_fetch_array($result))
    {
    echo $region['id'] . ': "' . $region['owner'] . '",';
    }
endif;

if ($maptype == 'blackwhite') :
$result = mysqli_query($con,"SELECT * FROM $maptable");
while ($region = mysqli_fetch_array($result))
    {
    if ($region['owner'] == $_SESSION[$maptable]['username'])
        echo $region['id'] . ': "me",';
    else if (checkBG($region['owner'],$_SESSION[$maptable]['username']))
        echo $region['id'] . ': "bg",';
    else
        echo $region['id'] . ': "notme",';
    }
endif;

if ($maptype == 'army') :
$result = mysqli_query($con,"SELECT * FROM $maptable");
while ($region = mysqli_fetch_array($result))
    {
if ($region['owner'] != 'free' and $region['owner'] != 'neutral')
    echo $region['id'] . ': "' . $region['army'] . '",';
    }
endif;

if ($maptype == 'profit') :
$result = mysqli_query($con,"SELECT * FROM $maptable");
while ($region = mysqli_fetch_array($result))
    {
if ($region['owner'] != 'free' and $region['owner'] != 'neutral')
	{
	echo $region['id'] . ': "' . getProfitRegion($region['id']) . '",';
	}
    }
endif;

if ($maptype == 'trade') :
$result = mysqli_query($con,"SELECT * FROM $maptable");
while ($region = mysqli_fetch_array($result))
    {
if ($region['owner'] != 'free' and $region['owner'] != 'neutral')
	{
	echo $region['id'] . ': "' . getTradeRegion($region['id']) . '",';
	}
    }
endif;


if ($maptype == 'export') :
$result = mysqli_query($con,"SELECT * FROM $maptable");
while ($region = mysqli_fetch_array($result))
    {
if ($region['owner'] != 'free' and $region['owner'] != 'neutral')
    echo $region['id'] . ': "' . $region['trade'] . '",';
    }
endif;
?>
            }
          }]
        },
onRegionClick: function(event, code){
	$.get('info.php?code='+code, placeData);
	},
      });
    });

</script>