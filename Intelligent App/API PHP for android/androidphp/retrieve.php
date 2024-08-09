
<?php 

    require_once"conn.php";
	if(isset($_POST['id_farmer'])){
	$id_farmer=$_POST['id_farmer'];
	$result = array();
	$result['image'] = array();
	$select= "SELECT date from image where farmer_id=$id_farmer ORDER BY date DESC LIMIT 10";
	$responce = mysqli_query($conn,$select);
	
	while($row = mysqli_fetch_array($responce))
		{
			$index['date']= $row['0'];
			array_push($result['image'], $index);
		}
			
			$result["success"]="1";
			echo json_encode($result);
			mysqli_close($conn);
	}
	else{
		echo"error";
	}


?>
