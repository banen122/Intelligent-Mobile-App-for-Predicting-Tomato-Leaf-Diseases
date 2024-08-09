package com.example.phonenumber.HomeItems;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.phonenumber.R;

import java.util.HashMap;
import java.util.Map;

public class Feedback extends AppCompatActivity {
    DrawerLayout drawerlayout;
    ImageView btMenu;
    RecyclerView recyclerView;
    EditText edsub,edinfo;
    private static final String TAG = "Contact";
    Global_variable global_variable=new Global_variable();

    private String URL =global_variable.ip+"/farmermessage.php";
    String subject,info;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_contactus);

        drawerlayout=findViewById(R.id.drawer_layout);
        btMenu=findViewById(R.id.bt_menu);
        recyclerView=findViewById(R.id.recycler_view);

        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setAdapter(new MainAdapter(this, Home.arrayList));
        btMenu.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerlayout.openDrawer(GravityCompat.START);
            }
        });


        /*-----------------------------------------------------------------------------------------*/
        /*inside contact*/
        edinfo=findViewById(R.id.edinfo);
        edsub=findViewById(R.id.edsubject);

    }

    public void submit(View view){
       subject = edsub.getText().toString();
       info = edinfo.getText().toString().trim();

       if(subject.isEmpty()||info.isEmpty()){
            Toast.makeText(Feedback.this, "fill the empty field please!", Toast.LENGTH_SHORT).show();
        }
       else {
           SharedPreferences sharedPreferences = getSharedPreferences("userlog", MODE_PRIVATE);
           String username = sharedPreferences.getString("username", "");

           StringRequest stringRequest = new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
               @Override
               public void onResponse(String response) {
                   Toast.makeText(Feedback.this, "Thank you for contacting us. We will check your message as soon as possible", Toast.LENGTH_SHORT).show();
                   Log.e(TAG, "onResponse: "+response);
               }


           }, new Response.ErrorListener() {
               @Override
               public void onErrorResponse(VolleyError error) {
                   Toast.makeText(getApplicationContext(), error.toString().trim(), Toast.LENGTH_SHORT).show();
               }
           }) {
               @Override
               protected Map<String, String> getParams() throws AuthFailureError {
                   Map<String, String> data = new HashMap<>();
                   data.put("farmer_name", username);
                   data.put("subject", subject);
                   data.put("info", info);
                   return data;
               }
           };
           RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
           requestQueue.add(stringRequest);
       }
    }







    @Override
    protected void onPause() {
        super.onPause();
        Home.closeDrawer(drawerlayout);
    }
}