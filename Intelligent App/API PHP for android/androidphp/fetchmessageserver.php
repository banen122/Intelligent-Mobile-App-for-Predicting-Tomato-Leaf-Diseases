
<?php 

require_once"conn.php";
if(isset($_POST['farmer_name'])){
$farmer_name=$_POST['farmer_name'];
$result = array();
$result['servermessage'] = array();
$select= "SELECT datetime,message from servermessage where farmer_name='$farmer_name' ORDER BY datetime DESC LIMIT 5";
$responce = mysqli_query($conn,$select);

if($responce){
while($row = mysqli_fetch_array($responce))
    {
        $index['datetime']= $row['0'];
        $index['message']= $row['1'];
        array_push($result['servermessage'], $index);
    }
        
        $result["success"]="1";
        echo json_encode($result);
        mysqli_close($conn);
}
}
else{
    echo"error";
}


?>
