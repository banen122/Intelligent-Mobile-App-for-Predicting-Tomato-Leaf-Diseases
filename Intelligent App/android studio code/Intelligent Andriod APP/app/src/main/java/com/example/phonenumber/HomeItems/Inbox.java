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
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.phonenumber.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Inbox extends AppCompatActivity {
    DrawerLayout drawerlayout;
    ImageView btMenu;
    RecyclerView recyclerView;

    //inbox
    private static final String TAG = "MainActivity";
    ListView listView;
    AdapterInboxListView adapter;
    public static ArrayList<getMessageServer> MessageServer = new ArrayList<>();
    Global_variable global_variable=new Global_variable();
    String url = global_variable.ip+"/fetchmessageserver.php";
    getMessageServer GetMessageServer;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inbox);
        //design navigation
        drawerlayout = findViewById(R.id.drawer_layout);
        btMenu = findViewById(R.id.bt_menu);
        recyclerView = findViewById(R.id.recycler_view);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setAdapter(new MainAdapter(this, Home.arrayList));
        btMenu.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerlayout.openDrawer(GravityCompat.START);
            }
        });
        //inbox design
        listView = findViewById(R.id.ListViewInbox);
        adapter = new AdapterInboxListView(this,MessageServer);
        listView.setAdapter(adapter);




        retrieveData();


    }

    private void retrieveData() {
        StringRequest request = new StringRequest(Request.Method.DEPRECATED_GET_OR_POST, url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        MessageServer.clear();
                        try{

                            JSONObject jsonObject = new JSONObject(response);
                            String sucess = jsonObject.getString("success");
                            JSONArray jsonArray = jsonObject.getJSONArray("servermessage");

                            if(sucess.equals("1")){
                                for(int i=0;i<jsonArray.length();i++){

                                    JSONObject object = jsonArray.getJSONObject(i);

                                    String date = object.getString("datetime");
                                    String message = object.getString("message");

                                    GetMessageServer = new getMessageServer(date,message);
                                    MessageServer.add(GetMessageServer);
                                    adapter.notifyDataSetChanged();
                                }
                            }
                            Log.e(TAG, "onResponse: "+response);
                        }
                        catch (JSONException e){
                            e.printStackTrace();
                        }
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(Inbox.this, error.getMessage(), Toast.LENGTH_SHORT).show();
                Log.e(TAG, "onErrorResponse:"+error.getMessage());

            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError
            {
                SharedPreferences sharedPreferences = getSharedPreferences("userlog", MODE_PRIVATE);
                String farmer_name = sharedPreferences.getString("username","");
                Log.e(TAG, "getParams: "+farmer_name);
                Map<String,String> map=new HashMap<String, String>();
                map.put("farmer_name",farmer_name);
                return map;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(request);
    }
}