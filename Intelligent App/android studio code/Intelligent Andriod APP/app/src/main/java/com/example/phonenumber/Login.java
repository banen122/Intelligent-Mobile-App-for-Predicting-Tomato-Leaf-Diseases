package com.example.phonenumber;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.phonenumber.HomeItems.Global_variable;
import com.example.phonenumber.HomeItems.Guest;
import com.example.phonenumber.HomeItems.Home;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.messaging.FirebaseMessaging;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Login extends AppCompatActivity {
    private EditText etUser, etPassword;
    CheckBox remember;
    String checkbox;
    private String username, password;
    String userid;
    private static final String CHANNEL_ID = "101";
    Global_variable global_variable=new Global_variable();
    private String URL = global_variable.ip+"/login.php";
    private String URL2 =global_variable.ip+"/fetchfarmerid.php";
    private String URL3 =global_variable.ip+"/tokens.php";//firebase store token
    private static final String TAG = "MainActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        username= password = "";
        etUser = findViewById(R.id.etusername);
        etPassword = findViewById(R.id.etpassword);
        remember=findViewById(R.id.checkBox);
        createNotificationChannel();
        subscribe();

        SharedPreferences sharedPreferences = getSharedPreferences("checkbox", MODE_PRIVATE);
        checkbox = sharedPreferences.getString("remember", "");
        Log.e(TAG, "onCreate: "+checkbox);
        if(checkbox.equals("true")){
            Intent intent=new Intent(Login.this,Home.class);
            startActivity(intent);
            finish();
        }



        remember.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
                if(compoundButton.isChecked()){
                    SharedPreferences sharedPref = getSharedPreferences("checkbox",MODE_PRIVATE);
                    SharedPreferences.Editor editor = sharedPref.edit();
                    editor.putString("remember","true");
                    editor.apply();

                }
                else if(!compoundButton.isChecked()){
                    SharedPreferences sharedPref = getSharedPreferences("checkbox",MODE_PRIVATE);
                    SharedPreferences.Editor editor = sharedPref.edit();
                    editor.putString("remember","false");
                    editor.apply();
                }
            }
        });
    }


    public void login(View view) {
        username = etUser.getText().toString().trim();
        password = etPassword.getText().toString().trim();
        if (!username.equals("") && !password.equals("")) {
            StringRequest stringRequest = new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    if (response.equals("success")) {
                        getToken();
                        StringRequest fetchfarmerid=new StringRequest(Request.Method.DEPRECATED_GET_OR_POST, URL2, new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {

                                try {

                                    JSONObject object = new JSONObject(response);
                                    JSONArray array  = object.getJSONArray("farmer");

                                    for (int i = 0; i < array.length(); i++)
                                    {
                                        JSONObject jsonobject = array.getJSONObject(i);
                                        userid=jsonobject.getString("id_farmer");
                                        Log.e(TAG, "onResponse: "+userid );
                                    }
                                    Log.e(TAG, "id: "+userid+" "+username);

                                    SharedPreferences sharedPref = getSharedPreferences("userlog",MODE_PRIVATE);
                                    SharedPreferences.Editor editor = sharedPref.edit();
                                    editor.putString("userid",userid);
                                    editor.putString("username",username);
                                    editor.apply();
                                    Log.e(TAG, "data"+userid+username);



                                    Intent tohome=new Intent(Login.this,Home.class);
                                    startActivity(tohome);
                                    finish();
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }

                            }
                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {

                                Toast.makeText(Login.this, error.getMessage(), Toast.LENGTH_SHORT).show();
                            }
                        }) {
                            @Override
                            protected Map<String, String> getParams() throws AuthFailureError {
                                HashMap<String,String> params =new HashMap<>();
                                params.put("farmer_name",username);
                                return params;
                            }
                        } ;
                        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                        requestQueue.add(fetchfarmerid);
                    }
                    else if (response.equals("failure")) {
                        Toast.makeText(Login.this, "invalid login id /password", Toast.LENGTH_SHORT).show();
                    }

                }
            }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    Toast.makeText(Login.this, error.toString().trim(), Toast.LENGTH_SHORT).show();
                }
            }){
                @Nullable
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    Map<String, String> data = new HashMap<>();
                    data.put("farmer_name", username);
                    data.put("password", password);
                    return data;
                }
            };
            RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
            requestQueue.add(stringRequest);
        }else{
            Toast.makeText(this, "Fields can not be empty!", Toast.LENGTH_SHORT).show();
        }

    }







    public void register(View view) {
        Intent intent = new Intent(Login.this, Register.class);
        startActivity(intent);
        finish();
    }

    public void guest(View view){
        Intent toguest=new Intent(Login.this, Guest.class);
        startActivity(toguest);
        finish();
    }


    //firebase notification
    private String getToken() {
        final String[] token = {""};
        FirebaseMessaging.getInstance().getToken().addOnCompleteListener(new OnCompleteListener<String>() {
            @Override
            public void onComplete(@NonNull Task<String> task) {
                if(task.isComplete()){
                    token[0] = task.getResult();
                    Log.e("Notification Firebase", "onComplete: new Token got: "+token[0] );
                    StringRequest stringRequest = new StringRequest(Request.Method.POST, URL3, new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            Log.e(TAG, "firebasetoken: "+response);
                        }


                    }, new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {
                            Toast.makeText(getApplicationContext(), error.toString().trim(), Toast.LENGTH_SHORT).show();
                        }
                    }){
                        @Override
                        protected Map<String, String> getParams() throws AuthFailureError {
                            Map<String, String> data = new HashMap<>();
                            String phonename=etUser.getText().toString();
                            data.put("phone_token", token[0]);
                            data.put("farmer_name", phonename);
                            return data;
                        }
                    };
                    RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                    requestQueue.add(stringRequest);
                }
            }
        });
        return token[0];
    }

    //create a notif channel
    private void createNotificationChannel() {
        // Create the NotificationChannel, but only on API 26+ because
        // the NotificationChannel class is new and not in the support library
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            CharSequence name = "firebaseNotificationChannel";
            String description = "this is a channel to receive firebase notification";
            int importance = NotificationManager.IMPORTANCE_DEFAULT;
            NotificationChannel channel = new NotificationChannel(CHANNEL_ID, name, importance);
            channel.setDescription(description);

            NotificationManager notificationManager = getSystemService(NotificationManager.class);
            notificationManager.createNotificationChannel(channel);
        }
    }
    private void subscribe(){
        FirebaseMessaging.getInstance().subscribeToTopic("plant")
                .addOnCompleteListener(new OnCompleteListener<Void>() {
                    @Override
                    public void onComplete(@NonNull Task<Void> task) {
                        //Toast.makeText(Startpoint.this, "subscribed", Toast.LENGTH_SHORT).show();
                    }
                });
    }
}