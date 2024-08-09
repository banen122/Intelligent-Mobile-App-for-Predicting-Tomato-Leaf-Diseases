<?php
if(isset($_POST['farmer_name'])&&isset($_POST['phone_token'])){
    
$server="localhost";
$username="root";
$password="";
$database="mobileintelligent";
$conn=new mysqli($server,$username,$password,$database);

if($conn->connect_error){
    die("connection failed:". $conn->connect_error);
}


    $farmer_name=$_POST['farmer_name'];
    $token=$_POST['phone_token'];


    $select = mysqli_query($conn, "SELECT * FROM token WHERE farmer_name = '$farmer_name' and phone_token='$token'");
    if (mysqli_num_rows($select)) {
        echo"exists in databse";
    } else {
        $sql="insert into token values('','$token','$farmer_name')";
    
        if(!$conn->query($sql)){
            echo "failure";
        }
        else{
            echo"success";
        }
    } 

}


?>