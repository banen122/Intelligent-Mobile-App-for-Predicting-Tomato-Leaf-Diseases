<?php
if(isset($_POST['farmer_name'])&&isset($_POST['subject'])&&isset($_POST['info'])){
    
$server="localhost";
$username="root";
$password="";
$database="mobileintelligent";
$conn=new mysqli($server,$username,$password,$database);

if($conn->connect_error){
    die("connection failed:". $conn->connect_error);
}


    $farmer_name=$_POST['farmer_name'];
    $subject=$_POST['subject'];
    $info=$_POST['info'];
    $timezone=new DateTime("now", new DateTimeZone('Asia/Baghdad') );
    $date = $timezone->format('Y-m-d h:i:s');

     $sql="INSERT INTO farmermessage(`farmer_name`,`subject`,`topic`,`datetime`)
     VALUES ('$farmer_name','$subject','$info','$date')";
    
    if(!$conn->query($sql)){
        echo "failure";
     }
    else{
       echo"success";
     }
    

}


?>