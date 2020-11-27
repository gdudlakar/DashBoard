<?php
$clients = ['aimglobal','andromeda','codebase','dotapp','dotodoor','fintranssolutions','hiranandani','ingram','letstalkcomm','mcloud','motherhoodhospital','oscorp','partner','pranaliconsultants','pym','stark','suntech','totuba','trial1','triggerworldwide','unicornready','websym','whitehorse','younion','zoozle','wizrdom','caps','tbj','mopharma','xencia','imthyderabad','swamisukhabodhananda'];
foreach( $clients as $dir )
{
$filename = $spool_dir="/home/mykampaign/public_html/$dir/app/spool/default/";;

if (file_exists($filename)) {
    echo "The file $filename exists";
} else {
    echo "The file $filename does not exist";
}
}
?>

