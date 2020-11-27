<?php
require 'DBConnect.php';

$Percent=shell_exec("df -h |grep /dev/vda1  | awk '{ print $5 }' ");
$Aavailable=shell_exec("df -h |grep /dev/vda1  | awk '{ print $4 }'");
$USED=shell_exec("df -h |grep /dev/vda1  | awk '{ print $3 }'");

$sql = "INSERT INTO Disk (Used,Avail,Percentage)
VALUES ({$USED},{$Aavailable},{$Percent})";

if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
}
 else 
 {
  echo "Error: " . $sql . " " . $conn->error;
}

$conn->close();
?>
