package com.example.pmms;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;
import com.example.pmms.data.MyDbHandler;
import com.example.pmms.model.Things;

public class posterActivity extends AppCompatActivity {
    ImageButton prev, next,A4,A3,A2,B1,portrait,landscape,mattcoated,glosscoated,whitecoated;
    TextView sizeA4,sizeA3,sizeA2,sizeB1;
    Button add_btn;
    EditText description,quantity;
    RadioButton radiobutton;
    Things things = new Things();
    RadioGroup radioGroup;

    ImageView img;
    int currentimg = 0;
    String PaperSize,Orin,paper;
    String type="poster";
    MyDbHandler db = new MyDbHandler(posterActivity.this);
//    Intent intent = getIntent();
//    int receivedValue = intent.getIntExtra("keyName",2);
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_poster);
        radioGroup=findViewById(R.id.radioGroup);
        sizeA4=findViewById(R.id.sizeA4);
        sizeA3=findViewById(R.id.sizeA3);
        sizeA2=findViewById(R.id.sizeA2);
        sizeB1=findViewById(R.id.sizeB1);
        portrait=findViewById(R.id.portrait);
        landscape=findViewById(R.id.landscape);
        mattcoated=findViewById(R.id.mattcoated);
        glosscoated=findViewById(R.id.glosscoated);
        whitecoated=findViewById(R.id.whitecoated);
        add_btn=findViewById(R.id.add_btn);
        add_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                things.setType(type);
                things.setSize(PaperSize);
                things.setPrintingOrient(Orin);
                things.setPaper(paper);
                things.setDescription(description.getText().toString());
                things.setInstallation(radiobutton.getText().toString());
//                things.setCustomerId(receivedValue);

               db.addThings(things);
                Toast.makeText(posterActivity.this, "successfully entered", Toast.LENGTH_SHORT).show();
            }
        });
        whitecoated.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                paper="whitecoated";
            }
        });
        glosscoated.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                paper="glosscoated";
            }
        });
        mattcoated.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                paper="mattcoated";
            }
        });
        landscape.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Orin="landscape";
            }
        });
        portrait.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Orin="portrait";
            }

        });




        A4=findViewById(R.id.A4);
        A4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                PaperSize=sizeA4.getText().toString();
            }
        });
        A3=findViewById(R.id.A3);
        A3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                PaperSize=sizeA3.getText().toString();
            }
        });
        A2=findViewById(R.id.A2);
        A2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                PaperSize=sizeA3.getText().toString();
            }
        });
        B1=findViewById(R.id.B1);
        B1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                PaperSize="B1";
            }
        });







    }
    public void checkbutton(View view)
    {
        int radioId = radioGroup.getCheckedRadioButtonId();
        radiobutton=findViewById(radioId);
        Toast.makeText(this,"selected"+radiobutton.getText(),Toast.LENGTH_SHORT).show();

    }



    public void prev(View v) {
        String idX = "img" + currentimg;
        int x = this.getResources().getIdentifier(idX, "id", getPackageName());
        img = findViewById(x);
        img.setAlpha(0f);
        currentimg = (3 + currentimg - 1) % 3;
        String idY = "img" + currentimg;
        int y = this.getResources().getIdentifier(idY, "id", getPackageName());
        img = findViewById(y);
        img.setAlpha(1f);
    }

    public void next(View v) {
        String idX = "img" + currentimg;
        int x = this.getResources().getIdentifier(idX, "id", getPackageName());
        img = findViewById(x);
        img.setAlpha(0f);
        currentimg = (3 + currentimg + 1) % 3;
        String idY = "img" + currentimg;
        int y = this.getResources().getIdentifier(idY, "id", getPackageName());
        img = findViewById(y);
        img.setAlpha(1f);
    }
}