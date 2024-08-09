
<?php
    $conn = mysqli_connect("localhost","root","","mobileintelligent") or die("Error " . mysqli_error($connection));

    if(isset($_POST['id_farmer'])){
        $id_farmer=$_POST['id_farmer'];
    $q=("SELECT farmer_name FROM `farmer` where id_farmer ='$id_farmer'");
   $r=mysqli_query($conn,$q);
   $row = mysqli_fetch_row($r);
    $pa="C:\Users\Ali\Desktop\\fetch\\$row[0].txt";
  

    $i=0;
    $f=0;
    while($i<30)
   {
      if(trim(file_get_contents($pa))==false)
   {
       sleep(1);
       $i+=1;
   
   }
   else{
       $lines = file($pa);
       $last_line = $lines[count($lines)-1];
       $f=1;
       break;
   }
   
   
   }
   
   if ($f==0)
   {
   
       echo "cannot find text file";
   
   } 

  

   $result = array();
	$result['disease'] = array();
	$sql= "SELECT disease_name from disease WHERE disease_number=$last_line";
	$responce = mysqli_query($conn,$sql);

    while($row = mysqli_fetch_array($responce))
		{
			$index['disease_name']= $row['0'];
			array_push($result['disease'], $index);
		}
			
			echo json_encode($result);
			
    mysqli_close($conn);

}
    ?>