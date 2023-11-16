package com.example.pmms;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;

public class MainmenuActivity extends AppCompatActivity {
        ImageButton prev,next;
        ImageView pic;
        int currentimg =0;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mainmenu);
    }
    public void prev(View v){

//        text = findViewById(R.id.text);
//
        String idX = "pic" + currentimg;

        int x = this.getResources().getIdentifier(idX, "id", getPackageName());

        pic = findViewById(x);

        pic.setAlpha(0f);



        currentimg = (3 + currentimg - 1) % 3;

        String idY = "pic" + currentimg;

        int y = this.getResources().getIdentifier(idY, "id", getPackageName());

        pic = findViewById(y);

        pic.setAlpha(1f);
//
//
//
//        text.setText(names[currentImage]);



    }
    public void next(View v){
        String idX = "pic" + currentimg;

        int x = this.getResources().getIdentifier(idX, "id", getPackageName());

        pic = findViewById(x);

        pic.setAlpha(0f);



        currentimg = (3 + currentimg + 1) % 3;

        String idY = "pic" + currentimg;

        int y = this.getResources().getIdentifier(idY, "id", getPackageName());

        pic = findViewById(y);

        pic.setAlpha(1f);
    }
    public void outdoorposter(View v)
    {
        Intent intent = new Intent(this, outdoorPosterActivity.class);
        startActivity(intent);
    }
    public void poster(View v)
    {
        Intent intent = new Intent(this, posterActivity.class);
        startActivity(intent);
    }
    public void Banners(View v)
    {
        Intent intent = new Intent(this, bannerActivity.class);
        startActivity(intent);
    }

}