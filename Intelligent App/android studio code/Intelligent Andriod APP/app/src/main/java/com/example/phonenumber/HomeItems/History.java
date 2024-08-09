package com.example.phonenumber.HomeItems;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

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

public class History extends AppCompatActivity {
    DrawerLayout drawerlayout;
    ImageView btMenu;
    RecyclerView recyclerView;
    /*-----------------------------------------------------------------------------------*/
    /*listview inside history*/
    private static final String TAG = "MainActivity";
    ListView listView;
    AdapterHistoryListView adapter;
    public static ArrayList<DateUploadImage> dateUploadImageArrayList = new ArrayList<>();
    Global_variable global_variable=new Global_variable();
    String url = global_variable.ip+"/retrieve.php";
    DateUploadImage dateUploadImage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_history);

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
        /*-----------------------------------------------------------------------------------------*/
        /*listview inside history*/
        listView = findViewById(R.id.ListViewHistory);
        adapter = new AdapterHistoryListView(this, dateUploadImageArrayList);
        listView.setAdapter(adapter);




        retrieveData();
    }

    public void retrieveData(){
        StringRequest request = new StringRequest(Request.Method.DEPRECATED_GET_OR_POST, url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        Log.e(TAG, "HistoryResponse: "+response);
                        dateUploadImageArrayList.clear();
                        try{

                            JSONObject jsonObject = new JSONObject(response);
                            String sucess = jsonObject.getString("success");
                            JSONArray jsonArray = jsonObject.getJSONArray("image");

                            if(sucess.equals("1")){
                                for(int i=0;i<jsonArray.length();i++){

                                    JSONObject object = jsonArray.getJSONObject(i);

                                    String date = object.getString("date");

                                    dateUploadImage = new DateUploadImage(date);
                                    dateUploadImageArrayList.add(dateUploadImage);
                                    adapter.notifyDataSetChanged();
                                }
                            }
                        }
                        catch (JSONException e){
                            e.printStackTrace();
                        }
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(History.this, error.getMessage(), Toast.LENGTH_SHORT).show();
                Log.e(TAG, "onErrorResponse:"+error.getMessage());

            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError
            {
                SharedPreferences sharedPreferences = getSharedPreferences("userlog", MODE_PRIVATE);
                String id = sharedPreferences.getString("userid","");
                Map<String,String> map=new HashMap<String, String>();
                map.put("id_farmer",id);
                return map;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(request);
    }


    @Override
    protected void onPause() {
        super.onPause();
        Home.closeDrawer(drawerlayout);
    }
}