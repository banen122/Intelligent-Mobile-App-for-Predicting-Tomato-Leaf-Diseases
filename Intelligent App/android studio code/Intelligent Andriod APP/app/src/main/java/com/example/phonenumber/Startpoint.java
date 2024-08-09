package com.example.phonenumber;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;

import androidx.appcompat.app.AppCompatActivity;

import com.smarteist.autoimageslider.IndicatorView.animation.type.IndicatorAnimationType;
import com.smarteist.autoimageslider.SliderAnimations;
import com.smarteist.autoimageslider.SliderView;

import java.util.Locale;

public class Startpoint extends AppCompatActivity {
    Spinner spinerlan;

     static String[]languages;



    SliderView sliderView;
    int[] images = {R.drawable.simg1,
            R.drawable.simg2,
            R.drawable.simg3};
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Resources resources=getResources();
        languages=resources.getStringArray(R.array.languegs);
        setContentView(R.layout.activity_startpoint);
        sliderView = findViewById(R.id.image_slider);
        spinerlan=findViewById(R.id.spinner_language);
        ArrayAdapter<String> adapter=new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item,languages);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinerlan.setAdapter(adapter);
        spinerlan.setSelection(0);
        Button btn=findViewById(R.id.button2);
        SliderAdapter sliderAdapter = new SliderAdapter(images);

        sliderView.setSliderAdapter(sliderAdapter);
        sliderView.setIndicatorAnimation(IndicatorAnimationType.WORM);
        sliderView.setSliderTransformAnimation(SliderAnimations.FADETRANSFORMATION);
        sliderView.startAutoCycle();

        spinerlan.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                String selectedlan=adapterView.getItemAtPosition(i).toString();

                if(selectedlan.equals("Arabic")||selectedlan.equals("عەرەبی")||selectedlan.equals("عربي")){

                    setlocal(Startpoint.this,"ar");
                    finish();
                    startActivity(getIntent());

                }
                else if (selectedlan.equals("English")||selectedlan.equals("انكليزي")||selectedlan.equals("ئینگلیزی"))
                {

                    setlocal(Startpoint.this,"en");
                    finish();
                    startActivity(getIntent());

                }
                else if(selectedlan.equals("Kurdish")||selectedlan.equals("کوردی")||selectedlan.equals("كردي"))
                {
                    setlocal(Startpoint.this,"ku");
                    finish();
                    startActivity(getIntent());

                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });


        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                logins(view);
            }
        });

    }
    public void setlocal(Activity activity , String langCode){

        Locale locale=new Locale(langCode);
        Locale.setDefault(locale);
        Resources resources=activity.getResources();
        Configuration config=resources.getConfiguration();
        config.setLocale(locale);
        resources.updateConfiguration(config,resources.getDisplayMetrics());

    }
    public void logins(View view) {
        Intent intent = new Intent(Startpoint.this, Login.class);
        startActivity(intent);
        finish();
    }



}