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
// prepare and bind
$stmt = $conn->prepare("INSERT INTO SpoolCount (Client, wordCount) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $Clients, $Count, $email);

// set parameters and execute
$Clients = "John";
$Count = 43;
$stmt->execute();

$Clients = "Mary";
$Count = 41;
$stmt->execute();

$Clients = "Julie";
$Count = 37;

$stmt->execute();

echo "New records created successfully";

$stmt->close();
$conn->close();
?>

Z=`awk '/\#define Z/ {print $3}' /usr/include/asm-generic/param.h`
CPUS=`grep ^proc /proc/cpuinfo | wc -l`
NUM1=`cat /proc/stat | awk '/^cpu / {print $5}'`
sleep 1
NUM2=`cat /proc/stat | awk '/^cpu / {print $5}'`
USED=`echo 4 k 100 $NUM2 $NUM1 - $CPUS $Z \* / 100 \* - p | dc`

$Z=shell_exec("awk '/\#define Z/ {print $3}' /usr/include/asm-generic/param.h");
$CPUS=shell_exec("grep ^proc /proc/cpuinfo | wc -l");
$NUM!=shell_exec("cat /proc/stat | awk '/^cpu / {print $5}'");
sleep (1);
$NUM2=shell_exec("cat /proc/stat | awk '/^cpu / {print $5}'");
$USED=shell_exec("echo 4 k 100 $NUM2 $NUM1 - $CPUS $Z \* / 100 \* - p | dc");