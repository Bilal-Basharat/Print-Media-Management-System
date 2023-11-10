package com.example.pmms.model;

public class PrintMedia {
    private int Id;
    private String Firstname;
    private String Lastname;
    private String Email;
    private String Username;
    private String Password;
    private String Address;
    private String ContactInfo;

    public PrintMedia(int Id, String Firstname, String Lastname, String Email, String Username, String Password, String Address, String ContactInfo) {
        this.Id = Id;
        this.Firstname = Firstname;
        this.Lastname = Lastname;
        this.Email = Email;
        this.Username = Username;
        this.Password = Password;
        this.Address = Address;
        this.ContactInfo = ContactInfo;
    }
    public PrintMedia(String Firstname, String Lastname, String Email, String Username, String Password, String Address, String ContactInfo) {
        this.Firstname = Firstname;
        this.Lastname = Lastname;
        this.Email = Email;
        this.Username = Username;
        this.Password = Password;
        this.Address = Address;
        this.ContactInfo = ContactInfo;
    }
    public PrintMedia()
    {

    }


    public int getId() {
        return Id;
    }

    public String getFirstname() {
        return Firstname;
    }

    public String getLastname() {
        return Lastname;
    }

    public String getEmail() {
        return Email;
    }

    public String getUsername() {
        return Username;
    }

    public String getPassword() {
        return Password;
    }

    public String getAddress() {
        return Address;
    }

    public String getContactInfo() {
        return ContactInfo;
    }

    public void setId(int Id) {
        Id = Id;
    }

    public void setFirstname(String Firstname) {
        this.Firstname = Firstname;
    }

    public void setLastname(String Lastname) {
        this.Lastname = Lastname;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public void setContactInfo(String ContactInfo) {
        this.ContactInfo = ContactInfo;
    }
}
