package com.example.phonenumber.HomeItems;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.phonenumber.R;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Home2 extends AppCompatActivity {
    public static String value1,value2,value3,value4="";
    Global_variable global_variable=new Global_variable();
    private  String url1=global_variable.ip+"/fetch.php";
    private String url2=global_variable.ip+"/fetchtreatment.php";

    private static final String TAG = "MainActivity2";
    ProgressDialog progressDialog;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home2);

        progressDialog=new ProgressDialog(Home2.this);
        progressDialog.show();
        progressDialog.setContentView(R.layout.progress_dialog);
        progressDialog.getWindow().setBackgroundDrawableResource(android.R.color.transparent);


        Runnable runnable=new Runnable() {

            @Override
            public void run() {
                for (int i = 1; i <= 40; i++) {
                    loaddata();

                    Log.e(TAG, "i: "+i+" ");
                    try {
                        Thread.sleep(1000);

                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                    if (i > 40) {
                        Toast.makeText(getApplicationContext(),"Error please try later",Toast.LENGTH_LONG).show();
                    }
                }

            }
        };
        Thread thread=new Thread(runnable) {

        };
        thread.start();
    }

    private void loaddata(){
        StringRequest stringRequest = new StringRequest(Request.Method.DEPRECATED_GET_OR_POST, url1, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.e("onResponse: ", response);
                try {

                    JSONObject jsonObject = new JSONObject(response);
                    JSONArray diseasearray = jsonObject.getJSONArray("disease");

                    for (int i = 0; i <diseasearray.length(); i++) {
                        JSONObject objectdisease = diseasearray.getJSONObject(i);
                        value1=objectdisease.getString("disease_name");

                        StringRequest fetchtreatment = new StringRequest(Request.Method.DEPRECATED_GET_OR_POST, url2, new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                Log.e("onResponse: ", response);
                                try {

                                    JSONObject jsonObject = new JSONObject(response);
                                    JSONArray diseasearray = jsonObject.getJSONArray("treatment");

                                    for (int i = 0; i <diseasearray.length(); i++) {
                                        JSONObject objectdisease = diseasearray.getJSONObject(i);
                                         value2=objectdisease.getString("treatment_name");
                                         value3=objectdisease.getString("instruction");
                                         value4=objectdisease.getString("discription");


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
                        }){
                            @Override
                            protected Map<String, String> getParams() throws AuthFailureError {

                                SharedPreferences sharedPreferences = getSharedPreferences("userlog", MODE_PRIVATE);
                                String userid = sharedPreferences.getString("userid","");
                                HashMap<String,String> params =new HashMap<>();
                                params.put("id_farmer",userid);
                                return params;
                            }
                        } ;
                        RequestQueue queue= Volley.newRequestQueue(getApplicationContext());
                        queue.add(fetchtreatment);

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
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {

                SharedPreferences sharedPreferences = getSharedPreferences("userlog", MODE_PRIVATE);
                String userid = sharedPreferences.getString("userid","");
                HashMap<String,String> params =new HashMap<>();
                params.put("id_farmer",userid);
                return params;
            }
        } ;


        Volley.newRequestQueue(this).add(stringRequest);

        if((value1 != null && !value1.isEmpty() && !value1.equals("null"))&&(value2 != null && !value2.isEmpty() && !value2.equals("null"))&&(value3 != null && !value3.isEmpty() && !value3.equals("null"))&&(value4 != null && !value4.isEmpty() && !value4.equals("null"))) {
            Log.e(TAG, "data" + value1 + " " + value2 + " " + value3 + " " + value4);
            Intent returnIntent = new Intent();
            returnIntent.putExtra("message1", value1);
            returnIntent.putExtra("message2", value2);
            returnIntent.putExtra("message3", value3);
            returnIntent.putExtra("message4", value4);
            setResult(Activity.RESULT_OK, returnIntent);
            finish();
            value1=value2=value3=value4="";
        }
        else{
            Log.e(TAG, "no valueeeeee" );
        }

    }

}