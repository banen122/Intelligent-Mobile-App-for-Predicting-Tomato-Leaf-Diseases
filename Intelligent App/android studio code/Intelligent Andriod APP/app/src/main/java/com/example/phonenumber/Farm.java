package com.example.phonenumber;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.phonenumber.HomeItems.Global_variable;
import com.example.phonenumber.HomeItems.Home;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Farm extends AppCompatActivity {
Global_variable global_variable=new Global_variable();
    private String URL =global_variable.ip+"/Farm.php";
    private String URL2 =global_variable.ip+"/fetchfarmid.php";
    private static final String TAG = "Farm";
    String farmid;
    private EditText etName,etSpace,etLocation;

    private  String Name,space,location;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_farm);
        etName=findViewById(R.id.edFarmename);
        etLocation=findViewById(R.id.edLocation);
        etSpace=findViewById(R.id.edspace);
        Name=space=location="";


    }



    public void Next(View view){
      Name=etName.getText().toString().trim();
      location=etLocation.getText().toString().trim();
      space=etSpace.getText().toString().trim();
      if(!Name.equals("")&& !location.matches("Choose location")&& !space.equals("")) {

          StringRequest stringRequest = new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
              @Override
              public void onResponse(String response) {
                  if (response.equals("success")) {

                      StringRequest fetchfarmid=new StringRequest(Request.Method.DEPRECATED_GET_OR_POST, URL2, new Response.Listener<String>() {
                          @Override
                          public void onResponse(String response) {
                              Log.e(TAG, "onResponse: "+response );
                              try {

                                  JSONObject object = new JSONObject(response);
                                  JSONArray array  = object.getJSONArray("farm");

                                  for (int i = 0; i < array.length(); i++)
                                  {
                                      JSONObject jsonobject = array.getJSONObject(i);
                                      farmid=jsonobject.getString("farm_id");
                                      Log.e(TAG, "onResponse: "+farmid );
                                  }
                                  SharedPreferences sharedPref = getSharedPreferences("farmid",MODE_PRIVATE);
                                  SharedPreferences.Editor editor = sharedPref.edit();
                                  editor.putString("idf",farmid);
                                  editor.apply();
                              } catch (JSONException e) {
                                  e.printStackTrace();
                              }

                          }
                      }, new Response.ErrorListener() {
                          @Override
                          public void onErrorResponse(VolleyError error) {

                              Toast.makeText(Farm.this, error.getMessage(), Toast.LENGTH_SHORT).show();
                          }
                      }) {
                          @Override
                          protected Map<String, String> getParams() throws AuthFailureError {
                              HashMap<String,String> params =new HashMap<>();
                              SharedPreferences sharedPreferences = getSharedPreferences("farmerid", MODE_PRIVATE);
                              String farmerid = sharedPreferences.getString("id","");
                              params.put("farmer_id",farmerid);
                              return params;
                          }
                      } ;
                      RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                      requestQueue.add(fetchfarmid);

                      Intent login = new Intent(Farm.this, Crop.class);
                      startActivity(login);
                      finish();
                  } else if (response.equals("failure")) {
                      Toast.makeText(getApplicationContext(), "please fill the information", Toast.LENGTH_LONG).show();
                  }

              }
          }, new Response.ErrorListener() {
              @Override
              public void onErrorResponse(VolleyError error) {
                  Toast.makeText(Farm.this, error.toString().trim(), Toast.LENGTH_SHORT).show();
              }
          })
          {
              @Nullable
              @Override
              protected Map<String, String> getParams() throws AuthFailureError {
                  SharedPreferences sharedPreferences = getSharedPreferences("farmerid", MODE_PRIVATE);
                  String farmerid = sharedPreferences.getString("id","");
                  Map<String, String> data = new HashMap<>();

                  data.put("id_farmer", farmerid);
                  data.put("farm_name", Name);
                  data.put("location", location);
                  data.put("space",space);
                  return data;
              }
          };
          RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
          requestQueue.add(stringRequest);

      }
      else{
          Toast.makeText(this, "Fields can not be empty!", Toast.LENGTH_SHORT).show();
      }

    }
}