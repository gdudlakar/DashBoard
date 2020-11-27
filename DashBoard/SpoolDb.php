<?php
    $servername = "localhost";
    $username = "mykampai_AdminDashboard";
    $password = "AdminDashboard";
    $dbname = "mykampai_AdminDashboard";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    }
    echo "Connected successfully";
?>

<?php
$clients = ['aimglobal','andromeda','codebase','dotapp','dotodoor','fintranssolutions','hiranandani','ingram','letstalkcomm','mcloud','motherhoodhospital','oscorp','partner','pranaliconsultants','pym','stark','suntech','totuba','trial1','triggerworldwide','unicornready','websym','whitehorse','younion','zoozle','wizrdom','caps','tbj','mopharma','xencia','imthyderabad','swamisukhabodhananda'];

    $inserts = array();
    foreach($clients as $client){
        $spool_dir="/home/mykampaign/public_html/$client/app/spool/default/";

        if (file_exists($spool_dir)){
            $wc=shell_exec("ls $spool_dir | wc -l");
            $count=number_format($wc);
            if ($count >= 1) {
                $inserts[] = "('','$client','$count')";
            echo "Spool is $wc","\n";
            }
        }
        }
        $query = "INSERT INTO SpoolCount VALUES ". implode(", ", $inserts);
        echo "query = $query"; // for debugging purposes, remove this once it is working
        mysql_query($query) or die(mysql_error());
?>