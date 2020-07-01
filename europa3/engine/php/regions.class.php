<?php
function numFormat($num) {
	return number_format($num);
	}

function percentageFormat($num) {
	return number_format($num, 1) . " %";
	}

Class Region {
	
	private $id;
	private $db;
	private $code;
	
	function __construct(Mysqli $con, $mapID, $code) {
		$this->id = $mapID;
		$this->db = $con;
		$this->code = $code;
		}
	
	function getNeighbors() {
		$query = $this->db->query("SELECT regions.code, regions.name FROM (SELECT region_neighbors.region1 + region_neighbors.region2 - regions.id AS id FROM region_neighbors, regions WHERE regions.code = '" . $this->code . "' AND (region_neighbors.region1 = regions.id OR region_neighbors.region2 = regions.id)) neigh, regions WHERE regions.id = neigh.id AND regions.map = " . $this->id);
		$out = array();
		while ($row = $query->fetch_assoc()) {
			$out[$row['code']] = $row['name'];
			}
		return $out;
		}
	
	function getAttackOptions($ownerID) {
		$query = $this->db->query("SELECT regions.id, regions.code FROM (SELECT region_neighbors.region1 + region_neighbors.region2 - regions.id AS id FROM region_neighbors, regions WHERE regions.code = '" . $this->code . "' AND (region_neighbors.region1 = regions.id OR region_neighbors.region2 = regions.id)) neigh, regions, region_states WHERE region_states.id = neigh.id AND regions.id = neigh.id AND region_states.owner != " . $ownerID . " AND regions.map = " . $this->id);
		$out = array();
		while ($row = $query->fetch_assoc()) {
			$out[] = $row['code'];
			}
		return $out;
		}
	
	function getAidOptions($ownerID) {
		$query = $this->db->query("SELECT regions.id, regions.code FROM (SELECT region_neighbors.region1 + region_neighbors.region2 - regions.id AS id FROM region_neighbors, regions WHERE regions.code = '" . $this->code . "' AND (region_neighbors.region1 = regions.id OR region_neighbors.region2 = regions.id)) neigh, regions, (SELECT r1.type, r1.player1, r1.player2, users.username FROM relations AS r1, relations AS r2, users WHERE r1.type = r2.type AND r1.type = 'ally' AND r1.player1 = r2.player2 AND r1.player2 = r2.player1 AND users.id = r1.player2 AND r1.player1 = " . $ownerID . ") allies, region_states WHERE region_states.id = neigh.id AND regions.id = neigh.id AND (region_states.owner = " . $ownerID . " OR region_states.owner = allies.player2) AND regions.map = " . $this->id);
		$out = array();
		while ($row = $query->fetch_assoc()) {
			$out[] = $row['code'];
			}
		return $out;
		}
	}

Class Regions {
	
	private $id;
	private $db;
	
	function __construct(Mysqli $con, $mapID) {
		$this->id = $mapID;
		$this->db = $con;
	}
	
	function getRegions() {
		$regions = array();
		
		$query = $this->db->query("SELECT regions.code, regions.name, regions.worth, regions.trade, users.username as owner, region_states.army FROM regions, region_states, users WHERE regions.id = region_states.id AND region_states.owner = users.id");
		while ($row = $query->fetch_assoc()) {
			$regions[$row['code']] = array($row['name'], numFormat($row['worth']), percentageFormat($row['trade']), $row['owner'], $row['army']);
			}
				
		return $regions;
		}
	
	function getOwners() {
		
		$owners = array();
		
		$query = $this->db->query("SELECT regions.code, users.username as owner FROM regions, region_states, users WHERE regions.id = region_states.id AND region_states.owner = users.id");
		while ($row = $query->fetch_assoc()) {
			$owners[$row['code']] = $row['owner'];
			}
		
		return $owners;
		
		}
	
	function getRegion($code) {
		return new Region($this->db, $this->id, $code);
		}
	}
?>