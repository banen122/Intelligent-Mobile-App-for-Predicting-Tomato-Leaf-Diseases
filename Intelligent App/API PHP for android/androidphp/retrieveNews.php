
<?php 

require_once"conn.php";

$result = array();
$result['notification'] = array();
$select= "SELECT * from notification ORDER BY datetime DESC LIMIT 5";
$responce = mysqli_query($conn,$select);

while($row = mysqli_fetch_array($responce))
    {
        $index['news_id']= $row['0'];
        $index['topic']= $row['1'];
        $index['info']= $row['2'];
        $index['datetime']= $row['3'];
        array_push($result['notification'], $index);
    }
        
        $result["success"]="1";
        echo json_encode($result);
        mysqli_close($conn);

?>

<?php 
