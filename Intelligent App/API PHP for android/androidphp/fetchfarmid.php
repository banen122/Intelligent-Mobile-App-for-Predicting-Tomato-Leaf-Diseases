
<?php 
require_once"conn.php";

if(isset($_POST['farmer_id'])){
 $id_farmer=$_POST['farmer_id'];
 
$result = array();
$result['farm'] = array();
$select= "SELECT farm_id from farm where farmer_id='$id_farmer'";
$responce = mysqli_query($conn,$select);

while($row = mysqli_fetch_array($responce))
    {
        $index['farm_id']= $row['0'];
        array_push($result['farm'], $index);
    }
        
        $result["success"]="1";
        echo json_encode($result);
        mysqli_close($conn);

}
else{
    echo"error";
}
?>

<?php 