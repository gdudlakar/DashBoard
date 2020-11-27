<?php
$clients = ['aimglobal','andromeda','codebase','dotapp','dotodoor','fintranssolutions','hiranandani','ingram','letstalkcomm','mcloud','motherhoodhospital','oscorp','partner','pranaliconsultants','pym','stark','suntech','totuba','trial1','triggerworldwide','unicornready','websym','whitehorse','younion','zoozle','wizrdom','caps','tbj','mopharma','xencia','imthyderabad','swamisukhabodhananda'];

foreach($clients as $client){
    $spool_dir="/home/mykampaign/public_html/$client/app/spool/default/";
        $directory = '/home/mykampaign/etc/';

    if (file_exists($spool_dir)){
    foreach (scandir($spool_dir) as $file) {
        if ($file !== '.' && $file !== '..') {
            $files[] = $file;
            echo shell_exec("ls $spool_dir | wc -l");
            echo "the size of $spool_dir";
        }
    }
    }
}
?>



