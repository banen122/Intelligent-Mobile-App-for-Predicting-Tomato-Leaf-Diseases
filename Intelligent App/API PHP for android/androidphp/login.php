<?php
if(isset($_POST['farmer_name'])&&isset($_POST['password'])){
    //check user exeist
    require_once "conn.php";
    require_once "validate.php";
    $password=validate($_POST['password']);
    $farmer_name=validate($_POST['farmer_name']);

    $sql="select * from farmer where password='$password' and farmer_name='$farmer_name'";
    $result=$conn->query($sql);
    if($result->num_rows>0){

        echo "success";

    }
    else{
        echo"failure";
    }
}

?>