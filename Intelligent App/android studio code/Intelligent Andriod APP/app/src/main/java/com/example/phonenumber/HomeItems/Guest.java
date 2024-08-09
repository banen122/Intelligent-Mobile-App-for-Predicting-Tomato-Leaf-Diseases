package com.example.phonenumber.HomeItems;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.Manifest;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.RetryPolicy;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.phonenumber.R;
import com.squareup.picasso.Picasso;
import com.theartofdev.edmodo.cropper.CropImage;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Guest extends AppCompatActivity {

    DrawerLayout drawerlayout;
    ImageView btMenu;
    RecyclerView recyclerView;
    static ArrayList<String> arrayList = new ArrayList<>();
    MainAdapterGuest adapter;

    public static void closeDrawer(DrawerLayout drawerlayout) {
        if (drawerlayout.isDrawerOpen(GravityCompat.START)) {
            drawerlayout.closeDrawer(GravityCompat.START);
        }
    }

    /*----------------------------------------------------------------------*/
    /*code for upload*/
    public ImageView pick;
    public Button btn_select;
    public Button btn_upload;
    public TextView tv;
    Bitmap imageBitmap;
    String guestidfarmer="144";
    public TextView tvdisease,tvtreatment,tvclniccenter;
    String guestname="guest";
    public static final int CAMERA_REQUEST = 100;
    public static final int STORAGE_REQUEST = 101;
    Global_variable global_variable=new Global_variable();

    String url=global_variable.ip+"/fileupload.php";
    private  String url2=global_variable.ip+"/fetchcliniccenter.php";
    public static String value = "";
    public static String value1,value2,value3,value4,value5,value6,value7,value8,value9,value10="";
    String cameraPermission[];
    String storagePermission[];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_guest);

        drawerlayout = findViewById(R.id.drawer_layout);
        btMenu = findViewById(R.id.bt_menu);
        recyclerView = findViewById(R.id.recycler_view);

        arrayList.clear();

        arrayList.add(getString(R.string.guest_home));
        arrayList.add(getString(R.string.guest_about));
        arrayList.add(getString(R.string.guest_logout));

        adapter = new MainAdapterGuest(this, arrayList);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setAdapter(adapter);
        btMenu.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerlayout.openDrawer(GravityCompat.START);
            }
        });

        /*----------------------------------------------------------------------*/
        /*code for upload*/
        cameraPermission = new String[]{Manifest.permission.CAMERA, Manifest.permission.WRITE_EXTERNAL_STORAGE};
        storagePermission = new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE};

        pick = findViewById(R.id.imageview);
        btn_select=findViewById(R.id.select);
        btn_upload=findViewById(R.id.upload);
        tvdisease=findViewById(R.id.disease);
        tvtreatment=findViewById(R.id.treatment);
        tvclniccenter=findViewById(R.id.cliniccenter);


        SharedPreferences sharedPref = getSharedPreferences("userid",MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putString("res",guestidfarmer);
        editor.putString("username",guestname);
        editor.apply();



        btn_select.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.M)
            @Override
            public void onClick(View view) {
                int picd = 0;
                if (picd == 0) {
                    if (!checkCameraPermission()) {
                        requestCameraPermission();
                    } else {
                        pickFromGallery();
                    }
                } else if (picd == 1) {
                    if (!checkStoragePermission()) {
                        requestStoragePermission();
                    } else {
                        pickFromGallery();
                    }
                }
            }
        });
        btn_upload.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                uploaddatatodb();
                Intent intent = new Intent(Guest.this, fetch_guest.class);
                startActivityForResult(intent, 2);
            }
        });

        pick.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.M)
            @Override
            public void onClick(View view) {
                int picd = 0;
                if (picd == 0) {
                    if (!checkCameraPermission()) {
                        requestCameraPermission();
                    } else {
                        pickFromGallery();
                    }
                } else if (picd == 1) {
                    if (!checkStoragePermission()) {
                        requestStoragePermission();
                    } else {
                        pickFromGallery();
                    }
                }
            }
        });

    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    private void requestStoragePermission() {
        requestPermissions(storagePermission, STORAGE_REQUEST);
    }

    private boolean checkStoragePermission() {
        boolean result = ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE) == (PackageManager.PERMISSION_GRANTED);
        return result;
    }

    private void pickFromGallery() {
        CropImage.activity().start(this);
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    private void requestCameraPermission() {
        requestPermissions(cameraPermission, CAMERA_REQUEST);
    }

    private boolean checkCameraPermission() {
        boolean result = ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) == (PackageManager.PERMISSION_GRANTED);
        boolean result1 = ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE) == (PackageManager.PERMISSION_GRANTED);
        return result && result1;
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == CropImage.CROP_IMAGE_ACTIVITY_REQUEST_CODE) {
            CropImage.ActivityResult result = CropImage.getActivityResult(data);
            if (resultCode == RESULT_OK) {
                Uri resultUri = result.getUri();
                Picasso.with(this).load(resultUri).into(pick);
                try {
                    imageBitmap = MediaStore.Images.Media.getBitmap(getContentResolver(), resultUri);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        if (requestCode == 2) {
            if(resultCode==RESULT_OK){

                value1=data.getStringExtra("message1");
                value2=data.getStringExtra("message2");
                value3=data.getStringExtra("message3");
                value4=data.getStringExtra("message4");


                tvdisease.setText("Disease Name==>"+value1);
                tvtreatment.setText("Treatment Name==>"+value2+"\n\nInstruction==>"+value3+"\n\nDiscription==>"+value4);
                tvclniccenter.setText("Clinic Center Name==>"+value5+"\nEmail==>"+value6+"\nLocation==>"+value7+"\nSpecialist==>"+value8+"\nWork Time==>"+value9+"\nPhone Number==>"+value10);

            }

        }

    }


    private void uploaddatatodb()
    {

        StringRequest request=new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response)
            {
                pick.setImageResource(R.drawable.insertimage);
                Toast.makeText(getApplicationContext(),response.toString(),Toast.LENGTH_LONG).show();}

        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(),error.toString(),Toast.LENGTH_LONG).show();
            }
        })
        {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError
            {

                Map<String,String> map=new HashMap<String, String>();
                map.put("upload",imageToString(imageBitmap));
                map.put("id_farmer",guestidfarmer);
                return map;
            }
        };



        RequestQueue queue= Volley.newRequestQueue(getApplicationContext());
        queue.add(request);

        StringRequest fetchclinicenter = new StringRequest(Request.Method.GET, url2, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.e("onResponse: ", response);
                try {

                    JSONObject jsonObject = new JSONObject(response);
                    JSONArray diseasearray = jsonObject.getJSONArray("cliniccenter");

                    for (int i = 0; i <diseasearray.length(); i++) {
                        JSONObject objectdisease = diseasearray.getJSONObject(i);
                        value5=objectdisease.getString("clinic_name");
                        value6=objectdisease.getString("Email");
                        value7=objectdisease.getString("location");
                        value8=objectdisease.getString("specialization_type");
                        value9=objectdisease.getString("work_time");
                        value10=objectdisease.getString("phone_number");
                    }

                }

                catch(Exception ex){
                    ex.printStackTrace();
                }

            }
        },new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });


        RequestQueue queueclnic= Volley.newRequestQueue(getApplicationContext());
        queueclnic.add(fetchclinicenter);


        request.setRetryPolicy(new RetryPolicy() {
            @Override
            public int getCurrentTimeout() {
                return 30000;
            }

            @Override
            public int getCurrentRetryCount() {
                return 30000;
            }

            @Override
            public void retry(VolleyError error) throws VolleyError {

            }

        });


    }


    private String imageToString(Bitmap bitmap) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, byteArrayOutputStream);
        byte[] imgBytes = byteArrayOutputStream.toByteArray();
        return Base64.encodeToString(imgBytes, Base64.DEFAULT);
    }


    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        switch (requestCode) {
            case CAMERA_REQUEST: {
                if (grantResults.length > 0) {
                    boolean camera_accepted = grantResults[0] == (PackageManager.PERMISSION_GRANTED);
                    boolean storage_accepted = grantResults[1] == (PackageManager.PERMISSION_GRANTED);
                    if (camera_accepted && storage_accepted) {
                        pickFromGallery();
                    } else {
                        Toast.makeText(this, "please enable camera and storage permission", Toast.LENGTH_SHORT).show();
                    }
                }

            }
            break;
            case STORAGE_REQUEST: {
                if (grantResults.length > 0) {
                    boolean storage_accepted = grantResults[0] == (PackageManager.PERMISSION_GRANTED);
                    if (storage_accepted) {
                        pickFromGallery();
                    } else {
                        Toast.makeText(this, "please enable storage permission", Toast.LENGTH_SHORT).show();
                    }
                }
            }
            break;
        }
    }


    @Override
    protected void onPause() {
        super.onPause();
        closeDrawer(drawerlayout);
    }
}