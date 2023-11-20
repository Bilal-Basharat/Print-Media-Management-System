package com.example.pmms.model;

public class Things {
    private int TId;
    private String Type;
    private String Size;
    private String PrintingOrient;
    private String Paper;
    private String Description;
    private String Installation;

    private int Price;
    private int Quantity;

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getPrice() {
        return Price;
    }




    public Things(int TId, String Type, String Size, String PrintingOrient, String Paper, String Description, String Installation, int Price, int Quantity) {
        this.TId = TId;
        this.Type = Type;
        this.Size = Size;
        this.PrintingOrient = PrintingOrient;
        this.Paper = Paper;
        this.Description = Description;
        this.Installation = Installation;

        this.Price=Price;
        this.Quantity=Quantity;
    }
    public Things() {

    }

    public void setTId(int TId) {
        this.TId = TId;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public void setPrintingOrient(String PrintingOrient) {
        this.PrintingOrient = PrintingOrient;
    }

    public void setPaper(String Paper) {
        this.Paper = Paper;
    }

    public void setDescription(String Description) {
        this. Description = Description;
    }

    public void setInstallation(String Installation) {
        this.Installation = Installation;
    }

    public int getTId() {
        return TId;
    }

    public String getType() {
        return Type;
    }

    public String getSize() {
        return Size;
    }

    public String getPrintingOrient() {
        return PrintingOrient;
    }

    public String getPaper() {
        return Paper;
    }

    public String getDescription() {
        return Description;
    }

    public String getInstallation() {
        return Installation;
    }
}
