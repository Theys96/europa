var Europa = {
	mapSettings: {
		backgroundColor: '#224466',
        zoomButtons: false,
        onRegionClick: function(event, code) {Europa.selectCode(code);},
        regionStyle: {selected: {fill: 'white'}}
		},
	code: "",
	codeView: "#selectedRegion",
	playerView: "#playerView",
	settingsView: "#settingsView",
	isSelecting: false
	}

Europa.initMap = function (loc, map) {
	Europa.loc = loc;
	
	$.getJSON("server.php?map=" + map + "&action=getMapInfo", function (data) {
		Europa.mapInfo = data;
		Europa.mapName = Europa.mapInfo['name'];
		
		var settings = Europa.mapSettings;
		settings.map = Europa.mapInfo['map'];
		settings.container = $(loc);
		$.getJSON("server.php?map=" + Europa.mapName + "&action=getMapColors", function (data) {
			settings.series = {regions: [data]};
			Europa.map = new jvm.Map(settings);
			});
		$.getJSON("server.php?map=" + Europa.mapName + "&action=getRegions", function (data) {
			Europa.regions = data;
			});
		$.get("server.php?action=getUsername", function (name) {
			Europa.player = name;
			});
		});
	}

Europa.setCodeView = function (loc) {
	this.codeView = loc;
	}

Europa.selectCode = function (c) {
	if (Europa.selecting) {
		if (Europa.selecting.indexOf(c) >= 0) {
			Europa.targetRegion = c;
			Europa.deselectRegions();
			Europa.showArmyView();
			return;
			}
		}
	Europa.code = c;
	Europa.deselectRegions();
	$("#selectedRegion").slideUp(500, function () {
		$(".controlView").slideUp(500)
		$(Europa.codeView + "Neigh").html("");
		$.getJSON("server.php?map=" + Europa.mapName + "&action=getNeighbors&region=" + Europa.code, function (data) {
			if (Europa.regions[Europa.code][3] == Europa.player) {
				var neighbors = "<table class='listTable'><thead><tr><td></td><td><img src='media/img/att.png' class='icon' /></td><td><img src='media/img/def.png' class='icon' /></td><td></td></tr></thead>";
				$.each(data, function (regionCode, regionName) {
					neighbors += "<tr><td><a href='javascript:Europa.selectCode(\"" + regionCode + "\")'>" + regionName + "</a></td><td>0</td><td>0</td><td style='border: none; width: 0;'><img src='media/img/cancel.png' class='icon' /></td></tr>";
					});
				} else {
				var neighbors = "<table class='listTable'>";
				$.each(data, function (regionCode, regionName) {
					neighbors += "<tr><td><a href='javascript:Europa.selectCode(\"" + regionCode + "\")'>" + regionName + "</a></td></tr>";
					});
				}
			neighbors += "</table>";
			$(Europa.codeView + "Neigh").html(neighbors);
			$(Europa.codeView).slideDown(500);
			});
		$(Europa.codeView + "Name").html(Europa.regions[Europa.code][0]);
		$(Europa.codeView + "Worth").html(Europa.regions[Europa.code][1]);
		$(Europa.codeView + "Trade").html(Europa.regions[Europa.code][2]);
		$(Europa.codeView + "Owner").html("<a href='javascript:Europa.showPlayer(\"" + Europa.regions[Europa.code][3] + "\")'>" + Europa.regions[Europa.code][3] + "</a>");
		$(Europa.codeView + "Army").html(Europa.regions[Europa.code][4]);
		if (Europa.regions[Europa.code][3] == Europa.player) {
			$(".regionOwnerControls").show();
			} else {
			$(".regionOwnerControls").hide();
			}
		});
	}

Europa.showPlayer = function (username) {
	function putInTable(data, striketru) {
		var table = "<table class='listTable'>";
		$.each(data, function (name, id) {
			if (striketru == true) {
				table += "<tr><td><strike><a href='javascript:Europa.showPlayer(\"" + name + "\")'>" + name + "</a></strike></td></tr>";
				} else {
				table += "<tr><td><a href='javascript:Europa.showPlayer(\"" + name + "\")'>" + name + "</a></td></tr>";
				}
			});
		table += "</table>";
		return table;
		}
	
	Europa.deselectRegions();
	
	$(Europa.playerView).slideUp(500, function () {
		$(".controlView").slideUp(500)
		$.getJSON("server.php?map=" + Europa.mapName + "&action=getPlayer&player=" + username, function (data) {
			$(Europa.playerView + "Username").html(data[0] + (Europa.player == data[0] ? "<a href='javascript:Europa.showSettings()'><img style='float: right; height: 1.1em' src='media/img/tools.png'></a>" : ""));
			$(Europa.playerView + "Name").html(data[1]);
			$(Europa.playerView + "Color").css("background-color", data[2]);
			
			$(Europa.playerView + "Allies").html(putInTable(data[3]['ally']) + putInTable(data[3]['pending-ally'], true));
			$(Europa.playerView + "Trade").html(putInTable(data[3]['trade']) + putInTable(data[3]['pending-trade'], true));
			
			$(Europa.playerView + "Img").attr('src', data[4]);
			
			$(Europa.playerView).slideDown(500);
			});
		});
	}

Europa.showSettings = function () {
	Europa.deselectRegions();
	
	$(Europa.settingsView).slideUp(500, function () {
		$(".controlView").slideUp(500)
		
		$.getJSON("server.php?map=" + Europa.mapName + "&action=getPlayer", function (data) {
			$(Europa.settingsView + "Username").html(data[0]);
			$(Europa.settingsView + "Name").val(data[1]);
			$(Europa.settingsView + "ColorBackground").css("background-color", data[2]);
			$(Europa.settingsView + "Color").val(data[2]);
			$(Europa.settingsView + "ImgPreview").attr('src', data[4]);
			$(Europa.settingsView + "Img").val(data[4]);
			$(Europa.settingsView + "Mail").val(data[5]);
			});
		
		$(Europa.settingsView).slideDown(500);
		});
	}

Europa.updateSettings = function () {
	$.post("server.php", {
		map: Europa.mapName,
		action: "updateSettings",
		img: $(Europa.settingsView + "Img").val(),
		name: $(Europa.settingsView + "Name").val(),
		color: $(Europa.settingsView + "Color").val(),
		mail: $(Europa.settingsView + "Mail").val()
		}).done(function (data) {
			Europa.refresh();
			});
	}

Europa.showArmyView = function () {
	$("#armytarget").html(Europa.regions[Europa.targetRegion][0]);
	$("#moveArmies").slideDown(500);
	$("#army").val(0);
	}

Europa.logout = function () {
	$.get("server.php?action=logout", function() {
		Europa.refresh();
		});
	}

Europa.deselectRegions = function () {
	Europa.map.clearSelectedRegions();
	Europa.selecting = false;
	$("#moveArmies").slideUp(500);
	}

Europa.selectAttackableRegions = function () {
	Europa.isSelecting = true;
	Europa.deselectRegions();
	$.getJSON("server.php?map=europa&action=getAttackOptions&region=" + Europa.code, function (regions) {
		Europa.map.setSelectedRegions(regions);
		Europa.selecting = regions;
		Europa.selectType = "attack";
		$("#moveArmies").css("border", "2px solid #EE0022");
		});
	}

Europa.selectAidableRegions = function () {
	Europa.isSelecting = true;
	Europa.deselectRegions();
	$.getJSON("server.php?map=europa&action=getAidOptions&region=" + Europa.code, function (regions) {
		Europa.map.setSelectedRegions(regions);
		Europa.selecting = regions;
		Europa.selectType = "aid";
		$("#moveArmies").css("border", "2px solid #00CC66");
		});
	}

Europa.moveArmies = function () {
	if (Europa.selectType == "attack") {
		alert(Europa.regions[Europa.code][0] + " valt " + Europa.regions[Europa.targetRegion][0] + " aan met " + $("#army").val() + " mannen.");
		}
	if (Europa.selectType == "aid") {
		alert(Europa.regions[Europa.code][0] + " ondersteunt " + Europa.regions[Europa.targetRegion][0] + " met " + $("#army").val() + " mannen.");
		}
	Europa.deselectRegions();
	}

Europa.refresh = function () {window.location = window.location;};

$(function() {
	$(".controlView").hide();
	$(".regionOwnerControls").hide();
	});