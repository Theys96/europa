<?php
require "regions.class.php";
require "userbase.class.php";

Class Europa {
	
	private $db;
	private $ub;
	private $map;
	public $user;
	public $regions;
	
	function __construct(Mysqli $con) {
		$this->db = $con;
		$this->ub = new UserBase($this->db);
		
		$this->user = new User($this->db);
		if (isset($_SESSION['user'])) {
			$this->user = new User($this->db, $_SESSION['user']);
			}
		}
	
	function isLoggedIn() {
		return ($this->ub->getUser() != null || $this->ub->isGuest());
		}
	
	function setMap($name) {
		$query = $this->db->query("SELECT * FROM maps WHERE name='" . $name . "'");
		if ($query->num_rows > 0) {
			$this->map = $query->fetch_assoc();
			$this->regions = new Regions($this->db, $this->getMapInfo('id'));
			}
		}
	
	function mapSet() {
		return ($this->map != null);
		}
	
	function getMapInfo($val) {
		if (isset($val)) {
			return $this->map[$val];
			}
		return $this->map;
		}
	
	function isAuth() {
		return (!$this->user->isGuest() || $_SESSION['gast'] == "true");
		}
	
	function getPlayers() {
		$players = array();
		
		$query = $this->db->query("SELECT users.username, players.color FROM users, players WHERE users.id = players.playerId AND map = " . $this->getMapInfo('id'));
		while ($row = $query->fetch_assoc()) {
			$players[$row['username']] = $row['color'];
			}
			
		return $players;
		}
	
	function valPassword($pass) {
		return (strlen($pass) > 3);
		}
	
	function valUsername($name) {
		return ctype_alnum($name);
		}
	
	function registerUser($user, $pass, $name, $mail) {
		return ($this->ub->registerUser($user, $pass, $name, $mail));
		}
	
	}
?>