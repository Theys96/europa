$('document').ready(function() 
    {
    $('#repeatpassword, #mail, #registeruser, #registerpass, #registername').hide();
    setTimeout(function() 
        {
        $('#err').fadeOut(2000);
        },5000)
    });

function animation()
    {
    $('#logo, #login').hide();
    $('#logo').css({marginTop: '200px'});
    $('#logo').fadeIn(2000, function() 
        {
        $('#logo').animate({marginTop: '10px'}, {duration: 1500, queue: false});
        $('#login').fadeIn({duration: 1500, queue: false}); 
        });
    }

function guestLogin()
    {
    $('#username, #password, #repeatpassword, #mail, #registeruser, #registerpass, #registername').hide('slow');
    $('#session').show('slow');
    $('#user').val('gast');
    $('#pass').val('gast');
    }

function login()
    {
    $('#repeatpassword, #mail, #registeruser, #registerpass, #registeruser, #registerpass, #registername').hide('slow');
    $('#username, #password, #session').show('slow');
    $('#user').val('');
    $('#pass').val('');
    }
    
function register()
    {
    $('#session, #username, #password').hide('slow');
    $('#repeatpassword, #mail, #registeruser, #registerpass, #registername').show('slow');
    $('#user').val('');
    $('#pass').val('');
    }

function placeData(data)
    {
    $('#info').slideUp(300, function() {
        $('#info').html(data);
        $('#info').slideDown(300);
        });
    }

function placeRegionData(code)
    {
    $.get('code/server.php?getinfo='+code, placeData);
    }

function placeUserData(id)
    {
    $.get('code/server.php?player='+id, placeData);
    }

function placeSubs()
    {
    $.get('code/server.php?subs=true', placeData);
    }

function placeSettings()
    {
    $.get('code/server.php?settings=true', placeData);
    }

function placeMoney()
    {
    $.get('code/server.php?getmoney=true', function( data ) {
            $('#money').html( data );
            });
    }
    
//Game functions

function move(from,to)
    {
    q = prompt("Hoeveelheid: ");
    $.post('code/server.php', {actiontype: 'move',from: from, to: to, q: q}).done(function( data ) 
        {
        alert( data );
        placeRegionData(from);
        });
    }
    
function attack(from,to)
    {
    q = prompt("Hoeveelheid: ");
    $.post('code/server.php', {actiontype: 'attack',from: from, to: to, q: q}).done(function( data ) 
        {
        alert( data );
        placeRegionData(from);
        });
    }

function recruit(object,region)
    {
    q = parseInt(prompt("Hoeveelheid: "));
	if (object.alt == 'min') {q = -q;}
	$.post('code/server.php', {actiontype: 'recruit',region: region,q: q}).done(function( data ) 
        {
        alert( data );
        placeRegionData(region);
        });
    placeMoney();
	}

function bg(player,bg)
    {
    $.post('code/server.php', {actiontype: 'bg',player: player,bg: bg}).done(function( data ) 
        {
        alert( data );
        placeUserData(bg);
        });
    }

function trade(player,trade)
    {
    $.post('code/server.php', {actiontype: 'trade',player: player,trade: trade}).done(function( data ) 
        {
        alert( data );
        placeUserData(trade);
        });
    placeMoney();
    }

function addSub(player)
    {
    $.get('code/server.php?addsub=' + player);
    placeSubs();
    }

function delSub(player)
    {
    $.get('code/server.php?delsub=' + player);
    placeSubs();
    }

function inviteSub(player)
    {
    $.get('code/server.php?invitesub=' + player);
    placeSubs();
    }

function showHelp()
    {
    $('#gamehelp').remove();
    $('body').prepend("<div id='gamehelp'>Aan het laden...</div>");
    $('#gamehelp').hide();
    $.get('files/help.html', function( data ) {
            $('#gamehelp').html( data );
            $('#gamehelp').fadeIn('slow');
            });
    }

function hideHelp()
    {
    $('#gamehelp').fadeOut('slow', function () {
        $('#gamehelp').remove();
    });
    }

function countDown()
    {
    function secondsToHms(d) {
    d = Number(d);
    var h = Math.floor(d / 3600);
    var m = Math.floor(d % 3600 / 60);
    var s = Math.floor(d % 3600 % 60);
    return ((h > 0 ? h + ":" : "") + (m > 0 ? (h > 0 && m < 10 ? "0" : "") + m + ":" : "0:") + (s < 10 ? "0" : "") + s); }
    
    function getTimeInSeconds() {
    now = new Date();
    midnight = new Date(
        now.getFullYear(),
        now.getMonth(),
        now.getDate(),
        0,0,0);
    return (now.getTime() - midnight.getTime())/1000; }

    count = getTimeInSeconds();
    console.log(count);
    setInterval(function() 
        {
        count += 1;
        console.log(count);
        if (down - count > 0)
            $('#countdown').text(secondsToHms(down - count));
        else
            location.reload();
        }, 1000);
    
    var index;
    var process = [60*60*18,60*60*24];
    for (index = 0; index < process.length; index++) 
        {
        if (count < process[index])
            {
            down = process[index];
            break;
            }
        }
    }

function submitSettings()
    {
    $.post("server.php",$("#settingsform").serialize());
    placeSettings();
    }



    
    