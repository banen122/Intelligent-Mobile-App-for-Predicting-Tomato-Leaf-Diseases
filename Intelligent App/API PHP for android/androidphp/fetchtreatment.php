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

  

   $resulttreat['treatment'] = array();
   $sql2= "SELECT treatment_name,instruction,discription from treatment WHERE treatment_id=$last_line";
   $responcetreat = mysqli_query($conn,$sql2);

   while($rowt = mysqli_fetch_array($responcetreat))
       {
           $indext['treatment_name']= $rowt['0'];
           $indext['instruction']= $rowt['1'];
           $indext['discription']= $rowt['2'];
           array_push($resulttreat['treatment'], $indext);
       }
           echo json_encode($resulttreat);
        }
        else{
            echo"error";
        }
            ?>