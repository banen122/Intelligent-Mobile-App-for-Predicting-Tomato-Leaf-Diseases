
<?php 
require_once"conn.php";

if(isset($_POST['farmer_name'])){
 $farmer_name=$_POST['farmer_name'];
 
$result = array();
$result['farmer'] = array();
$select= "SELECT id_farmer from farmer where farmer_name='$farmer_name'";
$responce = mysqli_query($conn,$select);

while($row = mysqli_fetch_array($responce))
    {
        $index['id_farmer']= $row['0'];
        array_push($result['farmer'], $index);
    }
        
        $result["success"]="1";
        echo json_encode($result);
        mysqli_close($conn);

}
?>

<?php 
