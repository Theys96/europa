<?php
session_start();
include 'sessions.php';

if ($_POST['login'] == 'europa')
    $_SESSION['god'] = $_POST['game'];
$logged = isset($_SESSION['god']);
?>
<!DOCTYPE html>
<html>
<head>
<style>
body {
<?php
if ($logged==false)
    echo "background-image: url('http://www.artkarma.com/wp-content/uploads/2012/08/Gates-of-Heaven-2-e1343844322313.jpg');";
?>
background-size: 100%;
background-position: 0px -500px;
background-repeat: no-repeat;
}
</style>
</head>
<body>
<?php
if ($logged == true) :

session_start();
include 'functions.php';
include 'config_' . $_SESSION['god'] . '.php';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

if (isset($_POST['rating']))
    {
    $user=$_POST['addrating'];
    $q = $_POST['rating'];
    $res = mysqli_query($con,"SELECT * FROM $playertable,players WHERE players.id=$playertable.id AND players.username='$user'");
    $adduser = mysqli_fetch_array($res);
    $qnew=$adduser['rating']+$q;
    mysqli_query($con,"UPDATE $playertable,players SET rating='$qnew' WHERE players.id=$playertable.id AND players.username='$user'");
    echo 'Klaar. aan de rating van ' . $adduser['rating'] . ' is ' . $q . ' toegevoegd. Deze is nu ' . $qnew . '.';
    }

if (isset($_POST['title']))
    {
    $user=$_POST['settitle'];
    $title = $_POST['title'];
    mysqli_query($con,"UPDATE $playertable,players SET title='$title' WHERE players.id=$playertable.id AND players.username='$user'");
    echo 'Klaar. De titel van ' . $user . ' is veranderd in ' . $title . '.';
    }
    
if (isset($_POST['suftitle']))
    {
    $user=$_POST['setsuftitle'];
    $title = $_POST['suftitle'];
    mysqli_query($con,"UPDATE $playertable,players SET suftitle='$title' WHERE players.id=$playertable.id AND players.username='$user'");
    echo 'Klaar. De achtertitel van ' . $user . ' is veranderd in ' . $title . '.';
    }
?>
<hr />
<form method="get">
Username: 
<input type="text" name="name" />
<input type="submit" value="zoek" />
</form>
<hr />
<form method="get">
IP: 
<input name="ip" type="text" />
<input type="submit" value="zoek" />
</form>
<hr />
<a href="?info=latest">Laatste logins</a>
<hr />
<form method="post">
Voeg rating toe: 
<input name="addrating" type="text" placeholder="speler"/>
<input name="rating" type="text" size="3" placeholder="0" />
<input type="submit" value="OK" />
</form>

<form method="post">
Geef titel: 
<input name="settitle" type="text" placeholder="speler"/>
<input name="title" type="text" placeholder="titel" />
<input type="submit" value="OK" />
</form>

<form method="post">
Geef achtertitel: 
<input name="setsuftitle" type="text" placeholder="speler"/>
<input name="suftitle" type="text" placeholder="titel" />
<input type="submit" value="OK" />
</form>
<hr />
<a target="_blank" href="http://net2ftp.com/index.php?ftpserver=thijshavinga.nl&ftpserverport=21&username=thijshavi&password_encrypted=62BD67015A5B34EE&language=en&skin=shinra&ftpmode=automatic&passivemode=no&protocol=FTP&viewmode=list&sort=&sortorder=&state=browse&state2=main&directory=%2Fpublic_html%2Feuropa&entry=settings.php">FTP</a>
<hr />

<?php
if ($_GET['info'] == 'latest')
    {
    $res = mysqli_query($con,"SELECT * FROM log ORDER BY timestamp DESC LIMIT 10");
    echo '<h2>Laatste logins</h2>';
    echo '<table border="1">';
    while ($log = mysqli_fetch_array($res))
        {
        echo '<tr><td>' . $log['user'] . '</td><td>' . $log['timestamp'] . '</td><td>' . $log['ip'] . '</td></tr>';
        }
    echo '</table>';
    }


if (isset($_GET['name']))
{
$name=$_GET['name'];
$res = mysqli_query($con,"SELECT * FROM log WHERE user='$name'");
echo '<h2>' . $name . '</h2>';
$ips = array();
while ($log = mysqli_fetch_array($res))
    {
    if (isset($ips[$log['ip']]))
        $ips[$log['ip']] += 1;
    else
        $ips[$log['ip']] = 1;
    }
arsort($ips);
$total = array_sum($ips);
foreach ($ips as $ip=>$q)
    {
    echo '<a href="?ip=' . $ip . '">' . $ip . '</a> (' . round($q/$total*100,2) . '%)<br />';
    }
echo 'Totaal logins: ' . $total . '<hr />';
echo '<table border="1">';
$res = mysqli_query($con,"SELECT * FROM log WHERE user='$name' ORDER BY timestamp DESC");
while ($log = mysqli_fetch_array($res))
    {
    echo '<tr><td>' . $log['ip'] . '</td><td>' . $log['timestamp'] . '</td></tr>';
    }
echo '</table>';
}

if (isset($_GET['ip']))
{
$ip=$_GET['ip'];
$res = mysqli_query($con,"SELECT * FROM log WHERE ip='$ip'");
echo '<h2>' . $ip . '</h2>';
$names = array();
while ($log = mysqli_fetch_array($res))
    {
    if (isset($names[$log['user']]))
        $names[$log['user']] += 1;
    else
        $names[$log['user']] = 1;
    }
arsort($names);
$total = array_sum($names);
foreach ($names as $name=>$q)
    {
    echo '<a href="?name=' . $name . '">' . $name . '</a> (' . round($q/$total*100,2) . '%)<br />';
    }
echo 'Totaal logins: ' . $total;
echo '<hr /><table border="1">';
$res = mysqli_query($con,"SELECT * FROM log WHERE ip='$ip' ORDER BY timestamp DESC");
while ($log = mysqli_fetch_array($res))
    {
    echo '<tr><td>' . $log['user'] . '</td><td>' . $log['timestamp'] . '</td></tr>';
    }
echo '</table>';
}

endif;
if ($logged == false) :
?>
<form method="post">
<input type="password" name="login" />
<select name="game">
<?php
foreach ($sessie as $id=>$name)
    {
    echo '<option name="game" value="' . $id . '">' . $name . '</option>';
    }
?>
</select> 
<input type="submit" value="Aye" />
</form>
<?php
endif;
?>
</body>
</html>