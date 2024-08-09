
<?php
$server="localhost";
$username="root";
$password="";
$database="mobileintelligent";
$conn=new mysqli($server,$username,$password,$database);

if($conn->connect_error){
    die("connection failed:". $conn->connect_error);
}

//query check
$sql = "SELECT DATE_FORMAT(datetime, '%Y%m%d%H%i') as datetime,news_id,topic,info FROM notification ORDER BY news_id DESC LIMIT 1";
$result = $conn->query($sql);
$row = $result->fetch_assoc();

echo "id:".$row['news_id']."topic:".$row['topic']."info:".$row['info']."date time:".$row['datetime'];
//current time
$timezone = new DateTime("now", new DateTimeZone('Asia/Baghdad') );
$current_time=$timezone->format('YmdHi');
$dataTimeDate=$row['datetime'];
//if current time equal data time
if ($current_time==date('YmdHi',strtotime($dataTimeDate))) {
  echo "New record created successfully and send notification to the app";

//firebase
function sendNotif ($to, $notif){
$apiKey='AAAApsxTuRE:APA91bH6DKO4iaUMSKPU5OSYrPQc-gth4_UAZ9cGh7kgm4oXxIJA9UcvzhnDc2AdZov7ONiEwumkOerPnJLMgZXZJZGhF8N4-3AsCn7pEMSw_W0XlZF2lOkKsWyKq5urz4PFRadqnby-';
    $feilds = array('to'=>$to, 'notification'=>$notif);

    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($feilds));
    
    $headers = array();
    $headers[] = 'Authorization: Key='.$apiKey;
    $headers[] = 'Content-Type: application/json';
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    
    $result = curl_exec($ch);
    if (curl_errno($ch)) {
        echo 'Error:' . curl_error($ch);
    }
    curl_close($ch);
}

$to = "/topics/plant";

$notification = array(
    'title' => $row['topic'],
    'body' => $row['info'],
    'sound'=>'default',
    'click_action'=>'abc'
);

sendNotif($to, $notification);
}

else {
    echo" notification have been sent for this news <br><br>";
  
  }
?>

