package com.example.phonenumber.HomeItems;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.phonenumber.HomeItems.NewsData;
import com.example.phonenumber.HomeItems.getMessageServer;
import com.example.phonenumber.R;

import java.util.List;

public class AdapterInboxListView extends ArrayAdapter<getMessageServer>{
    Context context;
    List<getMessageServer> arrayListDate;

    public AdapterInboxListView(@NonNull Context context, List<getMessageServer> arrayListDate) {
        super(context, R.layout.custom_list_item_inbox,arrayListDate);
        this.context = context;
        this.arrayListDate = arrayListDate;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.custom_list_item_inbox,null,true);
        TextView tvTOPIC = view.findViewById(R.id.txt_topic);
        TextView tvMESSAGE = view.findViewById(R.id.txt_message);

        tvMESSAGE.setText(arrayListDate.get(position).getMessage()+"\n\n uploaded at: "+arrayListDate.get(position).getDate());

        return view;
    }
}
