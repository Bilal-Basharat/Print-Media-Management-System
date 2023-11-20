package com.example.pmms;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.Toast;

public class MainmenuActivity extends AppCompatActivity {
        ImageButton prev,next;
        ImageView pic;
        int currentimg =0;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mainmenu);
        Intent intent = getIntent();
        if (intent.hasExtra("USERNAME")) {
            String username = intent.getStringExtra("USERNAME");
            Toast.makeText(this, "Welcome, " + username + "!", Toast.LENGTH_SHORT).show();

            // Open posterActivity
//            Intent posterIntent = new Intent(this, posterActivity.class);
//            posterIntent.putExtra("USERNAME", username); // Pass username to posterActivity
//            startActivity(posterIntent);
        }
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
        Intent intent = getIntent();
        if (intent.hasExtra("USERNAME")) {
            String username = intent.getStringExtra("USERNAME");
            Toast.makeText(this, "Welcome, " + username + "!", Toast.LENGTH_SHORT).show();
        }
        Intent intent2 = new Intent(this, posterActivity.class);
        startActivity(intent2);

    }
    public void Banners(View v)
    {
        Intent intent = new Intent(this, bannerActivity.class);
        startActivity(intent);
    }

}