package com.example.phonenumber;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
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

import java.util.HashMap;
import java.util.Map;

public class Crop extends AppCompatActivity implements AdapterView.OnItemSelectedListener {
    Spinner spinCropname,spintype,spinstate;
Global_variable global_variable=new Global_variable();
    private String URL =global_variable.ip+"/Crop.php";
    public static   String[] iplTeam;
    public static    String[] iplTeam1;
    public static String[] iplTeam2;
    private static final String TAG = "Farm";
    public static String cropname,type,state;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_crop);
        Resources resources=getResources();
        iplTeam=resources.getStringArray(R.array.type);
        iplTeam1=resources.getStringArray(R.array.state);
        iplTeam2=resources.getStringArray(R.array.type_plant);
        spinCropname=findViewById(R.id.spcropname);
        spintype=findViewById(R.id.sptype);
        spinstate=findViewById(R.id.spstate);


        ArrayAdapter adapter=new ArrayAdapter<>(Crop.this, android.R.layout.simple_list_item_1, iplTeam);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        ArrayAdapter adapter1=new ArrayAdapter<>(Crop.this, android.R.layout.simple_spinner_item, iplTeam1);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        ArrayAdapter adapter2=new ArrayAdapter<>(Crop.this, android.R.layout.simple_spinner_item, iplTeam2);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);



        spinCropname.setAdapter(adapter);
        spintype.setAdapter(adapter1);
        spinstate.setAdapter(adapter2);

        cropname=type=state="";

    }

    @Override
    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
if(iplTeam[i].matches("Choose the crop type")||iplTeam[i].matches("اختر نوع المحصول"))
{
    String chose_type=getString(R.string.chose_type);


    Toast.makeText(getApplicationContext(),chose_type,Toast.LENGTH_LONG).show();
}

      else if(iplTeam[i].matches("Tomato"))
        {

            cropname=iplTeam[i];
            type = iplTeam1[i];
            state = iplTeam2[i];


        }
        else
        {
            String project=getString(R.string.messagewa);

            Toast.makeText(getApplicationContext(),project,Toast.LENGTH_LONG).show();

        }

    }

    @Override
    public void onNothingSelected(AdapterView<?> adapterView) {

    }

    public void Done(View view){


        cropname = spinCropname.getSelectedItem().toString();
        type=spintype.getSelectedItem().toString();
        state=spinstate.getSelectedItem().toString();

        if(cropname.matches("Choose the crop type")||cropname.matches("اختر نوع المحصول"))
        {
            String choose=getString(R.string.chose_type);
            Toast.makeText(getApplicationContext(),choose,Toast.LENGTH_LONG).show();
        }
        else if(type.matches("choose the type of plant")||type.matches("اختر الحالة")){
            String types=getString(R.string.typess);
            Toast.makeText(getApplicationContext(),types,Toast.LENGTH_LONG).show();

        }
        else if(state.matches("choose the state")||state.matches("اختر نوع النبات")){
            String states=getString(R.string.plantty);
            Toast.makeText(getApplicationContext(),states,Toast.LENGTH_LONG).show();
        }
        else if(!cropname.matches("Tomato"))
        {
            String messagewar=getString(R.string.messagewa);
            Toast.makeText(getApplicationContext(),messagewar,Toast.LENGTH_LONG).show();
        }
        else {

            if (!cropname.isEmpty() && !type.isEmpty() && !state.isEmpty()) {

                StringRequest stringRequest = new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e(TAG, "onResponse: "+response );
                        if (response.matches("success")) {
                            Intent tologin = new Intent(Crop.this, Login.class);
                            startActivity(tologin);
                            finish();
                        } else if (response.matches("failure")) {
                            String fail=getString(R.string.fill);
                            Toast.makeText(getApplicationContext(), fail, Toast.LENGTH_LONG).show();
                        }

                    }
                }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(Crop.this, error.toString().trim(), Toast.LENGTH_SHORT).show();
                    }
                }) {
                    @Nullable
                    @Override
                    protected Map<String, String> getParams() throws AuthFailureError {
                        Map<String, String> data = new HashMap<>();
                        SharedPreferences sharedPreferences = getSharedPreferences("farmid", MODE_PRIVATE);
                        String farmid = sharedPreferences.getString("idf","");
                        data.put("farm_id", farmid);
                        data.put("crop_name", cropname);
                        data.put("type", type);
                        data.put("state", state);
                        return data;
                    }
                };
                RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                requestQueue.add(stringRequest);

            } else
            {
                Toast.makeText(this, "Fields can not be empty!", Toast.LENGTH_SHORT).show();
            }

        }
    }

}