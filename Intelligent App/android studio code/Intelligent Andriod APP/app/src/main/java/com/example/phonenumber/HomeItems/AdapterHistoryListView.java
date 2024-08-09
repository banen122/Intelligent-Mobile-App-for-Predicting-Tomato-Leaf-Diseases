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

public class AdapterHistoryListView extends ArrayAdapter<DateUploadImage> {
    public int i=0;
    Context context;
    List<DateUploadImage> arrayListDate;


    public AdapterHistoryListView(@NonNull Context context, List<DateUploadImage> arrayListDate) {
        super(context, R.layout.custom_list_item_history,arrayListDate);

        this.context = context;
        this.arrayListDate = arrayListDate;

    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {

        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.custom_list_item_history,null,true);
        TextView tvID = view.findViewById(R.id.txt_id);
        TextView tvName = view.findViewById(R.id.txt_topic);
        tvID.setText((position+1)+"");
        tvName.setText("Uploaded Image at "+arrayListDate.get(position).getDate());

        return view;
    }
}
