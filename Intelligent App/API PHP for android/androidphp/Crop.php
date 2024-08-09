<?php
if(isset($_POST['farm_id'])&&isset($_POST['crop_name'])&&isset($_POST['type'])&& isset($_POST['state'])){
    require_once "conn.php";

    $farm_id=$_POST['farm_id'];
    $crop_name=($_POST['crop_name']);
    $type=($_POST['type']);
    $state=($_POST['state']);

    
        $sql="insert into crop values('',$farm_id,'$crop_name','$type','$state')";
    
        if(!$conn->query($sql)){
            echo "failure";
        }
        else{
            echo"success";
        }
    

}
else{
    echo"error";
}

?>