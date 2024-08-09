package com.example.phonenumber.HomeItems;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.phonenumber.R;

import java.util.ArrayList;

public class MainAdapterGuest extends RecyclerView.Adapter<MainAdapterGuest.ViewHolder> {

Activity activity;
ArrayList<String> arraylist;

public MainAdapterGuest(Activity activity, ArrayList<String>arraylist){
    this.activity=activity;
    this.arraylist=arraylist;
}
    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view= LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_drawer_main,parent,false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {

holder.textview.setText(arraylist.get(position));
//holder.imageview.setImageResource(img[position]);
holder.textview.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View view) {
        int position=holder.getAdapterPosition();
        switch(position){
            case 0:
                activity.startActivity(new Intent(activity,Guest.class)
                .setFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                break;
            case 1:
                activity.startActivity(new Intent(activity,aboutusGuest.class)
                        .setFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                break;

            case 2: activity.startActivity(new Intent(activity,logoutGuest.class)
                    .setFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                break;

        }
    }
});
    }

    @Override
    public int getItemCount() {
       return arraylist.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        TextView textview;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            textview=itemView.findViewById(R.id.text_view);

        }
    }
}
