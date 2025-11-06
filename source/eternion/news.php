<?php 

	// Create connection
	$conn = new mysqli($msql_s, $mysql_u, $mysql_p, $mysql_db);
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 
		$sql = "SELECT title, author, date,text FROM news";
		$result = $conn->query($sql);
		if ($result->num_rows > 0) {
			// output data of each row
			while($row = $result->fetch_assoc()) {
				echo'<div class="box">';
				echo'<div class="title">'.$row["date"].' - <span>'.$row["title"].'</span><font class="author">Posted by : <font color="#5885dd">'.$row["author"].'</font></font></div>';
				echo'<div class="body">';
				echo''.$row["text"].'';
				echo'</div>';
				echo'<div class="bottom"></div>';
				echo'</div>';
				echo $row["date"];
				 }
		}
		else 
		{
			echo "ERROR NO NEWS";
		}
	$conn->close();
?>
