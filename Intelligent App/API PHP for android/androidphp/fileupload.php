<?php
$conn=mysqli_connect("localhost","root","");
mysqli_select_db($conn,"mobileintelligent");

$id_farmer=$_POST['id_farmer'];

$q=("SELECT farmer_name FROM `farmer` where id_farmer ='$id_farmer'");
   $r=mysqli_query($conn,$q);
   $row = mysqli_fetch_row($r);
   $pa="C:\Users\Ali\Desktop\\fetch\\$row[0].txt";

   if(file_exists($pa))
   {
	file_put_contents($pa,"");       
   }
  
   if(file_exists($pa)!=true)
{
   $open_text=fopen($pa,"w");    
}

	   $img=$_POST['upload'];

                   $filename="IMG".rand().".jpg";
	   file_put_contents("images/".$filename,base64_decode($img));

	   $upload_path='images/';
	   $server_ip=gethostbyname(gethostname());
	   $upload_url='http://'.$server_ip.'/androidphp/'.$upload_path.'/'.$filename;

			$qry="INSERT INTO image(`image_name`,`path`,`farmer_id`)
			      VALUES ('$filename','$upload_url','$id_farmer')";

			$res=mysqli_query($conn,$qry);
			
			if($res==true)
			 echo "File Uploaded Successfully";
			else
			 echo "Could not upload File";


$inputDir  = "D:\\xampp\htdocs\\androidphp\\getdiagoses";
$command = "matlab -nosplash -nodesktop -nojvm -minimize -sd "    .$inputDir.    " -r getdiagoses('".$upload_url."','".$pa."')";
exec($command);
?>


