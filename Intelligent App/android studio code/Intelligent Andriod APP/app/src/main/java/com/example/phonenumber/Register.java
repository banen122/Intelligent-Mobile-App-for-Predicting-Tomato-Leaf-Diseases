package com.example.phonenumber;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
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
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.FirebaseException;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthProvider;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public class Register extends AppCompatActivity {

    private EditText etPhoneNumber,etUsername, etPassword, etReenterPassword;
    private TextView tvStatus;
    String farmerid;
    Global_variable global_variable=new Global_variable();
    private String URL = global_variable.ip+"/register.php";
    private String URL2 =global_variable.ip+"/fetchfarmerid.php";

    private String username, password, reenterPassword,phoneNumber;
    private static final String TAG = "Register";


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.register);
        etUsername = findViewById(R.id.etUsername);
        etPhoneNumber = findViewById(R.id.etPhonenumber);
        etPassword = findViewById(R.id.etPassword);
        etReenterPassword = findViewById(R.id.confPassword);
        tvStatus = findViewById(R.id.statues);


        username= password =phoneNumber= reenterPassword = "";
    }


    public void save(View view) {


        phoneNumber = etPhoneNumber.getText().toString();
        username = etUsername.getText().toString().trim();
        password = etPassword.getText().toString().trim();
        reenterPassword = etReenterPassword.getText().toString().trim();
        if(!password.equals(reenterPassword)){
            Toast.makeText(this, "Password Mismatch", Toast.LENGTH_SHORT).show();
        }
        else if(phoneNumber.isEmpty()||username.isEmpty()||password.isEmpty()){
            Toast.makeText(Register.this, "fill the data please!", Toast.LENGTH_SHORT).show();
        }
        else if(!username.equals("")&& !password.equals("")&&!phoneNumber.equals("")){
            StringRequest stringRequest = new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    if (response.equals("success")) {

                        //fetch id farmer
                        StringRequest fetchfarmerid=new StringRequest(Request.Method.DEPRECATED_GET_OR_POST, URL2, new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {

                                try {

                                    JSONObject object = new JSONObject(response);
                                    JSONArray array  = object.getJSONArray("farmer");

                                    for (int i = 0; i < array.length(); i++)
                                    {
                                        JSONObject jsonobject = array.getJSONObject(i);
                                        farmerid=jsonobject.getString("id_farmer");
                                        Log.e(TAG, "onResponse: "+farmerid );
                                    }

                                    SharedPreferences sharedPref = getSharedPreferences("farmerid",MODE_PRIVATE);
                                    SharedPreferences.Editor editor = sharedPref.edit();
                                    editor.putString("id",farmerid);
                                    editor.apply();
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }

                            }
                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {

                                Toast.makeText(Register.this, error.getMessage(), Toast.LENGTH_SHORT).show();
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


                        //phone Number
                        PhoneAuthProvider.getInstance().verifyPhoneNumber(
                                "+964"+phoneNumber, 60, TimeUnit.SECONDS, Register.this,
                                new PhoneAuthProvider.OnVerificationStateChangedCallbacks() {
                                    @Override
                                    public void onVerificationCompleted(@NonNull PhoneAuthCredential phoneAuthCredential) {
                                        signInUser(phoneAuthCredential);
                                    }

                                    @Override
                                    public void onVerificationFailed(@NonNull FirebaseException e) {
                                        Log.d(TAG,"onVertificationFailed"+e.getLocalizedMessage());
                                    }

                                    @Override
                                    public void onCodeSent(@NonNull String verificationId, @NonNull PhoneAuthProvider.ForceResendingToken forceResendingToken) {
                                        super.onCodeSent(verificationId, forceResendingToken);
                                        //
                                        Dialog dialog = new Dialog(Register.this);
                                        dialog.setContentView(R.layout.verify_popup);
                                        EditText etVerifyCode = dialog.findViewById(R.id.etVerify);
                                        Button btnVerifyCode = dialog.findViewById(R.id.btn_varify);

                                        btnVerifyCode.setOnClickListener(new View.OnClickListener() {
                                            @Override
                                            public void onClick(View view) {
                                                String verificationCode = etVerifyCode.getText().toString();
                                                if(verificationId.isEmpty()) return;
                                                //create a credential
                                                PhoneAuthCredential credential=PhoneAuthProvider.getCredential(verificationId,verificationCode);
                                                signInUser(credential);
                                            }
                                        });
                                        dialog.show();
                                    }
                                });
                    }
                    else if (response.equals("failure")) {
                        tvStatus.setText("Something went wrong!"); }
                    else if (response.equals("exists")) {
                        tvStatus.setText("Username Already Used!!");
                    Toast.makeText(getApplicationContext(),"already exist",Toast.LENGTH_LONG).show();}

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
                    data.put("farmer_name", username);
                    data.put("password", password);
                    data.put("phone_number",phoneNumber);
                    return data;
                }
            };
            RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
            requestQueue.add(stringRequest);
        }
    }

    public void login(View view) {
        Intent intent = new Intent(this, Login.class);
        startActivity(intent);
        finish();
    }

    private void signInUser(PhoneAuthCredential credential) {
        FirebaseAuth.getInstance().signInWithCredential(credential)
                .addOnCompleteListener(new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        if(task.isSuccessful()){
                            startActivity(new Intent(Register.this, Farm.class));
                            finish();
                        }else {
                            Log.d(TAG, "onComplete:"+task.getException().getLocalizedMessage());
                        }
                    }
                });
    }

}