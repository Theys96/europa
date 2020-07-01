<?php
$CRYPTSALT = '$1$europa_salt_change_this_for_redeployment$';

Class Player {
	
	private $db;
	private $data;
	private $map;
	
	function __construct(Mysqli $con, $username, $mapID) {
		$this->db = $con;
		$this->name = $con->real_escape_string($username);
		$this->map = $mapID;
		$query = $this->db->query("SELECT users.*, players.color FROM users, players WHERE users.id = players.playerId AND map = " . $this->map . " AND users.username = '" . $this->name . "'");
		if ($query->num_rows > 0) {
			$this->data = $query->fetch_assoc();
			}
		}
	
	function getInfo($confidential) {
		$d = $this->data;
		if ($confidential == true) {
			return array(
				$d['username'],
				$d['firstname'],
				$d['color'],
				$this->getRelations(),
				$d['pic'],
				$d['mail']
				);
			}
		return array(
			$d['username'],
			$d['firstname'],
			$d['color'],
			$this->getRelations(),
			$d['pic']
			);
		}
	
	function getRelations() {
		$relations = array('trade' => array(), 'ally' => array(), 'pending-trade' => array(), 'pending-ally' => array());
		
		$query = $this->db->query("SELECT r1.type, r1.player1, r1.player2, users.username FROM relations AS r1, relations AS r2, users WHERE r1.type = r2.type AND r1.player1 = r2.player2 AND r1.player2 = r2.player1 AND users.id = r1.player2 AND r1.player1 = " . $this->data['id']);
		while ($relation = $query->fetch_assoc()) {
			$relations[$relation['type']][$relation['username']] = intval($relation['player2']);
			}
		
		$query = $this->db->query("SELECT relations.*, users.username FROM relations, users WHERE users.id = relations.player2 AND player1 = " . $this->data['id']);	
		while ($relation = $query->fetch_assoc()) {
			if (!in_array($relation['player2'], $relations[$relation['type']])) {
				$relations['pending-' . $relation['type']][$relation['username']] = intval($relation['player2']);
				}
			}
		
		return $relations;
		}
	
	function updateProps($name, $pic, $color, $mail) {
		$this->db->query("UPDATE players SET color = '" . $this->db->real_escape_string($color) . "' WHERE playerId=" . $this->data['id']);
		$this->db->query("UPDATE users SET firstname='" . $this->db->real_escape_string($name) . "', mail='" . $this->db->real_escape_string($mail) . "', pic='" . $this->db->real_escape_string($pic) . "' WHERE id=" . $this->data['id']);
		}
	
	}

Class User {
	
	private $name;
	private $db;
	private $data;
	private $guest;
	
	function __construct(Mysqli $con, $username) {
		if ($username == null) {
			$this->guest = true;
			} else {	
			$this->guest = false;
			$this->db = $con;
			$this->name = $con->real_escape_string($username);
			
			$query = $this->db->query("SELECT * FROM users WHERE username='" . $this->name . "'");
			if ($query->num_rows > 0) {
				$this->data = $query->fetch_assoc();
				}
			}
		}
		
	function getProp($val) {
		if (!$this->isGuest()) {
			return $this->data[$val];
			}
		else {
			return "";
			}
		}
		
	function auth($password) {
		return ($this->getProp("password") == md5($password));
		}
	
	function isGuest() {
		return $this->guest;
		}
	
	}

Class UserBase {

	private $db;
	
	function __construct(Mysqli $con) {
		$this->db = $con;
		}
	
	function getUser($name) {
		if ($name == null) {
			
			}
		else {
			$user = new User($name);
			}
			
		return $user;
		}
	
	function isGuest() {
		return false;
		}
	
	function registerUser($user, $pass, $name, $mail) {
		$query = $this->db->query("SELECT * FROM users WHERE username='" . $user . "'");
		if ($query->num_rows > 0) return array("Gebruikersnaam bestaat al.", null);
		$this->db->query("INSERT INTO users (username, password, mail, firstname) VALUES ('" . $user . "', '" . md5($pass) . "', '" . $this->db->real_escape_string($mail) . "', '" . $this->db->real_escape_string($name) . "')");
		return array(null, "Account aangemaakt.");
		}
	
	}
?>