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

    ImageButton prev, next, A4, A3, A2, B1, portrait, landscape, mattcoated, glosscoated, whitecoated;
    TextView sizeA4, sizeA3, sizeA2, sizeB1,Price;
    Button add_btn,tick;
    EditText description, quantity;
    RadioButton radiobutton;

    RadioGroup radioGroup;
    int tprice,qu;

    ImageView img;
    int currentimg = 0;

    String PaperSize, Orin, paper, install,nam,dis;
    String type = "poster";




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_poster);
        Intent intent = getIntent();
        MyDbHandler db = new MyDbHandler(posterActivity.this);
        Things things = new Things();
//                dis=description.getText().toString();
//                int customerID = 1;
//
//                if (customerID != -1) {
        things.setType("poster");
        things.setSize("a2");
        things.setPrintingOrient("portrait");
        things.setPaper("paper");
        things.setDescription("good");
        things.setInstallation("yes");
//                    things.setCustomerId(customerID);
        things.setPrice(200);
        things.setQuantity(2);
        db.addThings(things);
        if (intent.hasExtra("USERNAME")) {
            nam = intent.getStringExtra("USERNAME");
            Toast.makeText(this, "Welcome, " + nam+ "!", Toast.LENGTH_SHORT).show();
        }
        radioGroup = findViewById(R.id.radioGroup);
        sizeA4 = findViewById(R.id.sizeA4);
        sizeA3 = findViewById(R.id.sizeA3);
        sizeA2 = findViewById(R.id.sizeA2);
        sizeB1 = findViewById(R.id.sizeB1);
        portrait = findViewById(R.id.portrait);
        landscape = findViewById(R.id.landscape);
        mattcoated = findViewById(R.id.mattcoated);
        glosscoated = findViewById(R.id.glosscoated);
        whitecoated = findViewById(R.id.whitecoated);
        add_btn = findViewById(R.id.add_btn);
        quantity=findViewById(R.id.quantity);

        tick=findViewById(R.id.tick);
        Price=findViewById(R.id.Price);


        tick.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                try {
                    int quant = Integer.parseInt(quantity.getText().toString());
                    int tprice = quant * 200;
                    qu=quant;
                    Price.setText(String.valueOf(tprice));

                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    Toast.makeText(posterActivity.this, "Invalid quantity", Toast.LENGTH_SHORT).show();
                }

            }
        });

        add_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                MyDbHandler db = new MyDbHandler(posterActivity.this);
//                Things things = new Things();
////                dis=description.getText().toString();
////                int customerID = 1;
////
////                if (customerID != -1) {
//                    things.setType(type);
//                    things.setSize(PaperSize);
//                    things.setPrintingOrient(Orin);
//                    things.setPaper(paper);
//                    things.setDescription(description.getText().toString());
//                    things.setInstallation(install);
////                    things.setCustomerId(customerID);
//                    things.setPrice(tprice);
//                    things.setQuantity(Integer.parseInt(quantity.getText().toString()));
//                    db.addThings(things);
//                    Toast.makeText(posterActivity.this, "Successfully entered", Toast.LENGTH_SHORT).show();
//                } else {
//                    Toast.makeText(posterActivity.this, "Error retrieving customerID", Toast.LENGTH_SHORT).show();
//                }
//                if (customerID != -1) {
//                    db.addThings(type,PaperSize,Orin,paper,dis,install,tprice,qu);
//                    Toast.makeText(posterActivity.this, "Successfully entered", Toast.LENGTH_SHORT).show();
//                } else {
//                    Toast.makeText(posterActivity.this, "Error retrieving customerID", Toast.LENGTH_SHORT).show();
//                }
            }
        });
        whitecoated.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                onpaperButtonClick("whitecoated");
            }
        });
        glosscoated.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                onpaperButtonClick("glosscoated");
            }
        });
        mattcoated.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                onpaperButtonClick("mattcoated");
            }
        });
        landscape.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                onorientButtonClick("landscape");
            }
        });
        portrait.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                onorientButtonClick("portrait");
            }

        });
        A4 = findViewById(R.id.A4);
        A4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                onSizeButtonClick("a4");
            }
        });
        A3 = findViewById(R.id.A3);
        A3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                onSizeButtonClick("a3");
            }
        });
        A2 = findViewById(R.id.A2);
        A2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                onSizeButtonClick("a2");
            }
        });
        B1 = findViewById(R.id.B1);
        B1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                onSizeButtonClick("b1");
            }
        });
    }

    private void onSizeButtonClick(String size) {
        PaperSize = size;  // Store the selected size in the class-level variable
        Toast.makeText(this, "Selected Size: " + PaperSize, Toast.LENGTH_SHORT).show();
    }

    private void onorientButtonClick(String or) {
        Orin = or;  // Store the selected size in the class-level variable
        Toast.makeText(this, "Selected Orientation: " + Orin, Toast.LENGTH_SHORT).show();
    }

    private void onpaperButtonClick(String pap) {
        paper = pap;  // Store the selected size in the class-level variable
        Toast.makeText(this, "Selected Paper: " + paper, Toast.LENGTH_SHORT).show();
    }

    public void checkbutton(View view) {
        int radioId = radioGroup.getCheckedRadioButtonId();
        radiobutton = findViewById(radioId);
        install = radiobutton.getText().toString();
        Toast.makeText(this, "selected" + install, Toast.LENGTH_SHORT).show();

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