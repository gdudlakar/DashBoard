<?php

//Webhook Process
include('Clients.php');
$job = 'mautic:webhooks:process';
for($i =0;$i<sizeof($clients);$i++){
    $command = 'php '.$path.$clients[$i].'/app/console '.$job;
    shell_exec($command);
    sleep(5);
}
exit();

?>