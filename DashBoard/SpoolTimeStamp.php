<?php
$clients = ['aimglobal','andromeda','codebase','dotapp','dotodoor','fintranssolutions','hiranandani','ingram','letstalkcomm','mcloud','motherhoodhospital','oscorp','partner','pranaliconsultants','pym','stark','suntech','totuba','trial1','triggerworldwide','unicornready','websym','whitehorse','younion','zoozle','wizrdom','caps','tbj','mopharma','xencia','imthyderabad','swamisukhabodhananda'];

function sendmail(){
    $msg = "Mcloud: File Exits in Spool from 24 hours";
    mail("guru@augplat.com","Spool Checker",$msg);
    mail("gdudalkar@gmail.com","Spool Checker",$msg);
}
function date_time_diff($file_date_time){
    $current_date_time = date('Y-m-d h:i:s');
    $date1 = strtotime($file_date_time);  
    $date2 = strtotime($current_date_time); 
  
    // Formulate the Difference between two dates 
    $diff = abs($date2 - $date1); 
    $years = floor($diff / (365*60*60*24));
    $months = floor(($diff - $years * 365*60*60*24) / (30*60*60*24));  
    $days = floor(($diff - $years * 365*60*60*24 -$months*30*60*60*24)/ (60*60*24));
    $hours = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24 - $days*60*60*24) / (60*60));
    $minutes = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24 - $days*60*60*24 - $hours*60*60)/ 60);
    $seconds = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24 - $days*60*60*24 - $hours*60*60 - $minutes*60)); 
            
    if($days > 0 || $months > 0 ||$years > 0 ){
        return true;
    }   
    return false;
}
foreach($clients as $client){
    $spool_dir="/home/mykampaign/public_html/$client/app/spool/default/";
if (file_exists($spool_dir)){
                 try{
    $iterator = new FilesystemIterator($spool_dir);
    foreach($iterator as $fileInfo){
        if($fileInfo->isFile()){
            $cTime = new DateTime();
            $cTime->setTimestamp($fileInfo->getCTime());
            date_time_diff($cTime->format('Y-m-d h:i:s'));
        }
    }
}catch (Exception $e) {
     echo 'Caught exception: ',  $e->getMessage(), "\n";
}
    sleep(5);
}
}
?>
