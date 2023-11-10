package com.example.pmms;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.pmms.data.MyDbHandler;
import com.example.pmms.model.PrintMedia;

public class MainActivity extends AppCompatActivity {
    EditText firsttext,lasttext,emailtext,unametext,passtext,addresstext,contacttext;
    Button signup_btn,sign_in;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
//        MyDbHandler db = new MyDbHandler(MainActivity.this);
//        db.deleteUserById(14);
        firsttext=findViewById(R.id.firsttext);
        lasttext=findViewById(R.id.lasttext);
        emailtext=findViewById(R.id.emailtext);
        unametext=findViewById(R.id.unametext);
        passtext=findViewById(R.id.passtext);
        addresstext=findViewById(R.id.addresstext);
        contacttext=findViewById(R.id.contacttext);
        signup_btn=findViewById(R.id.signup_btn);
        sign_in=findViewById(R.id.sign_in);
        sign_in.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Sign_inScreen(view);
            }
        });
        signup_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                MyDbHandler db = new MyDbHandler(MainActivity.this);
                String fname =firsttext.getText().toString().trim();
                String lname =lasttext.getText().toString().trim();
                String email =emailtext.getText().toString().trim();
                String Uname =unametext.getText().toString().trim();
                String pass =passtext.getText().toString().trim();
                String add =addresstext.getText().toString().trim();
                String con =contacttext.getText().toString().trim();
                if(fname.equals("")||lname.equals("")||email.equals("")||Uname.equals("")||pass.equals("")||add.equals("")||con.equals(""))
                {
                    Toast.makeText(MainActivity.this, "Please enter all the fields", Toast.LENGTH_SHORT).show();
                }
                else{
                    Boolean checkuser = db.checkuserexist(Uname);
                    if(checkuser == false)
                    {
                        PrintMedia users = new PrintMedia();

                        users.setFirstname(firsttext.getText().toString().trim());
                        users.setLastname(lasttext.getText().toString().trim());
                        users.setEmail(emailtext.getText().toString().trim());
                        users.setUsername(unametext.getText().toString().trim());
                        users.setPassword(passtext.getText().toString().trim());
                        users.setAddress( addresstext.getText().toString().trim());
                        users.setContactInfo(contacttext.getText().toString().trim());
                        db.addUser(users);
                        Toast.makeText(MainActivity.this, "successfully registered", Toast.LENGTH_SHORT).show();
                    }
                    else{
                        Toast.makeText(MainActivity.this, "Already exist", Toast.LENGTH_SHORT).show();
                    }
                }


            }
        });


    }
    public void Sign_inScreen(View view)
    {
        Intent intent = new Intent(this, loginActivity.class);
        startActivity(intent);

    }
}