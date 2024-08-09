
<?php

 $conn = mysqli_connect("localhost","root","","mobileintelligent") or die("Error " . mysqli_error($connection));

$result = array();
	$result['cliniccenter'] = array();
	$sql= "select * from cliniccenter";
	$responce = mysqli_query($conn,$sql);

    while($row = mysqli_fetch_array($responce))
		{
			$index['clinic_name']= $row['1'];
            $index['Email']= $row['2'];
            $index['location']= $row['3'];
            $index['specialization_type']= $row['4'];
            $index['work_time']= $row['5'];
            $index['phone_number']= $row['6'];

			array_push($result['cliniccenter'], $index);
		}
			
			echo json_encode($result);
			
    mysqli_close($conn);
    ?>