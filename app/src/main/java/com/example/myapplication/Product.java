package com.example.myapplication;
public class Product {
    private String name;
    private int image; // resource ID for the image
    private double price;
    private String desc;
    private boolean inBasket;

    public Product(String s, double v) {
    }

    public Product(String name, int image, double price, String desc, boolean inBasket) {
        this.name=name;
        this.image=image;
        this.price=price;
        this.desc=desc;
        this.inBasket=inBasket;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return  price;
    }

    public String getDesc() {
        return  desc;
    }

    public void setInBasket(boolean b) {
        inBasket=b;
    }

    public int getImage() {
        return  image;
    }

    public boolean isInBasket() {
        return  inBasket;
    }

    // constructor, getters, and setters
}
