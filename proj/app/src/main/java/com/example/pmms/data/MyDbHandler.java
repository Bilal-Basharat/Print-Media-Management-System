package com.example.pmms.data;
import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import androidx.annotation.Nullable;

import com.example.pmms.model.PrintMedia;
import com.example.pmms.model.Things;
import com.example.pmms.params.Params;

public class MyDbHandler extends SQLiteOpenHelper {
    public MyDbHandler(Context context) {
        super(context, Params.DB_NAME, null, Params.DB_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String create = "CREATE TABLE " + Params.TABLE_NAME + "("
                + Params.KEY_ID + " INTEGER PRIMARY KEY," + Params.KEY_FNAME
                + " TEXT, " + Params.KEY_LNAME + " TEXT, "  + Params.KEY_EMAIL
                + " TEXT, " + Params.KEY_UNAME + " TEXT, "+ Params.KEY_PASS
                + " TEXT, " + Params.KEY_ADDRESS + " TEXT, "+ Params.KEY_CONTACT
                + " TEXT" +")";
        Log.d("dbPRINT", "Query being run is : "+ create);

//        String create2 = "CREATE TABLE " + Params.TABLE_NAME2 + "("
//                + Params.KEY_TID + " INTEGER PRIMARY KEY," + Params.KEY_TYPE
//                + " TEXT, " + Params.KEY_SIZE + " TEXT, "  + Params.KEY_PRINTING
//                + " TEXT, " + Params.KEY_PAPER + " TEXT, "+ Params.KEY_DESCRIPTION
//                + " TEXT, " + Params.KEY_INSTALLATION + " TEXT, "+ Params.KEY_CUSTOMERID
//                + " INTEGER REFERENCES" + Params.TABLE_NAME + "(" + Params.KEY_ID + ")" + Params.KEY_PRICE + Params.KEY_QUANTITY+")";
//        Log.d("dbthing", "Query being run is : "+ create2);
//
//        db.execSQL(create2);
        String create2 = "CREATE TABLE " + "Things_Table" + "("
                + Params.KEY_TID + " INTEGER PRIMARY KEY," + Params.KEY_TYPE
                + " TEXT, " + Params.KEY_SIZE + " TEXT, "  + Params.KEY_PRINTING
                + " TEXT, " + Params.KEY_PAPER + " TEXT, "+ Params.KEY_DESCRIPTION
                + " TEXT, " + Params.KEY_INSTALLATION + " TEXT, "
                + Params.KEY_PRICE + " INTEGER, " + Params.KEY_QUANTITY + " INTEGER"+")";
        Log.d("dbthing", "Query being run is : "+ create2);
        db.execSQL(create);
        db.execSQL(create2);


    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int i, int i1) {
        db.execSQL("DROP TABLE IF EXISTS user_table");
        db.execSQL("DROP TABLE IF EXISTS Things_Table");
        onCreate(db);

    }
    public void addUser(PrintMedia users)
    {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(Params.KEY_FNAME, users.getFirstname());
        values.put(Params.KEY_LNAME, users.getLastname());
        values.put(Params.KEY_EMAIL, users.getEmail());
        values.put(Params.KEY_UNAME, users.getUsername());
        values.put(Params.KEY_PASS, users.getPassword());
        values.put(Params.KEY_ADDRESS, users.getAddress());
        values.put(Params.KEY_CONTACT, users.getContactInfo());

        db.insert(Params.TABLE_NAME, null, values);
        Log.d("dbPRINT", "Successfully inserted");
        db.close();
    }

    public void addThings(Things things)
    {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(Params.KEY_TYPE, things.getType());
        values.put(Params.KEY_SIZE, things.getSize());
        values.put(Params.KEY_PRINTING, things.getPrintingOrient());
        values.put(Params.KEY_PAPER, things.getPaper());
        values.put(Params.KEY_DESCRIPTION, things.getDescription());
        values.put(Params.KEY_INSTALLATION, things.getInstallation());
        values.put(Params.KEY_PRICE, things.getPrice());
        values.put(Params.KEY_QUANTITY,things.getQuantity());
        db.insert(Params.TABLE_NAME2, null, values);
        Log.d("dbthing", "success");
        db.close();
    }
//public void addThings(String type,String size, String orin, String paper,String descrip, String install,int price,int Quantity)
//    {
//        SQLiteDatabase db = this.getWritableDatabase();
//        ContentValues values = new ContentValues();
//        values.put(Params.KEY_TYPE, type);
//        values.put(Params.KEY_SIZE, size);
//        values.put(Params.KEY_PRINTING, orin);
//        values.put(Params.KEY_PAPER, paper);
//        values.put(Params.KEY_DESCRIPTION, descrip);
//        values.put(Params.KEY_INSTALLATION, install);
//
//        values.put(Params.KEY_PRICE, price);
//        values.put(Params.KEY_QUANTITY,Quantity);
//       db.insert(Params.TABLE_NAME2,null,values);
//        db.close();
//    }

//    public int getCustomerIdByUsername(String username) {
//        SQLiteDatabase db = this.getReadableDatabase();
//        int customerID = -1; // Default value if not found
//
//        Cursor cursor = db.rawQuery("SELECT " + Params.KEY_ID + " FROM " + Params.TABLE_NAME +
//                " WHERE " + Params.KEY_UNAME + "=?", new String[]{username});
//
//        if (cursor != null) {
//            if (cursor.moveToFirst()) {
//                int columnIndex = cursor.getColumnIndex(Params.KEY_ID);
//                if (columnIndex != -1) {
//                    customerID = cursor.getInt(columnIndex);
//                    Log.d("dbthing", "Retrieved customerID: " + customerID);
//                } else {
//                    Log.e("dbthing", "Column index not found for " + Params.KEY_ID);
//                }
//            }
//            cursor.close();
//        }
//
//        db.close(); // Close the database connection
//        return customerID;
//    }




    public boolean checkuserandpass(String username,String password)
    {
        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery("Select * from user_table where username=? and password=?", new String[]{username,password});
        if(cursor.getCount()>0)
        {
            return true;
        }
        else {
            return false;
        }
    }
    public boolean checkuserexist(String username)
    {
        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery("Select * from user_table where username=?", new String[]{username});
        if(cursor.getCount()>0)
        {
            return true;
        }
        else {
            return false;
        }
    }
    public void deleteUserById(int id){
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(Params.TABLE_NAME, Params.KEY_ID +"=?", new String[]{String.valueOf(id)});
        db.close();
    }


}
