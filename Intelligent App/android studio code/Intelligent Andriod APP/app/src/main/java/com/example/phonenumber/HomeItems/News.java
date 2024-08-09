package com.example.phonenumber.HomeItems;

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

public class News extends AppCompatActivity {
    DrawerLayout drawerlayout;
    ImageView btMenu;
    RecyclerView recyclerView;

    /*-----------------------------------------------------------------------------------*/
    /*listview inside news*/
    private static final String TAG = "News";
    ListView listView;
    AdapterNewsListView adapter;
    public static ArrayList<NewsData> NewsDataArrayList = new ArrayList<>();
    Global_variable global_variable=new Global_variable();
    String url = global_variable.ip+"/retrieveNews.php";
    NewsData NewsData;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_news);

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
        /*listview inside news*/
        listView = findViewById(R.id.ListViewNews);
        adapter = new AdapterNewsListView(this,NewsDataArrayList);
        listView.setAdapter(adapter);
        retrieveData();
    }

    public void retrieveData(){

        StringRequest request = new StringRequest(Request.Method.POST, url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        NewsDataArrayList.clear();
                        try{

                            JSONObject jsonObject = new JSONObject(response);
                            String sucess = jsonObject.getString("success");
                            JSONArray jsonArray = jsonObject.getJSONArray("notification");

                            if(sucess.equals("1")){
                                for(int i=0;i<jsonArray.length();i++){

                                    JSONObject object = jsonArray.getJSONObject(i);

                                    String id = object.getString("news_id");
                                    String topic = object.getString("topic");
                                    String info = object.getString("info");
                                    String datetime = object.getString("datetime");

                                    NewsData = new NewsData(id,topic,info,datetime);
                                    NewsDataArrayList.add(NewsData);
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
                Toast.makeText(News.this, error.getMessage(), Toast.LENGTH_SHORT).show();
                Log.e(TAG, "onErrorResponse:"+error.getMessage());

            }
        });

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(request);
    }

    @Override
    protected void onPause() {
        super.onPause();
        Home.closeDrawer(drawerlayout);
    }
}