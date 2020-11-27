<?php
function get_server_ram_usage(){
    $USED=shell_exec("free -mt | grep Mem | awk '{print $4}'");
return $USED;
}
echo 'Server Memory Usage:' . get_server_memory_usage() ;
echo PHP_EOL;
?>
