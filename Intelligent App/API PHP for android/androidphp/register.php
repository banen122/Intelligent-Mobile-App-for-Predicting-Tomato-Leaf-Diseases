<?php
if(isset($_POST['farmer_name'])&&isset($_POST['phone_number'])&&isset($_POST['password'])){
    require_once "conn.php";
    require_once "validate.php";
    $farmer_name=validate($_POST['farmer_name']);
    $phone_number=validate($_POST['phone_number']);
    $password=validate($_POST['password']);

    $select = mysqli_query($conn, "SELECT * FROM farmer WHERE farmer_name = '".$_POST['farmer_name']."'");
    if (mysqli_num_rows($select)) {
        echo"exists";
    } else {
        $sql="insert into farmer values('','$farmer_name','$phone_number','".md5($password)."')";
    
        if(!$conn->query($sql)){
            echo "failure";
        }
        else{
            echo"success";
        }
    } 

}


?>