<?php
if(isset($_POST['id_farmer'])&&isset($_POST['farm_name'])&&isset($_POST['location'])&& isset($_POST['space'])){
    require_once "conn.php";

    $id_farmer=($_POST['id_farmer']);
    $farm_name=($_POST['farm_name']);
    $space=($_POST['space']);
    $location=($_POST['location']);

    
        $sql="insert into farm values('', '$id_farmer','$farm_name','$location','$space')";
    
        if(!$conn->query($sql)){
            echo "failure";
        }
        else{
            echo"success";
        }
    

}

?>