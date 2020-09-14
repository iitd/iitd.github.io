

<?php
	
$file = 'lablog.html';

$Day=$Session=$Date=$TasksDone=$Issues="";

if ($_SERVER["REQUEST_METHOD"] == "POST" && ISSET($_POST["SUBMIT"])) {
  $Day = test_input($_POST["Day"]);
  $Session = test_input($_POST["Session"]);
  $Date = test_input($_POST["Date"]);
  $TasksDone = test_input($_POST["TasksDone"]);
  $Issues = test_input($_POST["Issues"]);


  $final_data= "<tr><th>".$Day."</th><th> ".$Session."</th> <th>".$Date."</th> <th>".$TasksDone."</th><th> ".$Issues."</th></tr> ";


file_put_contents($file, $final_data, FILE_APPEND | LOCK_EX);
header("Location:lablog.php");

}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

?>

<p> Thanks for providing us with valuable informations. have a good day !!! </p>