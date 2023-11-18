package com.example.pmms;



import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.pmms.data.MyDbHandler;
import com.example.pmms.params.Params;

public class loginActivity extends AppCompatActivity {
    EditText s_Uname,s_pass;
    Button signupbtn,signIn_btn;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_login);
        s_Uname=findViewById(R.id.s_Uname);
        s_pass=findViewById(R.id.s_pass);
        signIn_btn=findViewById(R.id.signIn_btn);
        signupbtn=findViewById(R.id.signupbtn);
        signupbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Sign_UpScreen(view);
            }
        });
        signIn_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                MyDbHandler db = new MyDbHandler(loginActivity.this);
                String username=s_Uname.getText().toString();
                String Password=s_pass.getText().toString();
                if(username.equals("")||Password.equals("")) {
                    Toast.makeText(loginActivity.this, "Please enter all the fields", Toast.LENGTH_SHORT).show();
                }
                else{
                    Boolean checkuser = db.checkuserandpass(username,Password);
                    if (checkuser == true)
                    {
                        Toast.makeText(loginActivity.this,"Sign in successfully", Toast.LENGTH_SHORT).show();
                        Intent intent = new Intent(getApplicationContext(), MainmenuActivity.class);
                        startActivity(intent);

//                        int valueToPass = 1;

//                        Intent intent2 = new Intent(loginActivity.this, posterActivity.class);
//                        intent2.putExtra("keyName", valueToPass);
//                        startActivity(intent2);
                    }
                    else {
                        Toast.makeText(loginActivity.this,"Invalid Credentials", Toast.LENGTH_SHORT).show();
                    }
                }
            }
        });
//
    }
    public void Sign_UpScreen(View view)
    {
        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);

    }
}