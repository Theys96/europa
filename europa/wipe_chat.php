<?php
file_put_contents('chat/chat_'.date("d-m-y").'.txt',file_get_contents('../chat/log.html'));
file_put_contents('chat/log.html','');
?>