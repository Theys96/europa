<?php
Class EuropaGame
    {
    protected $mysql;
    protected $session;
    
    public function loadIncludes($folder)
        {
        if ($handle = opendir($folder)) 
            {
            while (false !== ($entry = readdir($handle))) 
                {
                $file = pathinfo($folder . '/' . $entry);
                $path = $folder . "/" . $file['basename'];
                switch($file['extension'])
                    {
                    case 'js':
                        echo "<script src=\"" . $path . "\"></script>\n";
                    break;
                    
                    case 'php':
                        include $path;
                    break;
                    
                    case 'css':
                        echo "<link rel='stylesheet' media='all' type='text/css' href='" . $path . "'>\n";
                    break;
                    }
                }
        
            closedir($handle);
            }
        }
    
    public function loadPage($page)
        {
        if ($this->session->isInit())
            {
            return 'game.php';
            }
        else
            {
            return 'login.php';
            }
        }
    
    public function __construct(mysqli $mysql,GameSession $session)
        {
        $this->mysql = $mysql;
        $this->session = $session;
        }
    }

Class User
    {
    protected $mysql;
    protected $exists;
    protected $data;
    protected $logged;
    protected $insession;
    
    public function __construct($user,mysqli $mysql,$session)
        {
        $this->mysql = $mysql;
        $this->logged = false;
        
        //Collect data
        if (isset($session))
            {
            $playertable = $session->GameData(null,'playertable');
            if (is_int($user))
                $query = $this->mysql->query("SELECT * FROM players,$playertable WHERE players.id=$user AND players.id=$playertable.id");
            else if(is_string($user))
                $query = $this->mysql->query("SELECT * FROM players,$playertable WHERE players.username='$user' AND players.id=$playertable.id");
            if ($query->num_rows == 0)
                {
                if (is_int($user))
                    $query = $this->mysql->query("SELECT * FROM players WHERE id=$user");
                else if(is_string($user))
                    $query = $this->mysql->query("SELECT * FROM players WHERE username='$user'");
                
                if ($query->num_rows > 0)
                    {
                    $this->data = $query->fetch_assoc();
                    $this->exists = true;
                    }
                }
            else
                {
                $this->insession = true;
                $data = $query->fetch_assoc();
                
                //Put trade in array
                $data['trade'] = explode(',',$data['trade']);
                
                //Put bg in array
                $data['bg'] = explode(',',$data['bg']);
                
                //Find all regions
                if (isset($session))
                    {
                    $data['regions'] = array();
                    $maptable = $session->GameData(null,'maptable');
                    $owner = $data['username'];
                    $query = $this->mysql->query("SELECT * FROM $maptable WHERE owner='$owner'");
                    while ($region = $query->fetch_assoc())
                        {
                        $data['regions'][] = $region['id'];
                        }
                    }
                
                $this->data = $data;
                $this->exists = true;
                }
            }
        else
            {
            if (is_int($user))
                $query = $this->mysql->query("SELECT * FROM players WHERE id=$user");
            else if(is_string($user))
                $query = $this->mysql->query("SELECT * FROM players WHERE username='$user'");
            
            if ($query->num_rows > 0)
                {
                $this->data = $query->fetch_assoc();
                $this->exists = true;
                }
            }
        
        if ($this->exists)
            {
            $data = $this->data;
            
            //Rank
            $data['rank'] = $this->calcRank($data['rating']);
                
            //Put settings in array
            $settings = explode(',',$data['settings']);
            $data['settings'] = array();
            foreach ($settings as $setting)
                {
                $setting = explode(':',$setting);
                $data['settings'][$setting[0]] = $setting[1];
                }
            
            //Screen name
            if ($data['settings']['showtitle'] == 'true')
                $title .= '<span style="font-weight: bold">' . $data['rank'] . '</span> ';
            if ($data['settings']['showspectitle'] == 'true' and $player['title'] != '')
                $title .= '<span style="font-weight: bold">' . $data['title'] . '</span> ';
            $title .= $data['username'];
            if ($data['settings']['showsuftitle'] == 'true' and $data['suftitle'] != '')
                {
                $title .= (substr($data['suftitle'],0,1) != ',') ? ' ' : '';
                $title .= '<span style="font-weight: bold">' . $data['suftitle'] . '</span>';
                }
            $data['screenname'] = $title;
            
            $this->data = $data;
            }
        }
    
    public function exists()
        {
        return $this->exists;
        }
    
    public function inSession()
        {
        return $this->insession;
        }
    
    public function living()
        {
        if (count($this->regions) > 0)
            return true;
        else
            return false;
        }
    
    public function __get($item)
        {
        if (isset($item))
            return $this->data[$item];
        else
            return $this->data;
        }
    
    public function __set($name,$value)
        {
        $this->data[$name] = $value;
        }
    
    public function setting($setting)
        {
        return $this->data['settings'][$setting];
        }
    
    public function auth($password)
        {
        if (isset($password))
            {
            $username = $this->username;
            if ($this->data['password'] == $password or crypt($password, PASSWORD_BCRYPT) == $this->data['password'])
                {
                $this->logged = true;
                return true;
                }
            else
                return false;
            }
        else
            return true;
        }
    
    public function joinSession(GameSession $session)
        {
        $this->__construct($this->username,$this->mysql,$session);
        }
    public function isBG($user)
        {
        if (in_array($user->id,$this->bg) and in_array($this->id,$user->bg))
            return true;
        else
            return false;
        }

    public function isTrade($user)
        {
        if (in_array($user->id,$this->trade) and in_array($this->id,$user->trade))
            return true;
        else
            return false;
        }
    
    public function calcRank($rating)
        {
        $ranks = array(
            'Soldaat'           =>  0,
            'Krijger'           =>  1,
            'Korpsleider'       =>  2,
            'Sergeant'          =>  3,
            'Kapitein'          =>  5,
            'Luitenant'         =>  8,
            'Veteraan'          =>  10,
            'Generaal'          =>  15,
            'Maarschalk'        =>  20,
            'Veldheer'          =>  25,
            'Oorlogsheld'       =>  30
        );
        foreach ($ranks as $title=>$q)
            {
            if ($rating >= $q)
                $rank = $title;
            else
                break;
            }
        
        return $rank;
        }
    }

Class GameSession
    {
    protected $mysql;
    
    public function __construct($mysql)
        {
        $this->mysql = $mysql;
        if (!isset($_SESSION['europa']) or in_array(null,$_SESSION['europa']))
            $_SESSION['europa'] = array();
        }
    
    public function __set($name,$value)
        {
        $_SESSION['europa'][$name] = $value;
        }
    
    public function __get($name)
        {
        return $_SESSION['europa'][$name];
        }
    
    public function initGameSession($game_id,User $user)
        {
        $_SESSION['europa']['gameid'] = $game_id;
        $_SESSION['europa']['username'] = $user->username;
        $_SESSION['europa']['logged'] = true;
        }
    
    public function isInit()
        {
        if ($_SESSION['europa']['logged'] != true)
            return false;
        else
            return true;
        }
    
    public function GameData($game_id,$value)
        {
        $game_id = isset($game_id) ? $game_id : $_SESSION['europa']['gameid'];
        $query = $this->mysql->query("SELECT * FROM sessions WHERE id='$game_id'");
        $data = $query->fetch_assoc();
        $data['maptable'] = 'map_' . $data['id'];
        $data['playertable'] = 'players_' . $data['id'];
        $data['subtable'] = 'subs_' . $data['id'];
        $mapdata = explode('_',$data['mapname']);
        $data['mapfile'] = $mapdata[0] . '.js';
        $data['maptype'] = $mapdata[1];
        $data['maplang'] = $mapdata[2];
        if (isset($value))
            return $data[$value];
        else
            return $data;
        }
    
    public function listGames($condition)
        {
        switch($condition)
            {
            case 'active':
                $query = $this->mysql->query("SELECT * FROM sessions WHERE active=1");
            break;
            
            case 'inactive':
                $query = $this->mysql->query("SELECT * FROM sessions WHERE active=0");
            break;
            
            case 'notpaused':
                $query = $this->mysql->query("SELECT * FROM sessions WHERE paused=0");
            break;
            
            case 'paused':
                $query = $this->mysql->query("SELECT * FROM sessions WHERE paused=1");
            break;
            
            default:
                $query = $this->mysql->query("SELECT * FROM sessions");
            break;
            }
        
        while($game = $query->fetch_assoc())
            {
            $games[$game['id']] = $game['name'];
            }
        return $games;
        }
    
    public function listPlayers()
        {
        $players = array();
        $playertable = $this->GameData(null,'playertable');
        $query = $this->mysql->query("SELECT * FROM $playertable");
        while ($player = $query->fetch_assoc())
            {
            $players[] = new User(intval($player['id']),$this->mysql,$this);
            }
        $players['neutral'] = new User('neutral',$this->mysql,$this);
        
        return $players;
        }
    
    public function listColors()
        {
        $playertable = $this->GameData(null,'playertable');
        $values = array('00','33','66','99','cc','ff');
        $colors = array();
        
        for ($r=0;$r<6;$r++)
            {
            for ($g=0;$g<6;$g++)
                {
                for ($b=0;$b<6;$b++)
                    {
                    $color = '#' . $values[$r] . $values[$g] . $values[$b];
                    $colors[$color] = true;
                    }
                }
            }
        
        $colors['#ffffff'] = false;
        $colors['#000000'] = false;
        $res = $this->mysql->query("SELECT * FROM $playertable");
        while ($row = $res->fetch_assoc())
            {
            $colors[$row['color']] = false;
            }
        
        return $colors;
        }
    
    public function exitGameSession()
        {
        unset($_SESSION['europa']);
        }
    
    public function logout()
        {
        $_SESSION['europa']['logged'] = false;
        }
    }

Class Map
    {
    protected $mysql;
    protected $session;
    protected $map;
    protected $mapfile;
    protected $mapname;
    protected $maptype;
    protected $mapconfig;
    protected $regions;
    protected $players;
    protected $gameid;
    
    public function __construct(mysqli $mysql,GameSession $session,$gameid,$config)
        {
        $this->mysql = $mysql;
        $this->gameid = $gameid;
        $this->mapfile = 'maps/' . $session->GameData($this->gameid,'mapfile');
        $this->mapname = $session->GameData($this->gameid,'mapname');
        $this->session = $session;
        $this->regions = array();
        
        if (!$this->session->isInit())
            {
            $fakesession = true;
            $guest = new User('gast',$this->mysql,$this->session);
            $this->session->initGameSession($gameid,$guest);
            }
        
        $this->mapconfig = isset($config) ? $config : $this->session->GameData($this->gameid,'config');
        
        $maptable = $this->session->GameData($this->gameid,'maptable');
        $query = $this->mysql->query("SELECT * FROM $maptable");
        while ($region = $query->fetch_assoc())
            {
            $this->regions[$region['id']] = new Region($region['id'],$mysql,$session);
            }
        
        $this->players = array();
        foreach($this->session->listPlayers() as $player)
            {
            $this->players[$player->username] = $player;
            $this->players[$player->id] = $player;
            }
        $this->players['neutral'] = new User('neutral',$this->mysql,$this->session);
        
        if ($fakesession)
            $this->session->logout();
        }
    
    public function __get($name)
        {
        switch ($name)
            {
            case 'players':
                return $this->players;
            break;
            
            case 'regions':
                return $this->regions;
            break;
            }
        }
    
    public function region($code)
        {
        return $this->regions[$code];
        }
    
    public function player($username)
        {
        return $this->players[$username];
        }
        
    public function latestProcess()
        {
        $path = "process/" . $this->gameid; 
        $latest_ctime = 0;
        $latest_filename = '';    
        $d = dir($path);
        while (false !== ($entry = $d->read())) {
          $filepath = "$path/$entry";
          if (is_file($filepath) && filectime($filepath) > $latest_ctime) {
            $latest_ctime = filectime($filepath);
            $latest_filename = $entry;
          }
        }
        return file_get_contents("process/" . $this->gameid . "/" . $latest_filename);
        }
    
    public function process()
        {
        $maptable = $this->session->GameData($this->gameid,'maptable');
        $playertable = $this->session->GameData($this->gameid,'playertable');
        
        //Handles recruiting, table wipe
        $this->mysql->query("UPDATE $maptable SET move='',attack='',recruit=0,army=army_new WHERE 1");
        $this->mysql->query("UPDATE $playertable SET money=money_new WHERE 1");
        
        //Mawney
        foreach ($this->players as $name=>$player)
            {
            if (is_string($name))
                {
                $player_id = $player->id;
                $profit = $this->calcPlayerProfit($player->username);
                $this->mysql->query("UPDATE $playertable SET money=money+$profit,money_new=money_new+$profit WHERE id='$player_id'");
                }
            }
        
        //Informatie
        $attack = array();
        foreach ($this->regions as $region)
            {
            foreach ($region->attack as $victim=>$q)
                {
                $attack[$victim][$region->id] = $q;
                }
            }
        
        //Voer aanvallen uit
        foreach ($attack as $victim=>$info)
            {
            $victim  = $this->region($victim);
            $victim_id = $victim->id;
            $outcome = $this->calcAttack(array_sum($info),$victim->army_new);
            
            $victims = $victim->army_new - $outcome['def']['left'];
            $left_attacker = $outcome['att']['left'];
            $attackers = array();
            $attackers_name = array();
            foreach ($info as $attacker=>$q)
                {
                $attackers[$attacker] = $this->regions[$attacker];
                $attackers_name[$attackers] = $this->regions[$attacker]->name;
                $homecomers = round($q/array_sum($info)*$left_attacker, 0);
                if ($homecomers > 0)
                    $this->mysql->query("UPDATE $maptable SET army=army+$homecomers,army_new=army_new+$homecomers WHERE id='$attacker'");
                }
            if ($victims > 0)
                $this->mysql->query("UPDATE $maptable SET army=army-$victims,army_new=army_new-$victims WHERE id='$victim_id'");
            $victor = $this->regions[array_search(max($info),$info)];
            
            //Print results
            $page .= "<table class='rapport'>\n";
            $page .= "<tr><td>Aanvaller</td><td>Verdediger</td></tr>\n";
            $page .= "<tr><td>" . implode(', ',array_keys($attackers_name)) . "</td><td>" . $victim->name . "</td></tr>\n";
            $page .= "<tr><td>" . array_sum($info) . "</td><td>" . $victim->army_new . "</td></tr>\n";
            $page .= "<tr><td colspan='2'><img align='left' src='media/bar.png' height='20px' width='" . $outcome['att']['factor']*50 . "%' /><br /><img align='right' src='media/bar.png' height='20px' width='" . $outcome['def']['factor']*50 . "%' /></td></tr>\n";
            $page .= "<tr><td>" . $outcome['att']['left'] . "</td><td>" . $outcome['def']['left'] . "</td></tr>\n";
            $page .= "<tr><td colspan='2'>\n";
            $page .= (($outcome['def']['left'] > $outcome['att']['left']) ? "De verdediger heeft gewonnen." : "De aanvaller heeft gewonnen<br />") . "\n";
            if ($outcome['def']['left'] == 0 and $outcome['att']['left'] > 0)
                {
                $victor_owner = $victor->owner;
                $this->mysql->query("UPDATE $maptable SET owner='$victor_owner' WHERE id='$victim_id'");
                $page .= "<br />" . $victim->name . " is nu van " . $victor->owner . " (" . $victor->name . ")\n";
                }
            $page .= "</td></tr>\n";
            $page .= "</table><br /><br />\n\n";
            //Done.
            }
        
        return $page;
        }
    
    public function livingPlayers()
        {
        $living = 0;
        foreach ($this->players as $id=>$player)
            {
            if (is_string($id) and (count($player->regions) > 0))
                {
                $living++;
                }
            }
        return $living;
        }
    
    public function calcAttack($att_n,$def_n)
        {
        $rand_a = (mt_rand(0,1000))/1000;
        $rand_d = (mt_rand(0,1000))/1000;
        $factor_def = (4.76*pow($rand_d,4)) - (14.29*pow($rand_d,3)) + (14.1*pow($rand_d,2)) - (6.07*$rand_d) + 2;
        $factor_att = (4.76*pow($rand_a,4)) - (14.29*pow($rand_a,3)) + (14.1*pow($rand_a,2)) - (6.07*$rand_a) + 2;
        $damage_att = round($factor_att * $att_n,0);
        $damage_def = round($factor_def * $def_n,0);
        $left_att = max(0,$att_n - $damage_def);
        $left_def = max(0,$def_n - $damage_att);
        return array(
                'att'=>array(
                    'left'      => $left_att,
                    'factor'    => $factor_att
                        ),
                'def'=>array(
                    'left'      => $left_def,
                    'factor'    => $factor_def
                    )
                );
        }
    
    public function LoadFiles()
        {
        echo '
        <script src="lib/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="' . $this->mapfile . '"></script>
        ';
        }
    
    public function initMap($loc,$mode)
        {
        $mode = ($mode == '' ? 'owner' : $mode);
        if ($this->mapconfig == '')
            $config = '';
        else
            $config = $this->mapconfig . ',';

        $json = $this->getJSON($mode);
        $values = json_encode($json['values']);
        $scale = json_encode($json['scale']);
        
        echo "
        $('".$loc."').vectorMap({
            backgroundColor: '#776677',
            " . $config . "
            map: '" . $this->mapname . "',
            container: $('" . $loc . "'),
            series: {
                regions: [{
                    values: " . $values . ",
                    scale: " . $scale . ",
                    normalizeFunction: 'polynomial'
                    }]
                },
            onRegionClick: function(event, code) {
                placeRegionData(code);
    	        },
            });
        ";
        }
    
    public function getJSON($mode)
        {
        $json = array(
            'values' => array(),
            'scale' => array()
            );
        $playerlist = $this->session->listPlayers();

        switch($mode)
            {
            case 'owner':
                foreach ($playerlist as $player)
                    {
                    $json['scale'][$player->username] = $player->color;
                    }
                    $json['scale']['neutral'] = '#000000';
                foreach ($this->regions as $region)
                    {
                    $json['values'][$region->id] = $region->owner;
                    }
            break;
            
            case 'blackwhite':
                $json['scale'] = array(
                    'me' => '#FFFFFF',
                    'notme' => '#000000',
                    'bg' => '#999999');
                $me = $this->players[$this->session->username];
                foreach ($this->regions as $region)
                    {
                    if ($region->owner != 'free' and $region->owner != 'neutral')
                        {
                        if ($region->owner == $this->session->username)
                            $json['values'][$region->id] = "me";
                        else if ($me->isBG($this->players[$region->owner]))
                            $json['values'][$region->id] = "bg";
                        else
                            $json['values'][$region->id] = "notme";
                        }
                    else
                        $json['values'][$region->id] = "notme";
                    }
            break;
            
            case 'army':
                $json['scale'] = array('#FFFFFF', '#A52A2A');
                foreach ($this->regions as $region)
                    {
                    if ($region->owner != 'free' and $region->owner != 'neutral')
                        $json['values'][$region->id] = $region->army;
                    }
            break;
            
            case 'trade':
                $json['scale'] = array('#FFFFFF', '#2AA52A');
                foreach ($this->regions as $region)
                    {
                    if ($region->owner != 'free' and $region->owner != 'neutral')
                        $json['values'][$region->id] = $this->calcTrade($region->id);
                    }
            break;
            
            case 'profit':
                $json['scale'] = array('#FFFFFF', '#FDD017');
                foreach ($this->regions as $region)
                    {
                    if ($region->owner != 'free' and $region->owner != 'neutral')
                        $json['values'][$region->id] = $this->calcProfit($region->id);
                    }
            break;
            
            case 'export':
                $json['scale'] = array('#FFFFFF', '#2A2AA5');
                foreach ($this->regions as $region)
                    {
                    if ($region->owner != 'free' and $region->owner != 'neutral')
                        $json['values'][$region->id] = $region->trade;
                    }
            break;
            }
        
        return $json;
        }
    
    public function focusOnUser($loc,$user)
        {
        echo '$("' . $loc . '").vectorMap("set", "focus", ' . json_encode($user->regions) . ');';
        }

    public function calcTrade($code)
        {
        $region = $this->regions[$code];
        $trade = 1+($region->trade)/100;
        foreach($region->neigh as $neigh)
            {
            $neigh = $this->regions[$neigh];
            if ($this->players[$region->owner]->isTrade($this->players[$neigh->owner]))
                $trade *= 1+($neigh->trade)/100;
            }
        $txt .= " = " . round($trade,2);
        return round(100*($trade-1),2);
        }
    
    public function calcProfit($code)
        {
        return round((1+($this->calcTrade($code))/100)*($this->regions[$code]->worth),2);
        }
    
    public function calcPlayerProfit($player)
        {
        foreach ($this->players[$player]->regions as $region)
            {
            $profit += $this->calcProfit($region);
            }
        return $profit;
        }
    
    public function calcPlayerArmy($player)
        {
        foreach ($this->players[$player]->regions as $region)
            {
            $army += $this->regions[$region]->army;
            }
        return $army;
        }
    
    public function move($from,$to,$q)
        {
        $region_from = $this->regions[$from];
        $region_to = $this->regions[$to];
        
        if ($q <= ($region_from->army)-($region_from->leaving))
            {            
            $moves = $region_from->move;
            $moves[$to] += $q;
            $moves = str_replace('"',"",substr(json_encode($moves),1,-1));
            $newarmy_from = $region_from->army_new - $q;
            $newarmy_to = $region_to->army_new + $q;
            
            $maptable = $this->session->GameData($this->gameid,'maptable');
            $this->mysql->query("UPDATE $maptable SET army_new='$newarmy_from',move='$moves' WHERE id='$from'");
            $this->mysql->query("UPDATE $maptable SET army_new='$newarmy_to' WHERE id='$to'");
            
            $this->region[$from] = new Region($from,$this->mysql,$this->session);
            $this->region[$to] = new Region($to,$this->mysql,$this->session);
            
            echo $q . ' troepen naar ' . $region_to->id . ' gestuurd.';
            }
        else
            echo 'Niet genoeg legers.';
        }
    
    public function attack($from,$to,$q)
        {
        $region_from = $this->regions[$from];
        $region_to = $this->regions[$to];
        
        if ($q <= ($region_from->army)-($region_from->leaving))
            {            
            $attacks = $region_from->attack;
            $attacks[$to] += $q;
            $attacks = str_replace('"',"",substr(json_encode($attacks),1,-1));
            $newarmy_from = $region_from->army_new - $q;
            
            $maptable = $this->session->GameData($this->gameid,'maptable');
            $this->mysql->query("UPDATE $maptable SET army_new='$newarmy_from',attack='$attacks' WHERE id='$from'");
            
            $this->region[$from] = new Region($from,$this->mysql,$this->session);
            
            echo $q . ' troepen naar ' . $region_to->id . ' gestuurd.';
            }
        else
            echo 'Niet genoeg legers.';
        }
    
    public function recruit($region,$q)
        {
        $region = $this->regions[$region];
        $owner = $this->players[$region->owner];
        
        if ($q <= $owner->money_new)
            {
            $id = $region->id;
            $user_id = $owner->id;
            $recruit = $region->recruit + $q;
            $army_new = $region->army_new + $q;
            $money_new = $owner->money_new - $q;
            $maptable = $this->session->GameData($this->gameid,'maptable');
            $playertable = $this->session->GameData($this->gameid,'playertable');
            $this->mysql->query("UPDATE $playertable SET money_new='$money_new' WHERE id='$user_id'");
            $this->mysql->query("UPDATE $maptable SET recruit='$recruit',army_new='$army_new' WHERE id='$id'");
            echo $q . ' gerekruteerd.';
            }
        else
            echo 'Niet genoeg geld.';
        }
    
    public function bg($player,$bg)
        {
        $player = $this->players[$player];
        $bg = $this->players[$bg];
        $bgs = $player->bg;
        $id = $player->id;
        
        if (in_array($bg->id,$bgs))
            {
            echo "Bondgenoot verwijderd.";
            unset($bgs[array_search($bg->id,$bgs)]);
            }
        else
            {
            echo "Bondgenoot toegevoegd.";
            $bgs[] = $bg->id;
            }
        
        $bgs = implode(',',$bgs);
        $playertable = $this->session->GameData($this->gameid,'playertable');
        $this->mysql->query("UPDATE $playertable SET bg='$bgs' WHERE id='$id'");
        }

    public function trade($player,$trade)
        {
        $player = $this->players[$player];
        $trade = $this->players[$trade];
        $trades = $player->trade;
        $id = $player->id;
        
        if (in_array($trade->id,$trades))
            {
            echo "Handelspartner verwijderd.";
            unset($trades[array_search($trade->id,$trades)]);
            }
        else
            {
            echo "Handelspartner toegevoegd.";
            $trades[] = $trade->id;
            }
        
        $trades = implode(',',$trades);
        $playertable = $this->session->GameData($this->gameid,'playertable');
        $this->mysql->query("UPDATE $playertable SET trade='$trades' WHERE id='$id'");
        }
    }

Class Region
    {
    protected $mysql;
    protected $session;
    protected $code;
    protected $data;
    
    public function __construct($code,mysqli $mysql,GameSession $session)
        {
        $this->mysql = $mysql;
        $this->session = $session;
        $this->code = $code;
        
        $maptable = $session->GameData(null,'maptable');
        $query = $this->mysql->query("SELECT * FROM $maptable WHERE id='$code'");
        $this->data = $query->fetch_assoc();
        $this->data['neigh'] = explode(',',$this->data['neigh']);
        $army_diff = $this->data['army_new'] - $this->data['army'];
        if ($army_diff >= 0)
            $army_diff = "+" . number_format($army_diff);
        else
            $army_diff = number_format($army_diff);
        $this->data['army_diff'] = $army_diff;
        $moves = array_filter(explode(',',$this->data['move']));
        $attacks = array_filter(explode(',',$this->data['attack']));
        $this->data['move'] = array();
        $this->data['attack'] = array();
        foreach ($moves as $move)
            {
            $move = explode(':',$move);
            $this->data['move'][$move[0]] = intval($move[1]);
            }
        foreach ($attacks as $attack)
            {
            $attack = explode(':',$attack);
            $this->data['attack'][$attack[0]] = intval($attack[1]);
            }
        $this->data['leaving'] = array_sum($this->data['move']) + array_sum($this->data['attack']);
        }
    
    public function __get($name)
        {
        return $this->data[$name];
        }
    }

Class Subtable
    {
    protected $session;
    protected $mysql;
    protected $required;
    protected $subtable;
    protected $sublist;
    
    public function __construct($mysql,$session)
        {
        $this->session = $session;
        $this->mysql = $mysql;
        $this->subtable = $this->session->GameData(null,'subtable');
        $this->required = $this->session->GameData(null,'required');
        
        //Lijst
        $this->sublist = array();
        $subtable = $this->subtable;
        $query = $this->mysql->query("SELECT * FROM $subtable ORDER BY n");
        while($sub = $query->fetch_assoc())
            {
            $this->sublist[$sub['id']] = $sub;
            $this->sublist[$sub['id']]['user'] = new User(intval($sub['id']),$mysql,$session);
            }
        }
    
    public function sublist()
        {
        return $this->sublist;
        }
    
    public function required()
        {
        return $this->required;
        }

    public function addSub($user,$type)
        {
        $subtable = $this->subtable;
        $user = new User($user,$this->mysql);
        $id = $user->id;
        if ($user->rating >= $this->required and !in_array($id,array_keys($this->sublist)))
            {
            $this->mysql->query("INSERT INTO $subtable (id, type) VALUES ($id, '$type')");
            }
        else
            return false;
        }
    
    public function removeSub($user)
        {
        $subtable = $this->subtable;
        $user = new User($user,$this->mysql);
        $id = $user->id;
        $this->mysql->query("DELETE FROM $subtable WHERE id=$id");
        }
    
    public function listSeq()
        {
        
        }
    }

Class Cookie
    {
    public function __get($name)
        {
        return $_COOKIE[$name];
        }
    
    public function  __set($name,$value)
        {
        setcookie($name,$value,time()+60*60*12);
        }
    }
    
?>