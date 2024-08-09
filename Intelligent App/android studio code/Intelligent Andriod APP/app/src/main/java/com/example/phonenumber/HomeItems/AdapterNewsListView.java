package com.example.phonenumber.HomeItems;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.phonenumber.R;

import java.util.List;

public class AdapterNewsListView extends ArrayAdapter<NewsData> {

    Context context;
    List<NewsData> arrayListNewsData;


    public AdapterNewsListView(@NonNull Context context, List<NewsData> arrayListNewsData) {
        super(context, R.layout.custom_list_item_news,arrayListNewsData);

        this.context = context;
        this.arrayListNewsData = arrayListNewsData;

    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {

        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.custom_list_item_news,null,true);

        TextView tvID = view.findViewById(R.id.txt_id);
        TextView tvTopic = view.findViewById(R.id.txt_topic);
        TextView tvInfo=view.findViewById(R.id.txt_info);
        tvTopic.setText(arrayListNewsData.get(position).getTopic());
        tvInfo.setText(arrayListNewsData.get(position).getInfo());

        return view;
    }
}
